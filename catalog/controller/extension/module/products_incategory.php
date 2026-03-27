<?php
class ControllerExtensionModuleProductsInCategory extends Controller {
	/** Максимум позиций в блоке «Похожие запчасти» */
	const LIMIT_SIMILAR = 8;

	public function index() {
		$this->load->language('extension/module/products_incategory');

		$data['heading_title'] = $this->language->get('heading_title');
		$this->load->model('extension/module/products_incategory');

		$this->load->model('tool/image');
		$this->load->model('catalog/product');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$data['products_in_category'] = array();

		if (!empty($_COOKIE['geoip_currency'])) {
			$this->session->data['currency'] = $_COOKIE['geoip_currency'];
		}
		$currency_code = $this->session->data['currency'];

		if (empty($this->request->get['product_id'])) {
			return $this->load->view('extension/module/products_incategory', $data);
		}

		$current_product_id = (int)$this->request->get['product_id'];
		$product_info = $this->model_catalog_product->getProduct($current_product_id);

		if (!$product_info || empty($product_info['manufacturer_id'])) {
			return $this->load->view('extension/module/products_incategory', $data);
		}

		$manufacturer_id = (int)$product_info['manufacturer_id'];

		$filter_data = array(
			'filter_manufacturer_id' => $manufacturer_id,
			'filter_not_product_id'  => $current_product_id,
			'sort'                   => 'p.date_added',
			'order'                  => 'DESC',
			'start'                  => 0,
			'limit'                  => self::LIMIT_SIMILAR,
		);

		$result_products_in_category = $this->model_catalog_product->getProducts($filter_data);

		if (!$result_products_in_category) {
			return $this->load->view('extension/module/products_incategory', $data);
		}

		$product_ids = array();
		foreach ($result_products_in_category as $row) {
			$product_ids[] = (int)$row['product_id'];
		}

		$p2c_map = $this->model_catalog_product->getCategoriesByProductIds($product_ids);

		$all_category_ids = array();
		foreach ($p2c_map as $rows) {
			foreach ($rows as $prodcat) {
				$all_category_ids[] = (int)$prodcat['category_id'];
			}
		}

		$cat_info = $this->model_extension_module_products_incategory->getCategoriesInfoByIds($all_category_ids);

		$parent_ids = array();
		foreach ($cat_info as $cid => $info) {
			if (!empty($info['parent_id'])) {
				$parent_ids[] = (int)$info['parent_id'];
			}
		}

		$missing_parents = array_diff(array_unique($parent_ids), array_keys($cat_info));
		if ($missing_parents) {
			$parents = $this->model_extension_module_products_incategory->getCategoriesInfoByIds($missing_parents);
			foreach ($parents as $cid => $info) {
				$cat_info[$cid] = $info;
			}
		}

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

			$catprod = array();
			$category_row = null;

			$p2c_rows = isset($p2c_map[$product_in_category['product_id']]) ? $p2c_map[$product_in_category['product_id']] : array();
			foreach ($p2c_rows as $prodcat) {
				$cid = (int)$prodcat['category_id'];
				if (!empty($cat_info[$cid])) {
					$ci = $cat_info[$cid];
					$catprod[] = array(
						'name'      => $ci['name'],
						'parent_id' => (int)$ci['parent_id'],
					);
					$category_row = $ci;
				}
			}

			$catprod2 = array();
			if ($category_row && !empty($category_row['parent_id'])) {
				$pid = (int)$category_row['parent_id'];
				if (!empty($cat_info[$pid]['name'])) {
					$catprod2[] = array(
						'name' => $cat_info[$pid]['name'],
					);
				}
			}

			if (!isset($catprod[0])) {
				$catprod = array(array('name' => '', 'parent_id' => 0));
			}
			if (!isset($catprod2[0])) {
				$catprod2 = array(array('name' => ''));
			}

			$datetime1 = date_create($product_in_category['date_added']);
			if ($currency_code == 'BYN') {
				$price_2 = '$' . round($this->currency->convert($price, $currency_code, 'USD'), 0);
				$price_3 = round($this->currency->convert($price, $currency_code, 'EUR'), 0) . '€';
			} elseif ($currency_code == 'EUR') {
				$price_2 = round($this->currency->convert($price, $currency_code, 'BYN'), 0) . 'BYN';
				$price_3 = '$' . round($this->currency->convert($price, $currency_code, 'USD'), 0);
			} elseif ($currency_code == 'USD') {
				$price_2 = round($this->currency->convert(substr($price, 1), $currency_code, 'BYN'), 0) . 'BYN';
				$price_3 = round($this->currency->convert(substr($price, 1), $currency_code, 'EUR'), 0) . '€';
			} else {
				$price_2 = '';
				$price_3 = '';
			}

			$data['products_in_category'][] = array(
				'product_id'   => $product_in_category['product_id'],
				'thumb'        => $image,
				'name'         => $product_in_category['name'],
				'description'  => utf8_substr(strip_tags(html_entity_decode($product_in_category['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
				'price'        => $price,
				'year'         => $product_in_category['length'],
				'model'        => $product_in_category['model'],
				'auto'         => $catprod,
				'objem'        => $product_in_category['jan'],
				'sku'          => $product_in_category['sku'],
				'type_fuel'    => $product_in_category['isbn'],
				'injection'    => $product_in_category['mpn'],
				'price_2'      => $price_2,
				'auto_name'    => $catprod2,
				'manufacturer' => $product_in_category['manufacturer'],
				'date'         => date_format($datetime1, 'd.m.Y'),
				'price_3'      => $price_3,
				'special'      => $special,
				'tags'         => isset($product_in_category['tag']) ? $product_in_category['tag'] : '',
				'tax'          => $tax,
				'height'       => number_format((float)$product_in_category['height'], 2),
				'width'        => number_format((float)$product_in_category['width'], 2),
				'minimum'      => $product_in_category['minimum'] > 0 || $product_in_category['minimum'] < 0 ? $product_in_category['minimum'] : 1,
				'rating'       => $rating,
				'href'         => $this->url->link('product/product', 'product_id=' . $product_in_category['product_id']),
			);
		}

		return $this->load->view('extension/module/products_incategory', $data);
	}
}
