<?php
class ControllerExtensionModuleShowproductall extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/showproductall');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

        if(isset($setting['title'])){
            $data['heading_title'] = $setting['title'][$this->config->get('config_language_id')];
        }else{
            $data['heading_title'] = $this->language->get('heading_title');
        }

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$data['button_list'] = $this->language->get('button_list');
		$data['button_grid'] = $this->language->get('button_grid');

		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['compare'] = $this->url->link('product/compare');
		$data['text_empty'] = $this->language->get('text_empty');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		$data['products'] = array();

		$filter_data = array(
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);

		if($_COOKIE["geoip_currency"]){
			$this->session->data['currency'] = $_COOKIE["geoip_currency"];
		}
		$currency_code = $this->session->data['currency'];

		$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

		$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'), 'product_popup');
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				$this->load->model('catalog/category');


				$catprod = array();
				$catprod2 = array();

				$product_category = $this->model_catalog_product->getCategories($result['product_id']);

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


				$datetime1 = date_create($result['date_added']);
				if($currency_code == "BYN"){
					$price_2 = "$".round($result['price'], '0');
					$price_3 = round($this->currency->convert($result['price'], "USD", 'EUR'), '0')."€";
				} elseif($currency_code == "EUR"){
					$price_2 = round($this->currency->convert($price, $currency_code, 'BYN'), '0')."BYN";
					$price_3 = "$".round($this->currency->convert($price, $currency_code, 'USD'), '0');
				} elseif($currency_code == "USD"){
					$price_2 = round($this->currency->convert(substr($price, 1), $currency_code, 'BYN'), '0')."BYN";
					$price_3 = round($this->currency->convert(substr($price, 1), $currency_code, 'EUR'), '0')."€";
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'year'        => $result['length'],
					'model'       => $result['model'],
					'auto'		  => $catprod,
					'objem'		  => $result['jan'],
					'sku'		  => $result['sku'],
					'type_fuel'	  => $result['isbn'],
					'injection'	  => $result['mpn'],
					'ean'	  => $result['ean'],
					'price_2'	  => $price_2,

					'location'        => $result['location'],
					'width'           => $result['width'],
					'height'          => $result['height'],
					'weight'          => $result['weight'],
					'etvylet'         => $result['etvylet'],
					'diadiametr'      => $result['diadiametr'],
					'jan'             => $result['jan'],
					'isbn'            => $result['isbn'],
					'mpn'             => $result['mpn'],


					'price_3'     => $price_3,
					'auto_name'	  => $catprod2,
					'manufacturer'=> $result['manufacturer'],
					'date'        => date_format($datetime1,"d.m.Y"),
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			if(isset($this->request->get['route'])){
				$current_page = $this->request->get['route'];
			}else{
				$current_page = 'common/home';
			}
			if($this->request->get['route'] != "common/home"){
				$tempa2 = "&news_id=" . $this->request->get['news_id'];
				$current_page = $this->request->get['route'] . $tempa2;
			}


			$url = '';

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link($current_page, '&sort=p.sort_order&order=ASC' . $url)
			);

			/*$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link($current_page, '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link($current_page, '&sort=pd.name&order=DESC' . $url)
			);*/

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link($current_page, '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link($current_page, '&sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link($current_page, '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link($current_page, '&sort=rating&order=ASC' . $url)
				);
			}

			/*$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link($current_page, '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link($current_page, '&sort=p.model&order=DESC' . $url)
			);*/
			$data['sorts'][] = array(
				'text'  => "Дата добавления (по возрастанию)",
				'value' => 'p.date_added-ASC',
				'href'  => $this->url->link($current_page, '&sort=p.date_added&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => "Дата добавления (по убыванию)",
				'value' => 'p.date_added-DESC',
				'href'  => $this->url->link($current_page, '&sort=p.date_added&order=DESC' . $url)
			);

            $data['sorts'][] = array(
                'text'  => "С фото",
                'value' => 'p.image-DESC',
                'href'  => $this->url->link($current_page, '&sort=p.image&order=DESC' . $url)
            );

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}


			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link($current_page, $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;	
			$pagination->limit = $limit;
			$pagination->num_links = 4;
			$pagination->text_last = ceil($product_total / $limit);
			$pagination->url = $this->url->link($current_page, $url . '&page={page}');
			
			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			//$tempa = "news_id=" . $this->request->get['news_id']

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
			    $this->document->addLink($this->url->link($current_page, '', true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link($current_page, '', true), 'prev');
			} else {
			    $this->document->addLink($this->url->link($current_page, '', '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link($current_page, '&page='. ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			return $this->load->view('extension/module/showproductall', $data);
	}
}
