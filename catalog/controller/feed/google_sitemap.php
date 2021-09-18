<?php
class ControllerFeedGoogleSitemap extends Controller {
	public function index() {
		
		$this->load->model('module/fx_sitemap');
		$host = $this->config->get('config_ssl') ? HTTPS_SERVER : HTTP_SERVER;
		
        $get_arrs = array();
        
        if ($this->config->get('fx_sitemap_default')){
            $parse = parse_url(str_replace('&amp;', '&', $this->config->get('fx_sitemap_default')));            
            parse_str($parse['query'], $get_arrs);
        }
		
		$get_arr = array();
		
		$arrs = array("limit", "page", "express", "file", "key", "save", "multi", "img", "blog", "article", "news");
		foreach ($arrs as $g) {
			if (isset($get_arrs[$g])){
				$get_arr[$g] = $get_arrs[$g];
			}
			if (isset($this->request->get[$g]) && ($this->request->get[$g] != 'off')){
				$get_arr[$g] = $this->request->get[$g];
			}
		}
		if (isset($this->request->get['page'])){
			unset($get_arr['multi']);
		}
		
		/*$get_arr['img'] = 1;
		/*print_r($get_arrs);
		print_r($this->request->get);
		print_r($get_arr);*/
		
		$excluded  = $this->check("sitemap.txt");
		$plus  =  $this->check("add_sitemap.txt");
		
		$start = (time() + microtime());
		
		if (isset($get_arr['multi'])){
			
			unset($get_arr['multi']);

			$limit = (isset($get_arr['limit']) && ((int)$get_arr['limit'] > 0)) ? (int)$get_arr['limit'] : 47999;
			
			$url = '';
			
			if (isset($get_arr['limit'])){
				$url .= '&amp;limit='. (int)$get_arr['limit'];
			}
			
			if (isset($get_arr['express'])){
				$url .= '&amp;express='. $get_arr['express'];
			}
			
			if (isset($get_arr['key'])){
				$url .= '&amp;key='. $get_arr['key'];
			}
			
			if (isset($get_arr['file'])){
				$url .= '&amp;file='. $get_arr['file'].'{n}';
			}
			
			if (isset($get_arr['img'])){
				$total_p =  $get_arr['img'] == 1 ? $this->model_module_fx_sitemap->getProductsTotal() : $this->model_module_fx_sitemap->getImgTotal();
				$url .= '&amp;img='. (int)$get_arr['img'];
			}else{
				$total_p = $this->model_module_fx_sitemap->getProductsTotal();
			}
			$total = 0;
			if ($total_p < $limit) {
				$total += $this->model_module_fx_sitemap->getCategoriesTotal();
				$total += $this->model_module_fx_sitemap->getManufacturersTotal();
				$total += $this->model_module_fx_sitemap->getAllNewsTotal();
				$total += $this->model_module_fx_sitemap->getAllBlogTotal();
				$total += $this->model_module_fx_sitemap->getMFPTotal();
				$total += $this->model_module_fx_sitemap->getOCFilterTotal();
				$total += $this->model_module_fx_sitemap->getInformationsTotal();
				$total += $this->model_module_fx_sitemap->getCMSBlogTotal();
				$total += $this->model_module_fx_sitemap->getArticlesTotal();
				$total += count($plus) - count($excluded);
			}
					
			$file_access = false;
			if ($this->config->get('fx_sitemap_key')) { 
			
				if($this->config->get('fx_sitemap_key') == ''){$file_access = true;}
				if(isset($get_arr['key']) && ($this->config->get('fx_sitemap_key') == $get_arr['key'])){$file_access = true;}
				
			}
			
			$output = '<?xml version="1.0" encoding="utf-8"?>';
			$output .= '<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
		
			if (($total + $total_p) > $limit) {
				$num = ceil($total_p / $limit);
				$n = 0;
				
				do {
					$go = $host . 'index.php?route=feed/google_sitemap&amp;page=' . $n . str_replace("{n}", $n, $url);					
					$file = isset($get_arr['file']) ? $host . $get_arr['file'].$n.'.xml' : $go;
					
					$output .= '<sitemap>';
					$output .= '<loc>' . $file . '</loc>';
					$output .= '</sitemap>';
					
					if (isset($get_arr['file']) && isset($get_arr['save']) && $file_access){
						$out = $this->goSitemap($go);
						//print($go);
						//file_put_contents($get_arr['file']. '-' . $n . '.xml', $out);
					}
					
					$n++;
				} while ($n <= $num);
							
			}else{
				$go = $host . 'index.php?route=feed/google_sitemap' . $url;					
				$file = isset($get_arr['file']) ? $host . $get_arr['file'].'.xml' : $go;
				
				$output .= '<sitemap>';
				$output .= '<loc>' . $file . '</loc>';
				$output .= '</sitemap>';
				
				if (isset($get_arr['file']) && isset($get_arr['save']) && $file_access){
					$out = $this->goSitemap($go);
				}
			}

				$output .= '</sitemapindex>';
				
				$this->response->addHeader('Content-Type: application/xml');
				$this->response->setOutput($output);

			
		}else{
			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			if (!isset($get_arr['img'])){
				$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
			}else{
				$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">';
			}
			
			$data['limit'] = (isset($get_arr['limit'])) ? (int)$get_arr['limit'] : 47999;
			
			$data['limit'] = (isset($get_arr['page']) && ($get_arr['page'] == '0')) ? 0 : $data['limit'];
			
			$data['start'] = isset($get_arr['page']) ? ((int)$get_arr['page'] - 1)*$data['limit'] : 0;
			
			if ($data['start'] < 0) { $data['start'] = 0; } ;
			
			//$output .= $data['start'].':'.$data['limit'].'-'.$get_arr['page'].'*'.
			
			//$this->load->model('catalog/product');
			//$this->load->model('tool/image');
			
			//$products = $this->model_catalog_product->getProducts();
			if (isset($get_arr['express'])){
				$ext = $get_arr['express'];
				$products = $this->model_module_fx_sitemap->getProductsExpress($data);
				
				foreach ($products as $product) {
					if ($product['keyword']) {
						$output .= '<url>';				
						$output .= '<loc>' . $host . $product['keyword'] . $ext .'</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>1.0</priority>';
						$output .= '</url>';
					}
				}
			}else{
			
				if ( isset($get_arr['img']) && ($get_arr['img'] == 1) ){
					$products = $this->model_module_fx_sitemap->getImgOne($data);
				}elseif (isset($get_arr['img'])){
					$products = $this->model_module_fx_sitemap->getImg($data);
				}else{
					$products = $this->model_module_fx_sitemap->getProducts($data);
				}

				foreach ($products as $product) {
				
					$date = date_format( new DateTime($product['date_modified']), 'Y-m-d');
					if ($date == '-0001-11-30') { $date = date_format( new DateTime($product['date_added']), 'Y-m-d'); };
					$url= str_replace("&p", "&amp;p", $this->url->link('product/product', 'product_id=' . $product['product_id']));
					
					if (!in_array($url, $excluded)) {
						$output .= '<url>';				
						$output .= '<loc>' . $url . '</loc>';
						//$output .= '<loc>' . $this->url->link('product/product', 'product_id=' . $product['product_id']) . '</loc>';
						$output .= '<lastmod>' . $date . '</lastmod>'; 
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>1.0</priority>';

						if (isset($get_arr['img']) && ($product['image']) != ''){
							$temp = explode(",", $product['image']);
							$name = htmlspecialchars($product['name'], ENT_QUOTES);
							foreach ($temp as $img) {
								$output .= '<image:image>';
								//$output .= '<image:loc>' . $this->model_tool_image->resize($product['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')) . '</image:loc>';
								$output .= '<image:loc>' . $host . 'image/' . $img .'</image:loc>';
								$output .= '<image:caption>' . $name . '</image:caption>';
								$output .= '<image:title>' . $name . '</image:title>';
								$output .= '</image:image>';
							}
						}
						$output .= '</url>';
					}
				}
			}
			
			if (!isset($get_arr['page']) || ((int)$get_arr['page'] == 0)) {
				
				//$this->load->model('catalog/category');

				$cat = $this->getCategories($excluded);
				$output .= $cat[0];

				$this->load->model('catalog/manufacturer');

				$manufacturers = $this->model_module_fx_sitemap->getManufacturers();
				foreach ($manufacturers as $manufacturer) {					
					$url= str_replace("&m", "&amp;m", $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						//$output .= '<loc>' . $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']) . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.7</priority>';
						$output .= '</url>';
					}
				}

				// $this->load->model('catalog/information');
				
				$informations = $this->model_module_fx_sitemap->getInformations();

				foreach ($informations as $information) {
					$url= str_replace("&i", "&amp;i", $this->url->link('information/information', 'information_id=' . $information['information_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						//$output .= '<loc>' . $this->url->link('information/information', 'information_id=' . $information['information_id']) . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.5</priority>';
						$output .= '</url>';
					}
				}
				
				$blog = $this->model_module_fx_sitemap->getAllBlog(0);
				$route = isset($get_arr['blog']) ? $get_arr['blog'] : 'information/blog' ;
				foreach ($blog as $new) {
					$url= str_replace("&b", "&amp;b", $this->url->link( $route, 'blog_id=' . $new['blog_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}

				$news = $this->model_module_fx_sitemap->getAllNews(0);
				$route = isset($get_arr['news']) ? $get_arr['news'] : 'information/news' ;
				foreach ($news as $new) {
					$url= str_replace("&n", "&amp;n", $this->url->link( $route, 'news_id=' . $new['news_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}

				$articles = $this->model_module_fx_sitemap->getArticles(0);
				$route = isset($get_arr['article']) ? $get_arr['article'] : 'information/article' ;
				foreach ($articles as $new) {
					$url= str_replace("&ar", "&amp;ar", $this->url->link( $route, 'article_id=' . $new['article_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}
				
				$blog = $this->model_module_fx_sitemap->getCMSBlog(0);
				$route = 'record/record' ;
				foreach ($blog as $new) {					
					$url= str_replace("&r", "&amp;r", $this->url->link( $route, 'record_id=' . $new['record_id']));
					$date = date_format( new DateTime($new['date_modified']), 'Y-m-d');
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<lastmod>' . $date . '</lastmod>'; 
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}
				
				$mfp = $this->model_module_fx_sitemap->getMFP(0);
				foreach ($mfp as $new) {
					$url= $host.$new['path'].'/'.$new['alias'];
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}
				
				$ocf = $this->model_module_fx_sitemap->getOCFilter(0);
				foreach ($ocf as $new) {
					$url= str_replace("&p", "&amp;p", $this->url->link('product/category', 'path=' . $new['category_id'])).$new['keyword'];
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}				
				
				$fp = $this->model_module_fx_sitemap->getFilterPro(0);
				foreach ($fp as $new) {
				
					$fdata = unserialize($new['data']);	

					//print_r($fdata);
				
					parse_str(str_replace('&amp;', '&', $fdata['url']), $un_data);
					
					if (isset($un_data['route'])){
						if($un_data['route'] == 'product/category') {
							$url = $this->url->link($un_data['route'], 'path=' . (isset($un_data['path']) ? $un_data['path'] : $un_data['category_id']) . '&' . $new['url']);
						} else if(strpos($un_data['route'], 'product/manufacturer/') !== false) {
							$url = $this->url->link($un_data['route'], 'manufacturer_id=' . $un_data['manufacturer_id'] . '&' . $new['url']);
						} else {
							$url = $this->url->link($un_data['route'], $new['url']);
						}
						
						if (!in_array($url, $excluded)) {
							$output .= '<url>';
							$output .= '<loc>' . $url . '</loc>';
							$output .= '<changefreq>weekly</changefreq>';
							$output .= '<priority>0.9</priority>';
							$output .= '</url>';
						}
					}
				}
				
				foreach ($plus as $p) {
					$output .= '<url>';
					$output .= '<loc>' . str_replace("&", "&amp;", $p) . '</loc>';
					$output .= '<changefreq>weekly</changefreq>';
					$output .= '<priority>0.9</priority>';
					$output .= '</url>';
				}
			
			}
			//$output .= $this->getCategories(0);
			$output .= '</urlset>';
			
			$output = str_replace('<lastmod>-0001-11-30</lastmod>', '', $output);
			
			if (isset($get_arr['page'])){
				$output = str_replace('"></urlset>', '"><url><loc>'. $host .'</loc><changefreq>daily</changefreq><priority>1</priority></url></urlset>', $output);
			}
			
			$file_access = false;
			if ($this->config->get('fx_sitemap_key')) { 
			
				if($this->config->get('fx_sitemap_key') == ''){$file_access = true;}
				if(isset($get_arr['key']) && ($this->config->get('fx_sitemap_key') == $get_arr['key'])){$file_access = true;}
				
			}
			
			$ip = isset($this->request->server['REMOTE_ADDR']) ? $this->request->server['REMOTE_ADDR'] : "N/A";
			$ua = isset($this->request->server['HTTP_USER_AGENT']) ? $this->request->server['HTTP_USER_AGENT'] : "N/A";
			$uri = isset($this->request->server['REQUEST_URI']) ? $this->request->server['REQUEST_URI'] : "N/A";
			
			$end = (time() + microtime());
			$time = round($end - $start, 5)*1000;

			if($this->config->get('fx_sitemap_log')){
				file_put_contents(DIR_LOGS.'fx_sitemap.log', ("[" . date("d.m.Y H:i") . "] " . $ip . " : " . $ua . "\n" . $time . "мс  | " . $uri. "\n ------------ \n"), FILE_APPEND);
			}

			//var_dump($this->config->get('fx_sitemap_key'));
			
			if (isset($get_arr['file'])){
				if ($file_access){
					file_put_contents(str_replace("{n}", '', $get_arr['file']).'.xml', $output);
					echo('<h1 style="position: absolute; top:50%; left: 50%">Saved<h1>');
				}else{
					echo('<h1 style="position: absolute; top:50%; left: 50%">Access Denied<h1>');
				}
				
			}else{
				$this->response->addHeader('Content-Type: application/xml');
				$this->response->setOutput($output);
			}
		}
		
	}

	protected function goSitemap($url){
	
		//print(file_get_contents($url));/*
		$headers = array('HTTP_ACCEPT: Something', 'HTTP_ACCEPT_LANGUAGE: ru, en, da, nl', 'HTTP_CONNECTION: Something');
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.1 (compatible; MSIE 6.0; Windows NT 5.1; FX Sitemap)');
		curl_setopt($ch, CURLOPT_URL, str_replace("&amp;", "&", $url));
		$pagecode = curl_exec( $ch );
		curl_close($ch);
		return $pagecode;
	}
	
	protected function addhost($url, $host){
		$outurl = $host.$url;
		return $outurl;
	}
		
	protected function check($var){		
		$arr = mb_split("\n",file_get_contents(DIR_CONFIG.$var));
		
		foreach ($arr as $key=>&$value) {
			if (strlen($value) < 10) {
				unset($arr[$key]);
			}
		}
		
		return $arr;
	}
	
	protected function getCategories($exclude) {		
		$results = $this->model_module_fx_sitemap->getCategories();
		$total = count($results);
		$output ='';
		
		foreach ($results as $result) {
			
			$date = date_format( new DateTime($result['date_modified']), 'Y-m-d');
			if ($date == '-0001-11-30') { $date = date_format( new DateTime($result['date_added']), 'Y-m-d'); };
			
			$url= str_replace("&p", "&amp;p", $this->url->link('product/category', 'path=' . $result['category_id']));
			
			if (!in_array($url, $exclude)) {
				$output .= '<url>';
				$output .= '<loc>' . $url . '</loc>';
				$output .= '<lastmod>' . $date . '</lastmod>'; 
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.7</priority>';
				$output .= '</url>';
			}
		}

		//return $output;
		return array($output, $total);
	}
}
