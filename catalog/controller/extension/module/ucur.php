<?php
class ControllerExtensionModuleUcur extends Controller {

    public function update () {

    	if (!isset($this->request->get['token']) || $this->request->get['token'] != hash_hmac('sha256', md5('ucur'), $this->config->get('config_encryption'))) {
    		$this->load->controller('error/not_found');
    	}
    	else{
    		if ($this->config->get('ucur_status')) {
    			if (isset($this->request->get['force'])){
    				$force = (bool) $this->request->get['force'];
    			}
    			else{
    				$force = false;
    			}
    			$query = $this->getRates($force);
    			foreach ($query->rows as $result) {
					$codes[] = $result['code'];
					$rates[] = $result;
				}
				if (isset($codes)){
    				$curses = $this->address($this->config->get('ucur_addr'), $codes, $rates, $this->config->get('config_currency'));
    				// var_dump($curses);
    				if ($curses) {
    					$this->save($curses);
    				}
    			}
    			echo '200 OK';
    		}
    		else {
    			echo 'Error: Mod Status - OFF';
    		}
    	}
    }

    private function save ($curses) {

    	if ($this->config->get('ucur_proc')){
    		$proc = $this->config->get('ucur_proc');
    		foreach ($curses as $cur) {
	    		if ((float)$cur['value']) {
	    			$this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . (float) ($cur['value'] + ($cur['value']*$proc/100)) . "', date_modified = '" .  $this->db->escape(date('Y-m-d H:i:s')) . "' WHERE code = '" . $this->db->escape($cur['code']) . "'");
	    		}
	    	}
    	}
    	else{
    		foreach ($curses as $cur) {
	    		if ((float)$cur['value']) {
	    			$this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . (float)$cur['value'] . "', date_modified = '" .  $this->db->escape(date('Y-m-d H:i:s')) . "' WHERE code = '" . $this->db->escape($cur['code']) . "'");
	    		}
	    	}
    	}

    	

    	$this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '1.00000', date_modified = '" .  $this->db->escape(date('Y-m-d H:i:s')) . "' WHERE code = '" . $this->db->escape($this->config->get('config_currency')) . "'");

    	$this->cache->delete('currency');

    }

    private function address ($addr, $codes, $rates, $dcur) {

    	if ($addr) {
			return $this->$addr($codes, $rates, $dcur);
    	}
    	else {
    		return $this->cbrf($codes, $rates, $dcur);
    	}

    }

    private function getRates ($force) {

    	if ($force == true) {
			return $query = $this->db->query("SELECT `code`, `value` FROM " . DB_PREFIX . "currency WHERE code != '" . $this->db->escape($this->config->get('config_currency')) . "'");
		} else {
			return $query = $this->db->query("SELECT `code`, `value` FROM " . DB_PREFIX . "currency WHERE code != '" . $this->db->escape($this->config->get('config_currency')) . "' AND date_modified < '" .  $this->db->escape(date('Y-m-d H:i:s', strtotime('-1 day'))) . "'");
		}

    }

    private function getRequest ($server) {
    	$result = false;

    	if ( $curl = curl_init() ) {
					curl_setopt($curl, CURLOPT_URL, $server);
					curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
					curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
					curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
			        $result = curl_exec($curl);
			        curl_close($curl);
		}

		if (!$result) {
			$result = file_get_contents($server);
		}

		if ($result) {
			return $result;
		}
		else{
			$this->log->write('UCur Error: No data in request (' . $server . ')');
		}
    }


    private function cbrf ($codes, $rates, $dcur) {
    	$xml = $this->getRequest('https://www.cbr.ru/scripts/XML_daily.asp?date_req='.date('d/m/Y'));
    	$data = json_decode(json_encode(simplexml_load_string($xml)));
    	$curses = array();

    	$i = 0;

    	if ($dcur == 'RUB') {
			foreach ($data->Valute as $uc) {
	    		if (in_array($uc->CharCode, $codes)){
		    		$curses[$i]['code'] = $uc->CharCode;
		    		$curses[$i]['value'] = 1 / (str_replace(",", ".", $uc->Value) / $uc->Nominal);
		    		$i += 1;
		    	}
	    	}
	    }
	    else{

	    	foreach ($data->Valute as $uc) {
	    		if ($uc->CharCode == $dcur) {
	    			
	    			if (str_replace(",", ".", $uc->Value) / $uc->Nominal < 1){
		    			$dcur_value = (float) 1 / (1 / (str_replace(",", ".", $uc->Value) / $uc->Nominal));
		    		}
		    		else{
		    			$dcur_value = (float) str_replace(",", ".", $uc->Value) / $uc->Nominal;
		    		}
		    		if (in_array('RUB', $codes)){
		    			$curses[$i]['code'] = 'RUB';
			    		$curses[$i]['value'] = $dcur_value;
			    		$i += 1;
			    	}
		    		break;

	    		}

	    	}


	    	foreach ($data->Valute as $uc) {

	    		if (in_array($uc->CharCode, $codes)){
		    		$curses[$i]['code'] = $uc->CharCode;
		    		$curses[$i]['value'] = $dcur_value / (str_replace(",", ".", $uc->Value) / $uc->Nominal);
		    		$i += 1;
		    	}
	    	}

	    }


    	return $curses;

    }

    private function govua ($codes, $rates, $dcur) {
    	$xml = $this->getRequest('https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange');
    	$data = json_decode(json_encode(simplexml_load_string($xml)));
    	$curses = array();

    	$i = 0;

    	if ($dcur == 'UAH') {
			foreach ($data->currency as $uc) {
	    		if (in_array($uc->cc, $codes)){
		    		$curses[$i]['code'] = $uc->cc;
		    		$curses[$i]['value'] = 1 / str_replace(",", ".", $uc->rate);
		    		$i += 1;
		    	}
	    	}
	    }
	    else{

	    	foreach ($data->currency as $uc) {
	    		if ($uc->cc == $dcur) {
	    			if ($uc->rate < 1) {
		    			$dcur_value = (float) 1 / (1 / str_replace(",", ".", $uc->rate));
		    		}
		    		else{
		    			$dcur_value = (float) str_replace(",", ".", $uc->rate);
		    		}
		    		if (in_array('UAH', $codes)){
		    			$curses[$i]['code'] = 'UAH';
			    		$curses[$i]['value'] = $dcur_value;
			    		$i += 1;
			    	}
		    		break;
	    		}

	    	}


	    	foreach ($data->currency as $uc) {

	    		if (in_array($uc->cc, $codes)){
		    		$curses[$i]['code'] = $uc->cc;
		    		$curses[$i]['value'] = $dcur_value / str_replace(",", ".", $uc->rate);
		    		$i += 1;
		    	}
	    	}

	    }


    	return $curses;
    }

    private function privat ($codes, $rates, $dcur) {
    	$xml = $this->getRequest('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5');
    	$data = json_decode($xml);
    	$curses = array();
    	$i = 0;

    	if ($dcur == 'UAH') {
			foreach ($data as $uc) {
				if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if (in_array($uc->ccy, $codes)){
		    		$curses[$i]['code'] = $uc->ccy;
		    		$curses[$i]['value'] = 1 / str_replace(",", ".", $uc->buy);
		    		$i += 1;
		    	}
	    	}
	    }
	    else{

	    	foreach ($data as $uc) {
	    		if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if ($uc->ccy == $dcur) {
	    			if ($uc->sale < 1) {
		    			$dcur_value = (float) 1 / (1 / str_replace(",", ".", $uc->sale));
		    		}
		    		else{
		    			$dcur_value = (float) str_replace(",", ".", $uc->sale);
		    		}
		    		if (in_array('UAH', $codes)){
		    			$curses[$i]['code'] = 'UAH';
			    		$curses[$i]['value'] = $dcur_value;
			    		$i += 1;
			    	}

		    		break;
	    		}

	    	}


	    	foreach ($data as $uc) {
	    		if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if (in_array($uc->ccy, $codes)){
		    		$curses[$i]['code'] = $uc->ccy;
		    		$curses[$i]['value'] = $dcur_value / str_replace(",", ".", $uc->buy);
		    		$i += 1;
		    	}
	    	}

	    }


    	return $curses;
    }

    private function privat2 ($codes, $rates, $dcur) {
    	$xml = $this->getRequest('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5');
    	$data = json_decode($xml);
    	$curses = array();
    	$i = 0;

    	if ($dcur == 'UAH') {
			foreach ($data as $uc) {
				if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if (in_array($uc->ccy, $codes)){
		    		$curses[$i]['code'] = $uc->ccy;
		    		$curses[$i]['value'] = 1 / str_replace(",", ".", $uc->sale);
		    		$i += 1;
		    	}
	    	}
	    }
	    else{

	    	foreach ($data as $uc) {
	    		if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if ($uc->ccy == $dcur) {
	    			if ($uc->buy < 1) {
		    			$dcur_value = (float) 1 / (1 / str_replace(",", ".", $uc->buy));
		    		}
		    		else{
		    			$dcur_value = (float) str_replace(",", ".", $uc->buy);
		    		}
		    		if (in_array('UAH', $codes)){
		    			$curses[$i]['code'] = 'UAH';
			    		$curses[$i]['value'] = $dcur_value;
			    		$i += 1;
			    	}

		    		break;
	    		}

	    	}


	    	foreach ($data as $uc) {
	    		if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if (in_array($uc->ccy, $codes)){
		    		$curses[$i]['code'] = $uc->ccy;
		    		$curses[$i]['value'] = $dcur_value / str_replace(",", ".", $uc->sale);
		    		$i += 1;
		    	}
	    	}

	    }


    	return $curses;
    }

    private function privat3 ($codes, $rates, $dcur) {
    	$xml = $this->getRequest('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=11');
    	$data = json_decode($xml);
    	$curses = array();
    	$i = 0;

    	if ($dcur == 'UAH') {
			foreach ($data as $uc) {
				if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if (in_array($uc->ccy, $codes)){
		    		$curses[$i]['code'] = $uc->ccy;
		    		$curses[$i]['value'] = 1 / str_replace(",", ".", $uc->buy);
		    		$i += 1;
		    	}
	    	}
	    }
	    else{

	    	foreach ($data as $uc) {
	    		if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if ($uc->ccy == $dcur) {
	    			if ($uc->sale < 1) {
		    			$dcur_value = (float) 1 / (1 / str_replace(",", ".", $uc->sale));
		    		}
		    		else{
		    			$dcur_value = (float) str_replace(",", ".", $uc->sale);
		    		}
		    		if (in_array('UAH', $codes)){
		    			$curses[$i]['code'] = 'UAH';
			    		$curses[$i]['value'] = $dcur_value;
			    		$i += 1;
			    	}

		    		break;
	    		}

	    	}


	    	foreach ($data as $uc) {
	    		if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if (in_array($uc->ccy, $codes)){
		    		$curses[$i]['code'] = $uc->ccy;
		    		$curses[$i]['value'] = $dcur_value / str_replace(",", ".", $uc->buy);
		    		$i += 1;
		    	}
	    	}

	    }


    	return $curses;
    }

    private function privat4 ($codes, $rates, $dcur) {
    	$xml = $this->getRequest('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=11');
    	$data = json_decode($xml);
    	$curses = array();
    	$i = 0;

    	if ($dcur == 'UAH') {
			foreach ($data as $uc) {
				if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if (in_array($uc->ccy, $codes)){
		    		$curses[$i]['code'] = $uc->ccy;
		    		$curses[$i]['value'] = 1 / str_replace(",", ".", $uc->sale);
		    		$i += 1;
		    	}
	    	}
	    }
	    else{

	    	foreach ($data as $uc) {
	    		if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if ($uc->ccy == $dcur) {
	    			if ($uc->buy < 1) {
		    			$dcur_value = (float) 1 / (1 / str_replace(",", ".", $uc->buy));
		    		}
		    		else{
		    			$dcur_value = (float) str_replace(",", ".", $uc->buy);
		    		}
		    		if (in_array('UAH', $codes)){
		    			$curses[$i]['code'] = 'UAH';
			    		$curses[$i]['value'] = $dcur_value;
			    		$i += 1;
			    	}

		    		break;
	    		}

	    	}


	    	foreach ($data as $uc) {
	    		if ($uc->ccy == 'RUR') { $uc->ccy = 'RUB'; }
	    		if (in_array($uc->ccy, $codes)){
		    		$curses[$i]['code'] = $uc->ccy;
		    		$curses[$i]['value'] = $dcur_value / str_replace(",", ".", $uc->sale);
		    		$i += 1;
		    	}
	    	}

	    }


    	return $curses;
    }

    private function nbrb ($codes, $rates, $dcur) {
    	$xml = $this->getRequest('https://www.nbrb.by/API/ExRates/Rates?Periodicity=0');
    	$data = json_decode($xml);
    	$curses = array();
    	$i = 0;

    	if ($dcur == 'BYN') {
			foreach ($data as $uc) {
	    		if (in_array($uc->Cur_Abbreviation, $codes)){
		    		$curses[$i]['code'] = $uc->Cur_Abbreviation;
		    		$curses[$i]['value'] = 1 / str_replace(",", ".", $uc->Cur_OfficialRate) * $uc->Cur_Scale;
		    		$i += 1;
		    	}
	    	}
	    }
	    else{

	    	foreach ($data as $uc) {
	    		if ($uc->Cur_Abbreviation == $dcur) {
	    			
	    			if ($uc->Cur_Scale > 1) { 
		    			$dcur_value = (float) str_replace(",", ".", $uc->Cur_OfficialRate) / $uc->Cur_Scale ;
		    		}
		    		else{
		    			$dcur_value = (float) str_replace(",", ".", $uc->Cur_OfficialRate) * $uc->Cur_Scale ;
		    		}

		    		if (in_array('BYN', $codes)){
		    			$curses[$i]['code'] = 'BYN';
			    		$curses[$i]['value'] = $dcur_value;
			    		$i += 1;
			    	}
		    		break;
	    		}

	    	}


	    	foreach ($data as $uc) {
	    		if (in_array($uc->Cur_Abbreviation, $codes)){
		    		$curses[$i]['code'] = $uc->Cur_Abbreviation;
		    		$curses[$i]['value'] = $dcur_value / str_replace(",", ".", $uc->Cur_OfficialRate)  * $uc->Cur_Scale;
		    		$i += 1;
		    	}
	    	}

	    }


    	return $curses;
    }

    private function ecbt ($codes, $rates, $dcur) {
    	$xml = $this->getRequest('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml');
    	$data = json_decode(json_encode(simplexml_load_string($xml)));
    	$curses = array();
    	$i = 0;

    	if ($dcur == 'EUR') {
			foreach ($data->Cube->Cube->Cube as $atr) {
				foreach ($atr as $uc) {
		    		if (in_array($uc->currency, $codes)){
			    		$curses[$i]['code'] = $uc->currency;
			    		$curses[$i]['value'] = str_replace(",", ".", $uc->rate);
			    		$i += 1;
			    	}
			    }
	    	}
	    }
	    else{

	    	foreach ($data->Cube->Cube->Cube as $atr) {
	    		foreach ($atr as $uc) {
		    		if ($uc->currency == $dcur) {
		    			if (str_replace(",", ".", $uc->rate) > 1){
			    			$dcur_value = (float) 1 / (1 / str_replace(",", ".", $uc->rate));
			    		}
			    		else{
			    			$dcur_value = (float) str_replace(",", ".", $uc->rate);
			    		}
			    		if (in_array('EUR', $codes)){
			    			$curses[$i]['code'] = 'EUR';
			    			
				    		$curses[$i]['value'] = $dcur_value;
				    		
				    		$i += 1;
				    	}

			    		break;
		    		}
		    	}

	    	}


	    	foreach ($data->Cube->Cube->Cube as $atr) {
	    		foreach ($atr as $uc) {
		    		if (in_array($uc->currency, $codes)){
			    		$curses[$i]['code'] = $uc->currency;
			    		$curses[$i]['value'] =  str_replace(",", ".", $uc->rate) / $dcur_value;
			    		$i += 1;
			    	}
			    }
	    	}

	    }


    	return $curses;

    }

}
?>