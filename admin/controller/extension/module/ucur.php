<?php
class ControllerExtensionModuleUcur extends Controller {
	private $error = array();
	private $ver = '4.0.0(oc2.3)';

	public function index() {
		$this->load->language('extension/module/ucur');
		$this->load->model('setting/setting');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ucur', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['license'])) {
			$data['error_license'] = $this->error['license'];
		} else {
			$data['error_license'] = '';
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/ucur', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/ucur', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		$data['version'] = $this->ver;

		$data['entry_cron'] = HTTPS_CATALOG . 'index.php?route=extension/module/ucur/update&token=' . $this->session->data['token'];

		if (isset($this->request->post['ucur_license'])) {
			$data['ucur_license'] = $this->request->post['ucur_license'];
		} else {
			$data['ucur_license'] = $this->config->get('ucur_license');
		}

		if (isset($this->request->post['ucur_addr'])) {
			$data['ucur_addr'] = $this->request->post['ucur_addr'];
		} else {
			$data['ucur_addr'] = $this->config->get('ucur_addr');
		}

		if (isset($this->request->post['ucur_proc'])) {
			$data['ucur_proc'] = $this->request->post['ucur_proc'];
		} else {
			$data['ucur_proc'] = $this->config->get('ucur_proc');
		}

		if (isset($this->request->post['ucur_status'])) {
			$data['ucur_status'] = $this->request->post['ucur_status'];
		} else {
			$data['ucur_status'] = $this->config->get('ucur_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/ucur', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/ucur')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (empty($this->request->post['ucur_license'])) {
			$this->error['license'] = $this->language->get('error_license');
		}

		return !$this->error;
	}
}
