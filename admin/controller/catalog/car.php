<?php

class ControllerCatalogCar extends Controller {

    private $error = array();

    public function index() {
        $this->document->setTitle("Авто в разборе");

        $this->load->model('catalog/car');

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('car/car', $data));
    }
}