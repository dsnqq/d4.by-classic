<?php
class ControllerStartupLogin extends Controller {
	public function index() {
		$route = isset($this->request->get['route']) ? $this->request->get['route'] : '';

		$ignore = array(
			'common/login',
			'common/forgotten',
			'common/reset'
		);

		// User
		$this->registry->set('user', new Cart\User($this->registry));

		if (!$this->user->isLogged() && !in_array($route, $ignore)) {
			return new Action('common/login');
		}

		if (isset($this->request->get['route'])) {
			$ignore = array(
				'common/login',
				'common/logout',
				'common/forgotten',
				'common/reset',
				'error/not_found',
				'error/permission'
			);

			
            //admin long login
            if (!in_array($route, $ignore) && !isset($this->session->data['token'])) {
                include_once(DIR_SYSTEM . 'helper/lolo.php');
                lolo_log('Ignored opencart check of token presence in request URL, but login is required. ' . basename(__FILE__, '.php') . ' case1');
            
				return new Action('common/login');
			}
		} else {
			
            //admin long login
            if (!isset($this->session->data['token'])) {
                include_once(DIR_SYSTEM . 'helper/lolo.php');
                lolo_log('Ignored opencart check of token presence in request URL, but login is required. ' . basename(__FILE__, '.php') . ' case2');
            
            
				return new Action('common/login');
			}
		}
	}
}
