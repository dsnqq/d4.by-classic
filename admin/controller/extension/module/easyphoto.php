<?php
class ControllerExtensionModuleEasyPhoto extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/easyphoto');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->model_setting_setting->editSetting('easyphoto', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_direct'] = $this->language->get('entry_direct');
		$data['entry_prefix'] = $this->language->get('entry_prefix');
		$data['entry_separator'] = $this->language->get('entry_separator');
		$data['text_manual'] = $this->language->get('text_manual');
		$data['easyphoto_direct_help'] = $this->language->get('easyphoto_direct_help');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $data['heading_title'],
			'href' => $this->url->link('extension/module/easyphoto', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/easyphoto', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->post['easyphoto_status'])) {
			$data['easyphoto_status'] = $this->request->post['easyphoto_status'];
		} else {
			$data['easyphoto_status'] = $this->config->get('easyphoto_status');
		}

		if (isset($this->request->post['easyphoto_code'])) {
			$data['easyphoto_direct'] = $this->request->post['easyphoto_direct'];
		} else {
			$data['easyphoto_direct'] = $this->config->get('easyphoto_direct');
		}		
		
		if (isset($this->request->post['easyphoto_prefix'])) {
			$data['easyphoto_prefix'] = $this->request->post['easyphoto_prefix'];
		} else {
			$data['easyphoto_prefix'] = $this->config->get('easyphoto_prefix');
		}
		
		if (isset($this->request->post['easyphoto_separator'])) {
			$data['easyphoto_separator'] = $this->request->post['easyphoto_separator'];
		} else {
			$data['easyphoto_separator'] = $this->config->get('easyphoto_separator');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/easyphoto', $data));
	}

	public function transform($string){
        $arr = array( 
                       'А' => 'A' , 'Б' => 'B' , 'В' => 'V'  , 'Г' => 'G', 
                       'Д' => 'D' , 'Е' => 'E' , 'Ё' => 'JO' , 'Ж' => 'ZH', 
                       'З' => 'Z' , 'И' => 'I' , 'Й' => 'JJ' , 'К' => 'K', 
                       'Л' => 'L' , 'М' => 'M' , 'Н' => 'N'  , 'О' => 'O', 
                       'П' => 'P' , 'Р' => 'R' , 'С' => 'S'  , 'Т' => 'T', 
                       'У' => 'U' , 'Ф' => 'F' , 'Х' => 'KH' , 'Ц' => 'C', 
                       'Ч' => 'CH', 'Ш' => 'SH', 'Щ' => 'SHH', 'Ъ' => '"', 
                       'Ы' => 'Y' , 'Ь' => '', 'Э' => 'EH' , 'Ю' => 'JU', 
                       'Я' => 'JA', 
                       'а' => 'a' , 'б' => 'b'  , 'в' => 'v' , 'г' => 'g', 'д' => 'd', 
                       'е' => 'e' , 'ё' => 'jo' , 'ж' => 'zh', 'з' => 'z', 'и' => 'i', 
                       'й' => 'jj', 'к' => 'k'  , 'л' => 'l' , 'м' => 'm', 'н' => 'n', 
                       'о' => 'o' , 'п' => 'p'  , 'р' => 'r' , 'с' => 's', 'т' => 't', 
                       'у' => 'u' , 'ф' => 'f'  , 'х' => 'kh', 'ц' => 'c', 'ч' => 'ch', 
                       'ш' => 'sh', 'щ' => 'shh', 'ъ' => '"' , 'ы' => 'y', 'ь' => '_', 
                       'э' => 'eh', 'ю' => 'ju' , 'я' => 'ja', ' ' => '_'
                    ); 
		$key = array_keys($arr);
		$val = array_values($arr);
		$translate = str_replace($key, $val, $string);
		return $translate;
	}	
	
	public function upload() {

		$json = array();
		$json['error'] = false;
		
		$direct = $this->config->get('easyphoto_direct')?$this->config->get('easyphoto_direct'):'easyphoto';
		$prefix = $json['prefix'] = $this->config->get('easyphoto_prefix')?$this->config->get('easyphoto_prefix'):'dmYh';
		$separator = $json['separator'] = $this->config->get('easyphoto_separator')?$this->config->get('easyphoto_separator'):'1000';
		
		$json['status'] = $this->config->get('easyphoto_status');
		
		$product_id = $this->request->get['product_id'];
		
		if(!$product_id){
			$directory = DIR_IMAGE . 'catalog/' . $direct;
			$json['direct'] = $direct;
		}else{
			for($ids=0; $ids<1000*$separator; $ids += $separator){
				$finish = $ids+$separator;
				if($product_id > $ids and $product_id <= $finish){
					$path = $json['direct'] = $direct . '/' . $ids . '_' . $finish . '/' . $product_id;
					$directory = DIR_IMAGE . 'catalog/' . $path;
				}
			}
		}
		if (!is_dir($directory)) {
			mkdir($directory, 0777, true);
		}

		if (!empty($this->request->files['file']['name'])) {
			$fileNames = array();
			foreach ($this->request->files['file']['name'] as $key => $value) {

				$filename = $this->transform(basename(html_entity_decode($value, ENT_QUOTES, 'UTF-8')));

				if ((utf8_strlen($filename) < 1) || (utf8_strlen($filename) > 5555000)) {
					$json['error'] = true;
				}

				$allowed = array(
					'jpg',
					'jpeg',
					'gif',
					'png'
				);

				if (!in_array(utf8_strtolower(utf8_substr(strrchr($filename, '.'), 1)), $allowed)) {
					$json['error'] = true;
				}

				$allowed = array(
					'image/jpeg',
					'image/pjpeg',
					'image/png',
					'image/x-png',
					'image/gif'
				);

				if (!in_array($this->request->files['file']['type'][$key], $allowed)) {
					$json['error'] = true;
				}

				$content = file_get_contents($this->request->files['file']['tmp_name'][$key]);

				if (preg_match('/\<\?php/i', $content)) {
					$json['error'] = true;
				}

				if ($this->request->files['file']['error'][$key] != UPLOAD_ERR_OK) {
					$json['error'] = true;
				}

				array_push($fileNames, $filename); 
			}
		} else {
			$json['error'] = true;
		}
		
		$json['files'] = array();
			
		if (!$json['error']) {
            foreach ($this->request->files['file']['name'] as $key => $value) {
				$file_name_final = date($prefix).'_'.$fileNames[$key];
                move_uploaded_file($this->request->files['file']['tmp_name'][$key], $directory . '/' . $file_name_final);
				$json['files'][] = $file_name_final;
            }

			$json['success'] = $this->language->get('text_uploaded');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}		

}