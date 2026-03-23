<?php
class ControllerCommonDashboard extends Controller {
	public function index() {

		$this->load->language('common/dashboard');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['breadcrumbs'] = array();


		$this->load->model('catalog/product');
		$this->load->model('catalog/shiny');

		$data['productCount'] = $this->model_catalog_product->getProductCount();
		$data['productCountNo'] = $this->model_catalog_product->getProductCountStatusNo();

		$data['shinyCount'] = $this->model_catalog_shiny->getProductCount();
		$data['shinyCountNo'] = $this->model_catalog_shiny->getProductCountStatusNo();

        $data['token'] = $this->session->data['token'];
		$data['link_shiny'] = $this->url->link('catalog/shiny', 'token=' . $this->session->data['token'], true);
		$data['link_shiny_add'] = $this->url->link('catalog/shiny/add', 'token=' . $this->session->data['token'], true);

		$data['link_zch'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'], true);
		$data['link_statistics'] = $this->url->link('report/product_statistics', 'token=' . $this->session->data['token'], true);
		$data['link_zch_add'] = $this->url->link('catalog/product/add', 'token=' . $this->session->data['token'], true);
		$data['link_logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], true);
		$data['link_modification'] = $this->url->link('catalog/filter', 'token=' . $this->session->data['token'], true);
		$data['link_auto'] = $this->url->link('catalog/category', 'token=' . $this->session->data['token'], true);
		$data['link_zch_name'] = $this->url->link('catalog/manufacturer', 'token=' . $this->session->data['token'], true);
		$data['setting_setting'] = $this->url->link('setting/setting', 'token=' . $this->session->data['token'], true);


		$data['cart_shopper'] = $this->url->link('extension/module/simple&abandoned', 'token=' . $this->session->data['token'], true);
		$data['setting_valute'] = $this->url->link('localisation/currency', 'token=' . $this->session->data['token'], true);
		$data['setting_valute_te'] = $this->url->link('extension/module/ucur', 'token=' . $this->session->data['token'], true);
		$user_id = $this->session->data['user_id'];
        $data['user_id_com'] = $user_id;

        $this->load->model('localisation/currency');

        $data['currencies'] = $this->model_localisation_currency->getCurrencies();


		$data['link_category'] = $this->url->link('catalog/category', 'token=' . $this->session->data['token'], true);
		$data['link_product'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'], true);


		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$v = substr(VERSION,0,3);
		if($v == '2.3'){
			$version = $this->load->controller('extension/module/apimodule/checkVersion');
		}else{
			$version = $this->load->controller('module/apimodule/checkVersion');
		}

		if ($this->API_VERSION < (float)$version) {
			$data['update_module'] = "Обновите модуль OPENCART-MOBILE-ADMIN до версии ".$version." или скачайте по ссылке <a target='_blanc' href='https://github.com/pintawebware/opencart-mobile-admin'>скачать </a>";
		} else {
			$data['update_module'] = '';
		}

		// Check install directory exists
		if (is_dir(dirname(DIR_APPLICATION) . '/install')) {
			$data['error_install'] = $this->language->get('error_install');
		} else {
			$data['error_install'] = '';
		}

		// Dashboard Extensions
		$dashboards = array();

		$this->load->model('extension/extension');

		// Get a list of installed modules
		$extensions = $this->model_extension_extension->getInstalled('dashboard');

		// Add all the modules which have multiple settings for each module
		foreach ($extensions as $code) {
			if ($this->config->get('dashboard_' . $code . '_status') && $this->user->hasPermission('access', 'extension/dashboard/' . $code)) {
				$output = $this->load->controller('extension/dashboard/' . $code . '/dashboard');

				if ($output) {
					$dashboards[] = array(
						'code'       => $code,
						'width'      => $this->config->get('dashboard_' . $code . '_width'),
						'sort_order' => $this->config->get('dashboard_' . $code . '_sort_order'),
						'output'     => $output
					);
				}
			}
		}

		$sort_order = array();

		foreach ($dashboards as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $dashboards);

		// Split the array so the columns width is not more than 12 on each row.
		$width = 0;
		$column = array();
		$data['rows'] = array();

		foreach ($dashboards as $dashboard) {
			$column[] = $dashboard;

			$width = ($width + $dashboard['width']);

			if ($width >= 12) {
				$data['rows'][] = $column;

				$width = 0;
				$column = array();
			}
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		// Run currency update
		if ($this->config->get('config_currency_auto')) {
			$this->load->model('localisation/currency');

			$this->model_localisation_currency->refresh();
		}
        
		$this->response->setOutput($this->load->view('common/dashboard', $data));
		if($user_id == 5){
			$this->response->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'], true));
		} elseif($user_id == 2 || $user_id == 7 || $user_id == 8 || $user_id == 28){
			$this->response->setOutput($this->load->view('common/dashboard', $data));
		} elseif($user_id == 34){
			$this->response->redirect($this->url->link('accounting/product_accounting', 'token=' . $this->session->data['token'], true));
		} else{
            $this->response->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'], true));
        }
        // 29 ID разрабочтик Даниил для тестирования
	}
}


