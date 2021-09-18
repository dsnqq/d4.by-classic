<?php
class ControllerCommonHome extends Controller {
	public function index() {
		
		$this->load->model('catalog/category');

		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->send_mes();
		}


		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');



		$data['categories'] = array();
		$categories = $this->model_catalog_category->getCategories(0);		
		foreach ($categories as $category) {
            $filter_data = array(
                'filter_category_id'  => $category['category_id'],
                'filter_sub_category' => true
            );
 
            $data['categories'][] = array(
                'category_id' => $category['category_id'],
                'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
            );
        }




		$this->response->setOutput($this->load->view('common/home', $data));
	}
	
	// заказ
	public function send_mes(){
				
		$name = $_POST['name'];
		$phone = $_POST['phone'];

		// отправка письма форуму
		//Если ошибок нет, отправляем емейл 
		if($phone != ""){
			$emailTo = $this->config->get('config_email'); //Сюда введите Ваш email
			$subject = 'Заявка с сайта d4.by'; // формируем тему письма
			$body = "Ф.И.О.: $name \nТелефон: $phone "; //формируем само письмо
			mail($emailTo, $subject, $body);
		}
	}

}
