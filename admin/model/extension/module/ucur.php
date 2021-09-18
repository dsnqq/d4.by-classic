<?php
class ModelExtensionModuleUcur extends Model {

    public function update($force) {

    	$result = false;

        $server = HTTPS_CATALOG . 'index.php?route=extension/module/ucur/update&token='.hash_hmac('sha256', md5('ucur'), $this->config->get('config_encryption')) . '&force='.$force;

        if ($curl = curl_init()) {
            curl_setopt($curl, CURLOPT_URL, $server);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_USERAGENT, 'art&pr-opencart-ucur');
            $result = curl_exec($curl);
            curl_close($curl);
            
        }

        if (!$result) {
            $result = file_get_contents($server);
        }

        return $result;

        if (!$result) {
			$this->log->write('UCur Error: No data in request (' . $server . ')');
		}

    }
}
