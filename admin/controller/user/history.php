<?php
class ControllerUserHistory extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('user/user');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('user/user');

        $this->getList();
    }

    public function edit() {
        $this->load->language('user/user');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('user/user');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_user_user->editUser($this->request->get['user_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('user/user', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    protected function getList() {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'username';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

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
            'href' => $this->url->link('user/user', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('user/user/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('user/user/delete', 'token=' . $this->session->data['token'] . $url, true);

        $data['users'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * 30,
            'limit' => 30
        );

        $user_total = $this->model_user_user->getTotalUsers();

        $results = $this->model_user_user->getUsers($filter_data);

        foreach ($results as $result) {
                $data['users'][] = array(
                    'user_id' => $result['user_id'],
                    'lastname' => $result['lastname'],
                    'firstname' => $result['firstname'],
                    'username' => $result['username'],
                    'status' => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
                    'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'edit' => $this->url->link('user/history/edit', 'token=' . $this->session->data['token'] . '&user_id=' . $result['user_id'] . $url, true)
                );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_username'] = $this->language->get('column_username');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

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

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_username'] = $this->url->link('user/user', 'token=' . $this->session->data['token'] . '&sort=username' . $url, true);
        $data['sort_status'] = $this->url->link('user/user', 'token=' . $this->session->data['token'] . '&sort=status' . $url, true);
        $data['sort_date_added'] = $this->url->link('user/user', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, true);

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $user_total;
        $pagination->page = $page;
        $pagination->limit = 30;
        $pagination->url = $this->url->link('user/user', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($user_total) ? (($page - 1) * 30) + 1 : 0, ((($page - 1) * 30) > ($user_total - 30)) ? $user_total : ((($page - 1) * 30) + 30), $user_total, ceil($user_total / 30));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('user/history_list', $data));
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['user_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_username'] = $this->language->get('entry_username');
        $data['entry_user_group'] = $this->language->get('entry_user_group');
        $data['entry_password'] = $this->language->get('entry_password');
        $data['entry_confirm'] = $this->language->get('entry_confirm');
        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_image'] = $this->language->get('entry_image');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['token_x'] = $this->session->data['token'];

        if (isset($this->request->get['filter_model'])) {
            $filter_model = $this->request->get['filter_model'];
        } else {
            $filter_model = null;
        }

        $data["filter_model"] = $filter_model;

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['username'])) {
            $data['error_username'] = $this->error['username'];
        } else {
            $data['error_username'] = '';
        }

        if (isset($this->error['password'])) {
            $data['error_password'] = $this->error['password'];
        } else {
            $data['error_password'] = '';
        }

        if (isset($this->error['confirm'])) {
            $data['error_confirm'] = $this->error['confirm'];
        } else {
            $data['error_confirm'] = '';
        }

        if (isset($this->error['firstname'])) {
            $data['error_firstname'] = $this->error['firstname'];
        } else {
            $data['error_firstname'] = '';
        }

        if (isset($this->error['lastname'])) {
            $data['error_lastname'] = $this->error['lastname'];
        } else {
            $data['error_lastname'] = '';
        }

        if (isset($this->error['email'])) {
            $data['error_email'] = $this->error['email'];
        } else {
            $data['error_email'] = '';
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
            $param_page = '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('user/user', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['user_id'])) {
            $data['action'] = $this->url->link('user/user/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('user/user/edit', 'token=' . $this->session->data['token'] . '&user_id=' . $this->request->get['user_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('user/history', 'token=' . $this->session->data['token'], true);

        if (isset($this->request->get['user_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $user_info = $this->model_user_user->getUser($this->request->get['user_id']);
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $this->load->model('catalog/product');
        $this->load->model('catalog/category');
        $this->load->model('tool/image');
        $this->load->model('catalog/manufacturer');

        $changes_total = $this->model_catalog_product->getTotalChanges($this->request->get['user_id']);

        $filter_data_h = array(
            'user_id'  => $this->request->get['user_id'],
            'start' => ($page - 1) * 30,
            'filter_model'	  => $filter_model,
            'limit' => 30
        );

        $changes = $this->model_catalog_product->getChangeProductHistoryData($filter_data_h);

        foreach ($changes as $result) {
            $product_info_history = $this->model_catalog_product->getProduct($result['product_id']);
            $arhive_info_history = $this->model_catalog_product->getArhiveHistoryData($result['product_id']);

            $manufacturer_product = $this->model_catalog_manufacturer->getManufacturer((int)$product_info_history['manufacturer_id']);
            $manufacturer_arhive = $this->model_catalog_manufacturer->getManufacturer((int)$arhive_info_history[0]['manufacturer_id']);

            $categories = $this->model_catalog_product->getProductCategories($product_info_history['product_id']);
            $category_paths = array();
            foreach($categories as $cat) {
                $category = $this->model_catalog_category->getCategory($cat);
                $category_paths[] = (($category['path']) ? $category['path'] . '  ' : '') . $category['name'];
            }
            $cat_qr_product = implode("<br />", $category_paths);

            $categories_x = $this->model_catalog_product->getProductCategoriesX($arhive_info_history[0]['product_id']);
            $category_paths_x = array();
            foreach($categories_x as $cat) {
                $category = $this->model_catalog_category->getCategory($cat);
                $category_paths_x[] = (($category['path']) ? $category['path'] . '  ' : '') . $category['name'];
            }
            $cat_qr_arhive = implode("<br />", $category_paths_x);

            if($result['value_name'] == "Статус") {
                $result['value_old'] = ($result['value_old'] == 1) ? "Активно" : "Неактивно";
                $result['value_new'] = ($result['value_new'] == 1) ? "Активно" : "Неактивно";
            }

            $date = new DateTime($result['data_change']);
            $result['data_change'] = $date->format("d.m.Y H:i:s");

            $data["changes"][] = array(
                'image' => $this->model_tool_image->resize($product_info_history['image'], 100, 100),
                'product_id' => $product_info_history['product_id'],
                'product_model' => $product_info_history['model'],
                'arhive_id' => $arhive_info_history[0]['product_id'],
                'arhive_model' => $arhive_info_history[0]['model'],
                'arhive_price' => $arhive_info_history[0]['price'],
                'arhive_price_byn' => round($this->currency->convert($arhive_info_history[0]['price'], "USD", 'BYN'), '0')."р.",
                'product_price' => $product_info_history['price'],
                'product_price_byn' => round($this->currency->convert($product_info_history['price'], "USD", 'BYN'), '0')."р.",
                'value_name'   => $result['value_name'],
                'auto_product' => $cat_qr_product,
                'auto_arhive' => $cat_qr_arhive,
                'manufacturer_product' => $manufacturer_product,
                'manufacturer_arhive' => $manufacturer_arhive,
                'data_change'   => $result['data_change'],
                'value_old'   => $result['value_old'],
                'value_new'   => $result['value_new'],
                'year_product'  => $product_info_history['length'],
                'year_arhive'  => $arhive_info_history[0]['length'],
                'arhive_status'   => $arhive_info_history[0],
                'arhive_image' => $this->model_tool_image->resize($arhive_info_history[0]['image'], 100, 100)
            );
        }

        if (isset($this->request->post['username'])) {
            $data['username'] = $this->request->post['username'];
        } elseif (!empty($user_info)) {
            $data['username'] = $user_info['username'];
        } else {
            $data['username'] = '';
        }

        if (isset($this->request->post['user_group_id'])) {
            $data['user_group_id'] = $this->request->post['user_group_id'];
        } elseif (!empty($user_info)) {
            $data['user_group_id'] = $user_info['user_group_id'];
        } else {
            $data['user_group_id'] = '';
        }

        $this->load->model('user/user_group');

        $data['user_groups'] = $this->model_user_user_group->getUserGroups();

        if (isset($this->request->post['password'])) {
            $data['password'] = $this->request->post['password'];
        } else {
            $data['password'] = '';
        }

        if (isset($this->request->post['confirm'])) {
            $data['confirm'] = $this->request->post['confirm'];
        } else {
            $data['confirm'] = '';
        }

        if (isset($this->request->post['firstname'])) {
            $data['firstname'] = $this->request->post['firstname'];
        } elseif (!empty($user_info)) {
            $data['firstname'] = $user_info['firstname'];
        } else {
            $data['firstname'] = '';
        }

        if (isset($this->request->post['lastname'])) {
            $data['lastname'] = $this->request->post['lastname'];
        } elseif (!empty($user_info)) {
            $data['lastname'] = $user_info['lastname'];
        } else {
            $data['lastname'] = '';
        }

        if (isset($this->request->post['email'])) {
            $data['email'] = $this->request->post['email'];
        } elseif (!empty($user_info)) {
            $data['email'] = $user_info['email'];
        } else {
            $data['email'] = '';
        }

        if (isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif (!empty($user_info)) {
            $data['image'] = $user_info['image'];
        } else {
            $data['image'] = '';
        }

        $this->load->model('tool/image');

        if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
        } elseif (!empty($user_info) && $user_info['image'] && is_file(DIR_IMAGE . $user_info['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($user_info['image'], 100, 100);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($user_info)) {
            $data['status'] = $user_info['status'];
        } else {
            $data['status'] = 0;
        }

        $user_id_x = $this->request->get['user_id'];
        $data["user_id_x"] = $this->request->get['user_id'];
        $pagination = new Pagination();
        $pagination->total = $changes_total;
        $pagination->page = $page;
        $pagination->limit = 30;

        $url = preg_replace($param_page, '', $url);
        $pagination->url = $this->url->link('user/history/edit', 'token=' . $this->session->data['token'] . $url . '&user_id='.$user_id_x.'&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($changes_total) ? (($page - 1) * 30) + 1 : 0, ((($page - 1) * 30) > ($changes_total - 30)) ? $changes_total : ((($page - 1) * 30) + 30), $changes_total, ceil($changes_total / 30));


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('user/history_form', $data));
    }
}