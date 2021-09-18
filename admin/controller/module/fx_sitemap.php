<?php
class ControllerModulefxsitemap extends Controller {
	private $error = array();

	public function index() {
	
		$this->load->language('module/fx_sitemap');
		
		$this->document->setTitle('FX Sitemap 2.0');

		$this->load->model('setting/setting');		
		
		$host = $this->config->get('config_ssl') ? HTTPS_CATALOG : HTTP_CATALOG;
		
        $text_strings = array(
            'heading_title',
            'text_edit',
        	'text_no',
        	'text_yes',
        	'button_save',
        	'button_cancel',		
        	'text_success',
        	'text_modules',
        	'text_defalt',
        	'text_key',
         );

        foreach ($text_strings as $text) {
            $data[$text] = $this->language->get($text);
        }
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
        	$this->model_setting_setting->editSetting('fx_sitemap', $this->request->post);
        	$this->session->data['success'] = $this->language->get('text_success');
			
			if ((float)VERSION < 1.9){ 
				$this->redirect($this->url->link('module/fx_sitemap', 'token=' . $this->session->data['token'], 'SSL'));
			} else if ((float)VERSION < 2.3){ 
				$this->response->redirect($this->url->link('module/fx_sitemap', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->response->redirect($this->url->link('extension/module/fx_sitemap', 'token=' . $this->session->data['token'], 'SSL'));
			}
        }
        
		
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['token'] = $this->session->data['token'];

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => '/admin?token=' . $this->session->data['token'],
        );
		
		if ((float)VERSION < 2.3){ 
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			);
			$data['breadcrumbs'][] = array(
				'text'      => 'Specials SEO',
				'href'      => $this->url->link('module/fx_sitemap', 'token=' . $this->session->data['token'], 'SSL'),
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
			);
			$data['breadcrumbs'][] = array(
				'text'      => 'FX Sitemap 2.0',
				'href'      => $this->url->link('extension/module/fx_sitemap', 'token=' . $this->session->data['token'], 'SSL'),
			);			
		}
		

		$languages = $this->model_localisation_language->getLanguages();
		
		$data['action'] = $this->url->link('module/fx_sitemap/savedata', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');	

		if ((float)VERSION >= 2.3){ 
			$data['action'] = $this->url->link('extension/module/fx_sitemap/savedata', 'token=' . $this->session->data['token'], 'SSL');
			$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
		}
		
		if (file_exists(DIR_CATALOG . 'controller/feed/google_sitemap.php')) {
			$host .= 'index.php?route=feed/google_sitemap';
		} else { $host .= 'index.php?route=extension/feed/google_sitemap'; }
		
		
		if (isset($this->request->post['fx_sitemap_default'])) {
			$data['fx_sitemap_default'] = $this->request->post['fx_sitemap_default'];
		} else if($this->config->get('fx_sitemap_default') !== null) {
			$data['fx_sitemap_default'] = $this->config->get('fx_sitemap_default');
		}
        else {
        	$data['fx_sitemap_default'] = $host;
        }
		
		
		if (isset($this->request->post['fx_sitemap_key'])) {
			$data['fx_sitemap_key'] = $this->request->post['fx_sitemap_key'];
		} else if($this->config->get('fx_sitemap_key') !== null) {
			$data['fx_sitemap_key'] = $this->config->get('fx_sitemap_key');
		}
        else {
        	$data['fx_sitemap_key'] = rand();
        }
		
		if (isset($this->request->post['fx_sitemap_log'])) {
			$data['fx_sitemap_log'] = $this->request->post['fx_sitemap_log'];
		} else if($this->config->get('fx_sitemap_log') !== null) {
			$data['fx_sitemap_log'] = $this->config->get('fx_sitemap_log');
		}
        else {
        	$data['fx_sitemap_log'] = 0;
        }
		
		
		if ((float)VERSION < 2) { 
			$this->data = $this->data + $data;
			$this->load->model('design/layout');
			
			$this->data['layouts'] = $this->model_design_layout->getLayouts();

			$this->template = 'module/fx_sitemap.tpl';
			$this->children = array(
				'common/header',
				'common/footer'
			);
					
			$this->response->setOutput($this->render());
		} else {
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('module/fx_sitemap.tpl', $data));
		}	
	}
	
	public function savedata() {
	
		$this->load->language('module/fx_sitemap');
		
        $text_strings = array(	
        	'text_success'
         );

        foreach ($text_strings as $text) {
            $data[$text] = $this->language->get($text);
        }

		$this->load->model('setting/setting');
		$this->load->model('localisation/language');
		
		$languages = $this->model_localisation_language->getLanguages();

			
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
        	$this->model_setting_setting->editSetting('fx_sitemap', $this->request->post);
        	$this->session->data['success'] = $this->language->get('text_success');
        	$this->response->redirect(str_replace('&amp;', '&', $this->url->link('module/fx_sitemap', 'token=' . $this->session->data['token'])));
        }
	    $this->response->setOutput($this->load->view('module/fx_sitemap.tpl', $data));
	}

    protected function validate() {
    	if (!$this->user->hasPermission('modify', 'module/fx_sitemap')) {
    		$this->error['warning'] = $this->language->get('error_permission');
    	}
    
    	return !$this->error;
    }


    public function uninstall() {
    	$this->load->model('extension/event');
    	$this->model_extension_event->deleteEvent('fx_sitemap');
    	 
    }
}