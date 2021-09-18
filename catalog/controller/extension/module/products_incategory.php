<?php
class ControllerExtensionModuleProductsInCategory extends Controller {
	public function index() {
		$this->load->language('extension/module/products_incategory');

		$data['heading_title'] = $this->language->get('heading_title');
		$this->load->model('extension/module/products_incategory');

		$this->load->model('tool/image');
		$this->load->model('catalog/product');

		$this->load->model('catalog/manufacturer');
		$this->load->model('catalog/category');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		if($_COOKIE["geoip_currency"]){
			$this->session->data['currency'] = $_COOKIE["geoip_currency"];
		}
		$currency_code = $this->session->data['currency'];

		$product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);
		$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);
		$manufacturer_id = $product_info['manufacturer_id'];

		$filter_data = array(
			'filter_manufacturer_id' => $manufacturer_id,
			'sort'                   => $sort,
			'order'                  => $order,
			'start'                  => ($page - 1) * $limit,
			'limit'                  => $limit
		);

		$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

		$result_products_in_category = $this->model_catalog_product->getProducts($filter_data);
			foreach ($result_products_in_category as $product_in_category) {

				if ($product_in_category['image']) {
					$image = $this->model_tool_image->resize($product_in_category['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'), 'product_popup');
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_in_category['price'], $product_in_category['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$product_in_category['special']) {
					$special = $this->currency->format($this->tax->calculate($product_in_category['special'], $product_in_category['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_in_category['special'] ? $product_in_category['special'] : $product_in_category['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$product_in_category['rating'];
				} else {
					$rating = false;
				}

				$product_information = $this->model_catalog_product->getProduct($product_in_category['product_id']); // TODO
				
				$catprod = array();
				$catprod2 = array();
				
				$product_category = $this->model_catalog_product->getCategories($product_in_category['product_id']);
				
				foreach ($product_category as $prodcat) {
				$category_info = $this->model_catalog_category->getCategory($prodcat['category_id']);
					if ($category_info) {
						$catprod[] = array(
						'name'     => $category_info['name'],
						'parent_id'     => $category_info['parent_id']
						);
					}
				} 

				$category_info2 = $this->model_catalog_category->getCategory($category_info['parent_id']);
				if ($category_info2) {
						$catprod2[] = array(
						'name'     => $category_info2['name']
						);
					}
				
				
				$datetime1 = date_create($product_in_category['date_added']);
				if($currency_code == "BYN"){
					$price_2 = "$".round($this->currency->convert($price, $currency_code, 'USD'), '0');
					$price_3 = round($this->currency->convert($price, $currency_code, 'EUR'), '0')."€";
				} elseif($currency_code == "EUR"){
					$price_2 = round($this->currency->convert($price, $currency_code, 'BYN'), '0')."BYN";
					$price_3 = "$".round($this->currency->convert($price, $currency_code, 'USD'), '0');
				} elseif($currency_code == "USD"){
					$price_2 = round($this->currency->convert(substr($price, 1), $currency_code, 'BYN'), '0')."BYN";
					$price_3 = round($this->currency->convert(substr($price, 1), $currency_code, 'EUR'), '0')."€";
				} 

				$data['products_in_category'][] = array(
					'product_id'  => $product_in_category['product_id'],
					'thumb'       => $image,
					'name'        => $product_in_category['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($product_in_category['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'year'        => $product_in_category['length'],
					'model'        => $product_in_category['model'],
					'auto'		  => $catprod, 
					'objem'		  => $product_in_category['jan'],
					'sku'		  => $product_in_category['sku'],
					'type_fuel'	  => $product_in_category['isbn'],
					'injection'	  => $product_in_category['mpn'],
					'price_2'	  => $price_2,
					'auto_name'	  => $catprod2,
					'manufacturer'=> $product_in_category['manufacturer'],
					'date'        => date_format($datetime1,"d.m.Y"),
					'price_3'     => $price_3,
					'special'     => $special,
					'tags'        => $product_information['tag'], //TODO
					'tax'         => $tax,
					'height'	  => number_format($product_information['height'], 2),
					'width'		  => number_format($product_information['width'], 2),
          			'minimum'     => $product_in_category['minimum'] > 0  || $product_in_category['minimum'] < 0? $product_in_category['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_in_category['product_id'])
				);
			}


		return $this->load->view('extension/module/products_incategory', $data);
	}
}