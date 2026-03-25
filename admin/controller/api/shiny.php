<?php

class ControllerApiShiny extends Controller {
    public function index() {
        $this->getShinyList();
    }

    public function getShinyList() {
        $json = array();

        $this->load->model('catalog/shiny');

        $shiny_list = $this->model_catalog_shiny->getProducts();

        foreach ($shiny_list as $shiny_item) {
            $json['products'][] = array(
                'product_id' => $shiny_item['product_id'],
                'name'       => $shiny_item['name'],
                'model'      => $shiny_item['model'],
                'price'      => $shiny_item['price'],
                'price_BYN'	 => round($this->currency->convert($shiny_item['price'], "USD", 'BYN'), 0)." р.",
                'shirina'	 => $shiny_item['jan'],
                'vysota'	 => $shiny_item['isbn'],
                'r_size'	 => $shiny_item['mpn'],
                'marka'	     => $shiny_item['ean'],
                'model_s'	 => $shiny_item['upc'],
                'sostojan'	 => $shiny_item['location'],
                'season'	 => $shiny_item['sku'],
                'type_av'	 => $shiny_item['version'],
                'year_av'	 => $shiny_item['length'],
                'date_modified' => ($shiny_item['date_modified'] != "0000-00-00 00:00:00") ? date("d-m-Y", strtotime($shiny_item['date_modified'])) : $shiny_item['date_modified'],
                'date_added' => date("d-m-Y", strtotime($shiny_item['date_added'])),
                'quantity'   => $shiny_item['quantity']
            );
        }

        if (isset($this->request->server['HTTP_ORIGIN'])) {
            $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
            $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
            $this->response->addHeader('Access-Control-Max-Age: 1000');
            $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}