<?php
class ControllerCatalogArhiveShiny extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('catalog/arhive_shiny');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/arhive_shiny');

        $this->getList();
    }

    public function actions() {
        $hostname = "localhost";
        $username = "dby_user";
        $password = "LhePBA4v6Lc8k6";
        $dbName = "dby_bd";

        $link = mysqli_connect($hostname, $username, $password, $dbName)
        or die("Ошибка " . mysqli_error($link));

        $category_id = $this->request->post['actions'];

        $query = "SELECT status FROM oc_product WHERE product_id = '" . $category_id . "'";
        $result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link));

        $filter_group = mysqli_fetch_array($result);
        if($filter_group['status'] == '1'){
            echo '0';
            $query_link ="UPDATE oc_product SET status='0' WHERE product_id='" . $category_id . "'";
            $result2020 = mysqli_query($link, $query_link) or die("Ошибка " . mysqli_error($link));
        }else{
            echo '1';
            $query_link ="UPDATE oc_product SET status='1' WHERE product_id='" . $category_id . "'";
            $result2020 = mysqli_query($link, $query_link) or die("Ошибка " . mysqli_error($link));
        }

        mysqli_close($link);
    }

    public function add() {
        $this->load->language('catalog/product');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product');

        if(!$this->request->post['main_category_dop']){
            if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

                $this->model_catalog_arhive_shiny->addProduct($this->request->post);

                $this->session->data['success'] = $this->language->get('text_success');

                $url = '';

                if (isset($this->request->get['filter_name'])) {
                    $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
                }

                if (isset($this->request->get['filter_model'])) {
                    $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
                }

                if (isset($this->request->get['filter_price'])) {
                    $url .= '&filter_price=' . $this->request->get['filter_price'];
                }

                if (isset($this->request->get['filter_quantity'])) {
                    $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
                }

                if (isset($this->request->get['filter_category'])) {
                    $url .= '&filter_category=' . $this->request->get['filter_category'];
                }

                if (isset($this->request->get['filter_status'])) {
                    $url .= '&filter_status=' . $this->request->get['filter_status'];
                }

                if (isset($this->request->get['sort'])) {
                    $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                    $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                    $url .= '&page=' . $this->request->get['page'];
                }

                if (isset($this->request->post['go_list_product']) && $this->request->post['go_list_product'] == "1") {
                    $this->response->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, true));
                }

            }

            $this->getForm();
        } else{
            // то что происходит при добавлении более 1 З/Ч
            if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

                $main_category_dop = array();
                $articleDop = 1;
                $main_category_dop = $this->request->post['main_category_dop'];

                $model = $this->request->post['model'];
                $main_category_id_bek = $this->request->post['main_category_id'];

                $this->request->post['model'] = $this->request->post['model'].'_'.$articleDop;
                $this->model_catalog_arhive_shiny->addProduct($this->request->post); // добавляем основную з/ч

                foreach($main_category_dop as $main_category_dop_item){ // добавляем доп. з/ч
                    $articleDop++;
                    $this->request->post['model'] = $model;
                    $this->request->post['main_category_id'] = $main_category_dop_item;
                    $this->request->post['model'] = $this->request->post['model'].'_'.$articleDop;
                    $this->model_catalog_arhive_shiny->addProduct($this->request->post);
                }

                $this->session->data['success'] = $this->language->get('text_success');

                $url = '';

                if (isset($this->request->get['filter_name'])) {
                    $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
                }

                if (isset($this->request->get['filter_model'])) {
                    $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
                }

                if (isset($this->request->get['filter_price'])) {
                    $url .= '&filter_price=' . $this->request->get['filter_price'];
                }

                if (isset($this->request->get['filter_quantity'])) {
                    $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
                }

                if (isset($this->request->get['filter_category'])) {
                    $url .= '&filter_category=' . $this->request->get['filter_category'];
                }

                if (isset($this->request->get['filter_status'])) {
                    $url .= '&filter_status=' . $this->request->get['filter_status'];
                }

                if (isset($this->request->get['sort'])) {
                    $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                    $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                    $url .= '&page=' . $this->request->get['page'];
                }

                if (isset($this->request->post['go_list_product']) && $this->request->post['go_list_product'] == "1") {
                    $this->response->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, true));
                }
                $this->request->post['main_category_id'] = $main_category_id_bek;

            }
            $this->getForm();
            // конец то что происходит при добавлении более 1 З/Ч
        }

    }

    public function edit() {
        $this->load->language('catalog/arhive_shiny');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/arhive_shiny');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_arhive_shiny->editProduct($this->request->get['product_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_model'])) {
                $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_price'])) {
                $url .= '&filter_price=' . $this->request->get['filter_price'];
            }

            if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
            }

            if (isset($this->request->get['filter_category'])) {
                $url .= '&filter_category=' . $this->request->get['filter_category'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['route'])) {
                $get = explode("/", $this->request->get['route']);
                $folder = $get[0];
                $file = $get[1];

                if ($file == 'user_permission') $table = 'user_group';
                else $table = $file;

                $this->load->model('setting/setting');
                $last_id = $this->model_setting_setting->getLastId($table);

                if ($file == 'setting') {
                    $route = 'setting/store';
                    $editroute = 'setting/setting';
                } else {
                    $route = $folder.'/'.$file;
                    $editroute = $folder.'/'.$file.'/edit';
                }

                if (!isset($url)) $url = "";

                if (($file != 'setting') && (isset($this->request->get[$table.'_id']) || isset($last_id))) {
                    $url .= '&'.$table.'_id='.(isset($this->request->get[$table.'_id']) ? $this->request->get[$table.'_id'] : $last_id);
                }

                if (isset($this->request->post['apply']) && $this->request->post['apply'] == "1") {
                    $this->response->redirect($this->url->link($editroute, 'token='.$this->session->data['token'].$url, 'SSL'));
                }
            }
            if(isset($this->request->post['go_list_product']) && (int)$this->request->post['go_list_product'] == 1){
                $this->response->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, true));
            } else{
                $this->response->redirect($this->url->link('catalog/product/add', 'token=' . $this->session->data['token'] . $url, true));
            }
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('catalog/product');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product');
        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $product_id) {
                $this->model_catalog_arhive_shiny->deleteProduct($product_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_model'])) {
                $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_price'])) {
                $url .= '&filter_price=' . $this->request->get['filter_price'];
            }

            if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
            }

            if (isset($this->request->get['filter_category'])) {
                $url .= '&filter_category=' . $this->request->get['filter_category'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }
    public function deleted() {
        $this->load->language('catalog/product');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product');
        $this->model_catalog_arhive_shiny->deleteProduct($this->request->get['product_id']);


        $this->session->data['success'] = $this->language->get('text_success');

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_price'])) {
            $url .= '&filter_price=' . $this->request->get['filter_price'];
        }

        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
        }

        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . $this->request->get['filter_category'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->response->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, true));
        //$this->getList();
    }
    public function copy() {
        $this->load->language('catalog/product');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product');

        if (isset($this->request->post['selected']) && $this->validateCopy()) {
            foreach ($this->request->post['selected'] as $product_id) {
                $this->model_catalog_arhive_shiny->copyProduct($product_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_model'])) {
                $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_price'])) {
                $url .= '&filter_price=' . $this->request->get['filter_price'];
            }

            if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
            }

            if (isset($this->request->get['filter_category'])) {
                $url .= '&filter_category=' . $this->request->get['filter_category'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }


    protected function getList() {
        $data['token_ac'] = $this->session->data['token'];

        if (isset($this->request->get['filter_model'])) {
            $filter_model = $this->request->get['filter_model'];
        } else {
            $filter_model = null;
        }

        if (isset($this->request->get['filter_upc'])) {
            $filter_upc = $this->request->get['filter_upc'];
        } else {
            $filter_upc = null;
        }

        if (isset($this->request->get['filter_quantity'])) {
            $filter_quantity = $this->request->get['filter_quantity'];
        } else {
            $filter_quantity = null;
        }

        if (isset($this->request->get['length'])) {
            $length = $this->request->get['length'];
        } else {
            $length = null;
        }

        if (isset($this->request->get['version'])) {
            $version = $this->request->get['version'];
        } else {
            $version = null;
        }

        if (isset($this->request->get['filter_location'])) {
            $filter_location = $this->request->get['filter_location'];
        } else {
            $filter_location = null;
        }

        if (isset($this->request->get['sku_season'])) {
            $sku_season = $this->request->get['sku_season'];
        } else {
            $sku_season = null;
        }

        if (isset($this->request->get['filter_shirina'])) {
            $filter_shirina = $this->request->get['filter_shirina'];
        } else {
            $filter_shirina = null;
        }

        if (isset($this->request->get['filter_vysota'])) {
            $filter_vysota = $this->request->get['filter_vysota'];
        } else {
            $filter_vysota = null;
        }

        if (isset($this->request->get['filter_r'])) {
            $filter_r = $this->request->get['filter_r'];
        } else {
            $filter_r = null;
        }

        if (isset($this->request->get['status_filter'])) {
            $status_filter = $this->request->get['status_filter'];
        } else {
            $status_filter = null;
        }

        if (isset($this->request->get['filter_ean'])) {
            $filter_ean = $this->request->get['filter_ean'];
        } else {
            $filter_ean = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.date_delete';
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

        $url = '';


        if (isset($this->request->get['filter_shirina'])) {
            $url .= '&filter_shirina=' . urlencode(html_entity_decode($this->request->get['filter_shirina'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['status_filter'])) {
            $url .= '&status_filter=' . urlencode(html_entity_decode($this->request->get['status_filter'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['version'])) {
            $url .= '&version=' . urlencode(html_entity_decode($this->request->get['version'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['length'])) {
            $url .= '&length=' . urlencode(html_entity_decode($this->request->get['length'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['sku_season'])) {
            $url .= '&sku_season=' . urlencode(html_entity_decode($this->request->get['sku_season'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_location'])) {
            $url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . urlencode(html_entity_decode($this->request->get['filter_quantity'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_r'])) {
            $url .= '&filter_r=' . urlencode(html_entity_decode($this->request->get['filter_r'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_upc'])) {
            $url .= '&filter_upc=' . urlencode(html_entity_decode($this->request->get['filter_upc'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_vysota'])) {
            $url .= '&filter_vysota=' . urlencode(html_entity_decode($this->request->get['filter_vysota'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_ean'])) {
            $url .= '&filter_ean=' . urlencode(html_entity_decode($this->request->get['filter_ean'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/arhive_shiny', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('catalog/arhive_shiny/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['copy'] = $this->url->link('catalog/arhive_shiny/copy', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('catalog/arhive_shiny/delete', 'token=' . $this->session->data['token'] . $url, true);

        $data['products'] = array();

        $filter_data = array(
            'filter_model'	  => $filter_model,
            'filter_shirina'	  => $filter_shirina,
            'filter_vysota'	  => $filter_vysota,
            'status_filter'		=> $status_filter,
            'filter_ean'	  => $filter_ean,
            'filter_r'	  => $filter_r,
            'filter_location'	  => $filter_location,
            'filter_quatity'	  => $filter_quatity,
            'sku_season'	  => $sku_season,
            'version'	  => $version,
            'length' => $length,
            'filter_quantity' => $filter_quantity,
            'filter_upc' => $filter_upc,
            'sort'            => $sort,
            'order'           => $order,
            'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'           => $this->config->get('config_limit_admin')
        );

        $this->load->model('tool/image');

        $product_total = $this->model_catalog_arhive_shiny->getTotalProducts($filter_data);

        $product_total_count = $this->model_catalog_arhive_shiny->getProductCount();

        $data['product_total_count_all'] = $product_total_count;
        $data['product_total_count'] = $product_total;

        $results = $this->model_catalog_arhive_shiny->getProducts($filter_data);

        $this->load->model('catalog/category');

        $filter_data = array(
            'sort'        => 'name',
            'order'       => 'ASC'
        );

        $data['categories'] = $this->model_catalog_category->getCategories($filter_data);

        foreach ($results as $result) {
            $category =  $this->model_catalog_arhive_shiny->getProductCategories($result['product_id']);

            if (is_file(DIR_IMAGE . $result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 100, 100);
                $thumb = "/image/".$result['image'];
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 100, 100);
                $thumb = "/image/no_image.png";
            }

            $special = false;

            $shiny_description_data = $this->model_catalog_arhive_shiny->getProductDescriptions($result['product_id']);

            // Изображения
            $product_images = $this->model_catalog_arhive_shiny->getProductImages($result['product_id']);

            $product_images_mas = array();

            foreach ($product_images as $product_image) {
                if (is_file(DIR_IMAGE . $product_image['image'])) {
                    $image1 = $product_image['image'];
                    $thumb1 = $product_image['image'];
                } else {
                    $image1 = '';
                    $thumb1 = 'no_image.png';
                }

                $product_images_mas[] = array(
                    'image'      => $image1,
                    'thumb'      => $this->model_tool_image->resize($thumb1, 100, 100),
                    'sort_order' => $product_image['sort_order']
                );
            }

            $attribute_list = $this->model_catalog_arhive_shiny->getProductAttributes($result['product_id']);

            $data['products'][] = array(
                'product_id' => $result['product_id'],
                'image'      => $image,
                'thumb'      => $thumb,
                'images'     => $product_images_mas,
                'name'       => $result['name'],
                'model'      => $result['model'],
                'price'      => $result['price'],
                'price_BYN'	 => round($this->currency->convert($result['price'], "USD", 'BYN'), 0)." р.",
                'shirina'	 => $result['jan'],
                'vysota'	 => $result['isbn'],
                'date_delete' => date("d-m-Y", strtotime($result['date_delete'])),
                'r_size'	 => $result['mpn'],
                'marka'	     => $result['ean'],
                'model_s'	 => $result['upc'],
                'sostojan'	 => $result['location'],
                'length'	 => $result['length'],
                'season'	 => $result['sku'],
                'type_av'	 => $result['version'],
                'year_av'	 => $result['length'],
                'attributs'	 => $attribute_list,
                'category'   => $category,
                'special'    => $special,
                'description'=>$shiny_description_data,
                'date_modified' => $result['date_modified'],
                'date_added' => $result['date_added'],
                'quantity'   => $result['quantity'],
                'restore'    => $this->url->link('catalog/arhive_shiny/restore', 'token=' . $this->session->data['token'] . '&product_id=' . $result['product_id'] . $url, true),
                'deleted_url'=> "/admin/index.php?route=catalog/shiny/deleted&amp;product_id=".$result['product_id']."&amp;token=".$this->session->data['token']. $url,
                'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
                'edit'       => $this->url->link('catalog/shiny/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $result['product_id'] . $url, true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_image'] = $this->language->get('column_image');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_category'] = $this->language->get('column_category');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_price'] = $this->language->get('entry_price');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_image'] = $this->language->get('entry_image');

        $data['button_copy'] = $this->language->get('button_copy');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');

        $data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['sku_season'])) {
            $url .= '&sku_season=' . urlencode(html_entity_decode($this->request->get['sku_season'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['length'])) {
            $url .= '&length=' . urlencode(html_entity_decode($this->request->get['length'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['version'])) {
            $url .= '&version=' . urlencode(html_entity_decode($this->request->get['version'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . urlencode(html_entity_decode($this->request->get['filter_quantity'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_location'])) {
            $url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_shirina'])) {
            $url .= '&filter_shirina=' . urlencode(html_entity_decode($this->request->get['filter_shirina'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['status_filter'])) {
            $url .= '&status_filter=' . urlencode(html_entity_decode($this->request->get['status_filter'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_vysota'])) {
            $url .= '&filter_vysota=' . urlencode(html_entity_decode($this->request->get['filter_vysota'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_r'])) {
            $url .= '&filter_r=' . urlencode(html_entity_decode($this->request->get['filter_r'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_ean'])) {
            $url .= '&filter_ean=' . urlencode(html_entity_decode($this->request->get['filter_ean'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_upc'])) {
            $url .= '&filter_upc=' . urlencode(html_entity_decode($this->request->get['filter_upc'], ENT_QUOTES, 'UTF-8'));
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, true);
        $data['sort_model'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.model' . $url, true);
        $data['sort_price'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.price' . $url, true);
        $data['sort_quantity'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.quantity' . $url, true);
        $data['sort_status'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, true);
        $data['sort_order'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.sort_order' . $url, true);

        $url = '';

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . urlencode(html_entity_decode($this->request->get['filter_quantity'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_shirina'])) {
            $url .= '&filter_shirina=' . urlencode(html_entity_decode($this->request->get['filter_shirina'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['length'])) {
            $url .= '&length=' . urlencode(html_entity_decode($this->request->get['length'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_vysota'])) {
            $url .= '&filter_vysota=' . urlencode(html_entity_decode($this->request->get['filter_vysota'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['sku_season'])) {
            $url .= '&sku_season=' . urlencode(html_entity_decode($this->request->get['sku_season'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['version'])) {
            $url .= '&version=' . urlencode(html_entity_decode($this->request->get['version'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['status_filter'])) {
            $url .= '&status_filter=' . urlencode(html_entity_decode($this->request->get['status_filter'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_r'])) {
            $url .= '&filter_r=' . urlencode(html_entity_decode($this->request->get['filter_r'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_ean'])) {
            $url .= '&filter_ean=' . urlencode(html_entity_decode($this->request->get['filter_ean'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_upc'])) {
            $url .= '&filter_upc=' . urlencode(html_entity_decode($this->request->get['filter_upc'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_location'])) {
            $url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/shiny', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));

        $data['filter_model'] = $filter_model;
        $data['filter_shirina'] = $filter_shirina;
        $data['filter_vysota'] = $filter_vysota;
        $data['filter_r'] = $filter_r;
        $data['filter_ean'] = $filter_ean;
        $data['filter_location'] = $filter_location;
        $data['quantity'] = $filter_quantity;
        $data['sku_season'] = $sku_season;
        $data['length'] = $length;
        $data['version'] = $version;
        $data['upc'] = $filter_upc;
        $data['status_filter'] = $status_filter;

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/arhive_shiny_list', $data));
    }

    public function restore() {
        $this->load->language('catalog/arhive_shiny');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/arhive_shiny');
        $this->model_catalog_arhive_shiny->restoreProduct($this->request->get['product_id']);


        $this->session->data['success'] = $this->language->get('text_success');

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_price'])) {
            $url .= '&filter_price=' . $this->request->get['filter_price'];
        }

        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
        }

        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . $this->request->get['filter_category'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->response->redirect($this->url->link('catalog/arhive_shiny', 'token=' . $this->session->data['token'] . $url, true));
        //$this->getList();
    }

    protected function getForm() {

        if(isset($this->request->post['go_list_product']) && $this->request->post['go_list_product'] == "0"){
            $this->request->post['model'] = '';
            $this->request->post['image'] = '';
            $this->request->post['product_image'] = '';
        }

        //CKEditor
        if ($this->config->get('config_editor_default')) {
            $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
            $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
        } else {
            $this->document->addScript('view/javascript/summernote/summernote.js');
            $this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
            $this->document->addScript('view/javascript/summernote/opencart.js');
            $this->document->addStyle('view/javascript/summernote/summernote.css');
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['product_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_plus'] = $this->language->get('text_plus');
        $data['text_minus'] = $this->language->get('text_minus');
        $data['text_default'] = $this->language->get('text_default');
        $data['text_option'] = $this->language->get('text_option');
        $data['text_option_value'] = $this->language->get('text_option_value');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_percent'] = $this->language->get('text_percent');
        $data['text_amount'] = $this->language->get('text_amount');
        $data['text_select_all'] = $this->language->get('text_select_all');
        $data['text_unselect_all'] = $this->language->get('text_unselect_all');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_meta_title'] = $this->language->get('entry_meta_title');
        $data['entry_meta_h1'] = $this->language->get('entry_meta_h1');
        $data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
        $data['entry_keyword'] = $this->language->get('entry_keyword');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_sku'] = $this->language->get('entry_sku');
        $data['entry_upc'] = $this->language->get('entry_upc');
        $data['entry_ean'] = $this->language->get('entry_ean');
        $data['entry_jan'] = $this->language->get('entry_jan');
        $data['entry_isbn'] = $this->language->get('entry_isbn');
        $data['entry_mpn'] = $this->language->get('entry_mpn');
        $data['entry_location'] = $this->language->get('entry_location');
        $data['entry_minimum'] = $this->language->get('entry_minimum');
        $data['entry_shipping'] = $this->language->get('entry_shipping');
        $data['entry_date_available'] = $this->language->get('entry_date_available');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_stock_status'] = $this->language->get('entry_stock_status');
        $data['entry_price'] = $this->language->get('entry_price');
        $data['entry_tax_class'] = $this->language->get('entry_tax_class');
        $data['entry_points'] = $this->language->get('entry_points');
        $data['entry_option_points'] = $this->language->get('entry_option_points');
        $data['entry_subtract'] = $this->language->get('entry_subtract');
        $data['entry_weight_class'] = $this->language->get('entry_weight_class');
        $data['entry_weight'] = $this->language->get('entry_weight');
        $data['entry_dimension'] = $this->language->get('entry_dimension');
        $data['entry_length_class'] = $this->language->get('entry_length_class');
        $data['entry_length'] = $this->language->get('entry_length');
        $data['entry_width'] = $this->language->get('entry_width');
        $data['entry_height'] = $this->language->get('entry_height');
        $data['entry_image'] = $this->language->get('entry_image');
        $data['entry_additional_image'] = $this->language->get('entry_additional_image');
        $data['entry_store'] = $this->language->get('entry_store');
        $data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
        $data['entry_download'] = $this->language->get('entry_download');
        $data['entry_category'] = $this->language->get('entry_category');
        $data['entry_filter'] = $this->language->get('entry_filter');
        $data['entry_related'] = $this->language->get('entry_related');
        $data['entry_attribute'] = $this->language->get('entry_attribute');
        $data['entry_text'] = $this->language->get('entry_text');
        $data['entry_option'] = $this->language->get('entry_option');
        $data['entry_option_value'] = $this->language->get('entry_option_value');
        $data['entry_required'] = $this->language->get('entry_required');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_date_start'] = $this->language->get('entry_date_start');
        $data['entry_date_end'] = $this->language->get('entry_date_end');
        $data['entry_priority'] = $this->language->get('entry_priority');
        $data['entry_tag'] = $this->language->get('entry_tag');
        $data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $data['entry_reward'] = $this->language->get('entry_reward');
        $data['entry_layout'] = $this->language->get('entry_layout');
        $data['entry_recurring'] = $this->language->get('entry_recurring');
        $data['entry_main_category'] = $this->language->get('entry_main_category');

        $data['help_keyword'] = $this->language->get('help_keyword');
        $data['help_sku'] = $this->language->get('help_sku');
        $data['help_upc'] = $this->language->get('help_upc');
        $data['help_ean'] = $this->language->get('help_ean');
        $data['help_jan'] = $this->language->get('help_jan');
        $data['help_isbn'] = $this->language->get('help_isbn');
        $data['help_mpn'] = $this->language->get('help_mpn');
        $data['help_minimum'] = $this->language->get('help_minimum');
        $data['help_manufacturer'] = $this->language->get('help_manufacturer');
        $data['help_stock_status'] = $this->language->get('help_stock_status');
        $data['help_points'] = $this->language->get('help_points');
        $data['help_category'] = $this->language->get('help_category');
        $data['help_filter'] = $this->language->get('help_filter');
        $data['help_download'] = $this->language->get('help_download');
        $data['help_related'] = $this->language->get('help_related');
        $data['help_tag'] = $this->language->get('help_tag');

        $data['button_view'] = $this->language->get('button_view');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_attribute_add'] = $this->language->get('button_attribute_add');
        $data['button_option_add'] = $this->language->get('button_option_add');
        $data['button_option_value_add'] = $this->language->get('button_option_value_add');
        $data['button_discount_add'] = $this->language->get('button_discount_add');
        $data['button_special_add'] = $this->language->get('button_special_add');
        $data['button_image_add'] = $this->language->get('button_image_add');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_recurring_add'] = $this->language->get('button_recurring_add');

        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_data'] = $this->language->get('tab_data');
        $data['tab_attribute'] = $this->language->get('tab_attribute');
        $data['tab_option'] = $this->language->get('tab_option');
        $data['tab_recurring'] = $this->language->get('tab_recurring');
        $data['tab_discount'] = $this->language->get('tab_discount');
        $data['tab_special'] = $this->language->get('tab_special');
        $data['tab_image'] = $this->language->get('tab_image');
        $data['tab_links'] = $this->language->get('tab_links');
        $data['tab_reward'] = $this->language->get('tab_reward');
        $data['tab_design'] = $this->language->get('tab_design');
        $data['tab_openbay'] = $this->language->get('tab_openbay');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = array();
        }

        if (isset($this->error['model'])) {
            $data['error_model'] = $this->error['model'];
        } else {
            $data['error_model'] = '';
        }

        if (isset($this->error['keyword'])) {
            $data['error_keyword'] = $this->error['keyword'];
        } else {
            $data['error_keyword'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_price'])) {
            $url .= '&filter_price=' . $this->request->get['filter_price'];
        }

        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
        }

        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . $this->request->get['filter_category'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['product_id'])) {
            $data['action'] = $this->url->link('catalog/product/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $this->request->get['product_id'] . $url, true);

            $data['product_page'] = HTTP_CATALOG.'index.php?route=product/product&product_id='.$this->request->get['product_id'];
        }

        $this->load->model('catalog/arhive_shiny');
        $data['cancel'] = $this->url->link('catalog/arhive_shiny', 'token=' . $this->session->data['token'] . $url, true);

        if (isset($this->request->get['product_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $product_info = $this->model_catalog_arhive_shiny->getProduct($this->request->get['product_id']);
        }

        $data['token'] = $this->session->data['token'];
        $data['ckeditor'] = $this->config->get('config_editor_default');

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        $data['lang'] = $this->language->get('lang');

        if (isset($this->request->post['product_description'])) {
            $data['product_description'] = $this->request->post['product_description'];
        } elseif (isset($this->request->get['product_id'])) {
            $data['product_description'] = $this->model_catalog_arhive_shiny->getProductDescriptions($this->request->get['product_id']);
        } else {
            $data['product_description'] = array();
        }

        if (isset($this->request->post['model'])) {
            $data['model'] = $this->request->post['model'];
        } elseif (!empty($product_info)) {
            $data['model'] = $product_info['model'];
        } else {
            $data['model'] = '';
        }

        if (isset($this->request->post['sku'])) {
            $data['sku'] = $this->request->post['sku'];
        } elseif (!empty($product_info)) {
            $data['sku'] = $product_info['sku'];
        } else {
            $data['sku'] = '';
        }
        if (isset($this->request->post['diadiametr'])) {
            $data['diadiametr'] = $this->request->post['diadiametr'];
        } elseif (!empty($product_info)) {
            $data['diadiametr'] = $product_info['diadiametr'];
        } else {
            $data['diadiametr'] = '';
        }

        if (isset($this->request->post['version'])) {
            $data['version'] = $this->request->post['version'];
        } elseif (!empty($product_info)) {
            $data['version'] = $product_info['version'];
        } else {
            $data['version'] = '';
        }

        if (isset($this->request->post['upc'])) {
            $data['upc'] = $this->request->post['upc'];
        } elseif (!empty($product_info)) {
            $data['upc'] = $product_info['upc'];
        } else {
            $data['upc'] = '';
        }

        if (isset($this->request->post['ean'])) {
            $data['ean'] = $this->request->post['ean'];
        } elseif (!empty($product_info)) {
            $data['ean'] = $product_info['ean'];
        } else {
            $data['ean'] = '';
        }

        if (isset($this->request->post['jan'])) {
            $data['jan'] = $this->request->post['jan'];
        } elseif (!empty($product_info)) {
            $data['jan'] = $product_info['jan'];
        } else {
            $data['jan'] = '';
        }


        if (isset($this->request->post['etvylet'])) {
            $data['etvylet'] = $this->request->post['etvylet'];
        } elseif (!empty($product_info)) {
            $data['etvylet'] = $product_info['etvylet'];
        } else {
            $data['etvylet'] = '';
        }

        if (isset($this->request->post['isbn'])) {
            $data['isbn'] = $this->request->post['isbn'];
        } elseif (!empty($product_info)) {
            $data['isbn'] = $product_info['isbn'];
        } else {
            $data['isbn'] = '';
        }

        if (isset($this->request->post['main_category_dop'])) {
            $data['main_category_dop'] = $this->request->post['main_category_dop'];
        } else {
            $data['main_category_dop'] = '';
        }

        if (isset($this->request->post['mpn'])) {
            $data['mpn'] = $this->request->post['mpn'];
        } elseif (!empty($product_info)) {
            $data['mpn'] = $product_info['mpn'];
        } else {
            $data['mpn'] = '';
        }

        if (isset($this->request->post['location'])) {
            $data['location'] = $this->request->post['location'];
        } elseif (!empty($product_info)) {
            $data['location'] = $product_info['location'];
        } else {
            $data['location'] = '';
        }

        if ($this->config->get('config_product_upc_hide') != 0) {
            $data['hide_upc'] = true;
        } else {
            $data['hide_upc'] = false;
        }

        if ($this->config->get('config_product_ean_hide') != 0) {
            $data['hide_ean'] = true;
        } else {
            $data['hide_ean'] = false;
        }

        if ($this->config->get('config_product_jan_hide') != 0) {
            $data['hide_jan'] = true;
        } else {
            $data['hide_jan'] = false;
        }

        if ($this->config->get('config_product_isbn_hide') != 0) {
            $data['hide_isbn'] = true;
        } else {
            $data['hide_isbn'] = false;
        }

        if ($this->config->get('config_product_mpn_hide') != 0) {
            $data['hide_mpn'] = true;
        } else {
            $data['hide_mpn'] = false;
        }

        $this->load->model('setting/store');

        $data['stores'] = $this->model_setting_store->getStores();

        if (isset($this->request->post['keyword'])) {
            $data['keyword'] = $this->request->post['keyword'];
        } elseif (!empty($product_info)) {
            $data['keyword'] = $product_info['keyword'];
        } else {
            $data['keyword'] = '';
        }

        if (isset($this->request->post['shipping'])) {
            $data['shipping'] = $this->request->post['shipping'];
        } elseif (!empty($product_info)) {
            $data['shipping'] = $product_info['shipping'];
        } else {
            $data['shipping'] = 1;
        }

        if (isset($this->request->post['price'])) {
            $data['price'] = $this->request->post['price'];
        } elseif (!empty($product_info)) {
            $data['price'] = $product_info['price'];
        } else {
            $data['price'] = '';
        }

        $this->load->model('localisation/tax_class');

        $data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

        if (isset($this->request->post['tax_class_id'])) {
            $data['tax_class_id'] = $this->request->post['tax_class_id'];
        } elseif (!empty($product_info)) {
            $data['tax_class_id'] = $product_info['tax_class_id'];
        } else {
            $data['tax_class_id'] = 0;
        }

        if (isset($this->request->post['date_available'])) {
            $data['date_available'] = $this->request->post['date_available'];
        } elseif (!empty($product_info)) {
            $data['date_available'] = ($product_info['date_available'] != '0000-00-00') ? $product_info['date_available'] : '';
        } else {
            $data['date_available'] = date('Y-m-d');
        }

        if (isset($this->request->post['quantity'])) {
            $data['quantity'] = $this->request->post['quantity'];
        } elseif (!empty($product_info)) {
            $data['quantity'] = $product_info['quantity'];
        } else {
            $data['quantity'] = 1;
        }

        if (isset($this->request->post['minimum'])) {
            $data['minimum'] = $this->request->post['minimum'];
        } elseif (!empty($product_info)) {
            $data['minimum'] = $product_info['minimum'];
        } else {
            $data['minimum'] = 1;
        }

        if (isset($this->request->post['subtract'])) {
            $data['subtract'] = $this->request->post['subtract'];
        } elseif (!empty($product_info)) {
            $data['subtract'] = $product_info['subtract'];
        } else {
            $data['subtract'] = 1;
        }

        if (isset($this->request->post['sort_order'])) {
            $data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($product_info)) {
            $data['sort_order'] = $product_info['sort_order'];
        } else {
            $data['sort_order'] = 1;
        }

        $this->load->model('localisation/stock_status');

        $data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

        if (isset($this->request->post['stock_status_id'])) {
            $data['stock_status_id'] = $this->request->post['stock_status_id'];
        } elseif (!empty($product_info)) {
            $data['stock_status_id'] = $product_info['stock_status_id'];
        } else {
            $data['stock_status_id'] = 0;
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($product_info)) {
            $data['status'] = $product_info['status'];
        } else {
            $data['status'] = true;
        }

        if (isset($this->request->post['weight'])) {
            $data['weight'] = $this->request->post['weight'];
        } elseif (!empty($product_info)) {
            $data['weight'] = $product_info['weight'];
        } else {
            $data['weight'] = '';
        }

        $this->load->model('localisation/weight_class');

        $data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

        if (isset($this->request->post['weight_class_id'])) {
            $data['weight_class_id'] = $this->request->post['weight_class_id'];
        } elseif (!empty($product_info)) {
            $data['weight_class_id'] = $product_info['weight_class_id'];
        } else {
            $data['weight_class_id'] = $this->config->get('config_weight_class_id');
        }

        if (isset($this->request->post['length'])) {
            $data['length'] = $this->request->post['length'];
        } elseif (!empty($product_info)) {
            $data['length'] = $product_info['length'];
        } else {
            $data['length'] = '';
        }

        if (isset($this->request->post['width'])) {
            $data['width'] = $this->request->post['width'];
        } elseif (!empty($product_info)) {
            $data['width'] = $product_info['width'];
        } else {
            $data['width'] = '';
        }

        if (isset($this->request->post['height'])) {
            $data['height'] = $this->request->post['height'];
        } elseif (!empty($product_info)) {
            $data['height'] = $product_info['height'];
        } else {
            $data['height'] = '';
        }

        $this->load->model('localisation/length_class');

        $data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();

        if (isset($this->request->post['length_class_id'])) {
            $data['length_class_id'] = $this->request->post['length_class_id'];
        } elseif (!empty($product_info)) {
            $data['length_class_id'] = $product_info['length_class_id'];
        } else {
            $data['length_class_id'] = $this->config->get('config_length_class_id');
        }

        $this->load->model('catalog/manufacturer');

        $data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();

        if (isset($this->request->post['manufacturer_id'])) {
            $data['manufacturer_id'] = $this->request->post['manufacturer_id'];
        } elseif (!empty($product_info)) {
            $data['manufacturer_id'] = $product_info['manufacturer_id'];
        } else {
            $data['manufacturer_id'] = 0;
        }

        if (isset($this->request->post['manufacturer'])) {
            $data['manufacturer'] = $this->request->post['manufacturer'];
        } elseif (!empty($product_info)) {
            $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);

            if ($manufacturer_info) {
                $data['manufacturer'] = $manufacturer_info['name'];
            } else {
                $data['manufacturer'] = '';
            }
        } else {
            $data['manufacturer'] = '';
        }

        // Categories
        $this->load->model('catalog/category');

        $filter_data = array(
            'sort'        => 'name',
            'order'       => 'ASC'
        );

        $data['categories'] = $this->model_catalog_category->getCategories($filter_data);

        // Filters

        if (isset($this->request->post['main_category_id'])) {
            $data['main_category_id'] = $this->request->post['main_category_id'];
        } elseif (isset($product_info)) {
            $data['main_category_id'] = $this->model_catalog_arhive_shiny->getProductMainCategoryId($this->request->get['product_id']);
        } else {
            $data['main_category_id'] = 0;
        }

        if (isset($this->request->post['product_category'])) {
            $data['product_category'] = $this->request->post['product_category'];
        } elseif (isset($this->request->get['product_id'])) {
            $data['product_category'] = $this->model_catalog_arhive_shiny->getProductCategories($this->request->get['product_id']);
        } else {
            $data['product_category'] = array();
        }

        $this->load->model('catalog/filter');

        if (isset($this->request->post['product_filter'])) {
            $filters = $this->request->post['product_filter'];
        } elseif (isset($this->request->get['product_id'])) {
            $filters = $this->model_catalog_arhive_shiny->getProductFilters($this->request->get['product_id']);
        } else {
            $filters = array();
        }

        $data['product_filters'] = array();

        foreach ($filters as $filter_id) {
            $filter_info = $this->model_catalog_filter->getFilter($filter_id);

            if ($filter_info) {
                $data['product_filters'][] = array(
                    'filter_id' => $filter_info['filter_id'],
                    'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
                );
            }
        }

        // Attributes
        $this->load->model('catalog/attribute');

        if (isset($this->request->post['product_attribute'])) {
            $product_attributes = $this->request->post['product_attribute'];
        } elseif (isset($this->request->get['product_id'])) {
            $product_attributes = $this->model_catalog_arhive_shiny->getProductAttributes($this->request->get['product_id']);
        } else {
            $product_attributes = array();
        }


        $data['product_attributes'] = array();

        foreach ($product_attributes as $product_attribute) {
            $attribute_info = $this->model_catalog_attribute->getAttribute($product_attribute['attribute_id']);

            if ($attribute_info) {
                $data['product_attributes'][] = array(
                    'attribute_id'                  => $product_attribute['attribute_id'],
                    'name'                          => $attribute_info['name'],
                    'product_attribute_description' => $product_attribute['product_attribute_description']
                );
            }
        }


        $this->load->model('customer/customer_group');

        $data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();


        // Image
        if (isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif (!empty($product_info)) {
            $data['image'] = $product_info['image'];
        } else {
            $data['image'] = '';
        }

        $this->load->model('tool/image');

        if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
        } elseif (!empty($product_info) && is_file(DIR_IMAGE . $product_info['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($product_info['image'], 100, 100);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        // Images
        if (isset($this->request->post['product_image'])) {
            $product_images = $this->request->post['product_image'];
        } elseif (isset($this->request->get['product_id'])) {
            $product_images = $this->model_catalog_arhive_shiny->getProductImages($this->request->get['product_id']);
        } else {
            $product_images = array();
        }

        $data['product_images'] = array();

        foreach ($product_images as $product_image) {
            if (is_file(DIR_IMAGE . $product_image['image'])) {
                $image = $product_image['image'];
                $thumb = $product_image['image'];
            } else {
                $image = '';
                $thumb = 'no_image.png';
            }

            $data['product_images'][] = array(
                'image'      => $image,
                'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
                'sort_order' => $product_image['sort_order']
            );
        }

        if (isset($this->request->post['points'])) {
            $data['points'] = $this->request->post['points'];
        } elseif (!empty($product_info)) {
            $data['points'] = $product_info['points'];
        } else {
            $data['points'] = '';
        }

        $this->load->model('design/layout');

        $data['layouts'] = $this->model_design_layout->getLayouts();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/arhive_shiny_form', $data));
    }


    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'catalog/product')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        foreach ($this->request->post['product_description'] as $language_id => $value) {
            if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 255)) {
                $this->error['name'][$language_id] = $this->language->get('error_name');
            }
        }

        if((utf8_strlen($this->request->post['length']) != 4)) {
            $this->error['warning'] = "В поле год должно быть 4 цифры!";
        }

        if($this->request->post['length'] == "" || $this->request->post['length'] == "0") {
            $this->error['warning'] = $this->language->get('error_year');
        }

        if($this->request->post['manufacturer_id'] == "" || $this->request->post['manufacturer_id'] == "0") {
            $this->error['warning'] = $this->language->get('error_manufacturer');
        }

        if($this->request->post['main_category_id'] == "" || $this->request->post['main_category_id'] == "0") {
            $this->error['warning'] = $this->language->get('error_main_category');
        }

        // Генерируем ex_id, если не прилетел
        $this->load->model('catalog/product');
        if($this->request->post['model'] == ""){
            $chekMaxModel = $this->model_catalog_arhive_shiny->chekMaxModel();
            $chekMaxModel['MAX(product_id)'] = $chekMaxModel['MAX(product_id)'] + 2;
            $this->request->post['model'] = $chekMaxModel['MAX(product_id)'];
        } else{
            $model_product_info = $this->model_catalog_arhive_shiny->getModelProduct($this->request->post['model']);
            if(($model_product_info['model'] == $this->request->post['model']) && ($model_product_info['product_id'] != $this->request->get['product_id'])) {
                $this->error['warning'] = $this->language->get('error_model_ex_id');
            }
            if(preg_match("/[А-Яа-я]/", $this->request->post['model'])){
                $this->error['warning'] = $this->language->get('error_model_ex_id2');
            }
        }

        if (utf8_strlen($this->request->post['keyword']) > 0) {
            $this->load->model('catalog/url_alias');

            $url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

            if ($url_alias_info && isset($this->request->get['product_id']) && $url_alias_info['query'] != 'product_id=' . $this->request->get['product_id']) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }

            if ($url_alias_info && !isset($this->request->get['product_id'])) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }
        }

        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'catalog/product')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    protected function validateCopy() {
        if (!$this->user->hasPermission('modify', 'catalog/product')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    public function autocomplete() {
        $json = array();

        if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
            $this->load->model('catalog/arhive');
            $this->load->model('catalog/option');

            if (isset($this->request->get['filter_name'])) {
                $filter_name = $this->request->get['filter_name'];
            } else {
                $filter_name = '';
            }

            if (isset($this->request->get['filter_model'])) {
                $filter_model = $this->request->get['filter_model'];
            } else {
                $filter_model = '';
            }

            if (isset($this->request->get['limit'])) {
                $limit = $this->request->get['limit'];
            } else {
                $limit = 5;
            }

            $filter_data = array(
                'filter_name'  => $filter_name,
                'filter_model' => $filter_model,
                'start'        => 0,
                'limit'        => $limit
            );

            $results = $this->model_catalog_arhive_shiny->getProducts($filter_data);

            foreach ($results as $result) {
                $option_data = array();

                $product_options = $this->model_catalog_arhive_shiny->getProductOptions($result['product_id']);

                foreach ($product_options as $product_option) {
                    $option_info = $this->model_catalog_option->getOption($product_option['option_id']);

                    if ($option_info) {
                        $product_option_value_data = array();

                        foreach ($product_option['product_option_value'] as $product_option_value) {
                            $option_value_info = $this->model_catalog_option->getOptionValue($product_option_value['option_value_id']);

                            if ($option_value_info) {
                                $product_option_value_data[] = array(
                                    'product_option_value_id' => $product_option_value['product_option_value_id'],
                                    'option_value_id'         => $product_option_value['option_value_id'],
                                    'name'                    => $option_value_info['name'],
                                    'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
                                    'price_prefix'            => $product_option_value['price_prefix']
                                );
                            }
                        }

                        $option_data[] = array(
                            'product_option_id'    => $product_option['product_option_id'],
                            'product_option_value' => $product_option_value_data,
                            'option_id'            => $product_option['option_id'],
                            'name'                 => $option_info['name'],
                            'type'                 => $option_info['type'],
                            'value'                => $product_option['value'],
                            'required'             => $product_option['required']
                        );
                    }
                }

                $json[] = array(
                    'product_id' => $result['product_id'],
                    'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                    'model'      => $result['model'],
                    'option'     => $option_data,
                    'price'      => $result['price']
                );
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
