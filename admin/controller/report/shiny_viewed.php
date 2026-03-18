<?php
class ControllerReportShinyViewed extends Controller {
    public function index() {
        $this->load->language('report/shiny_viewed');
        $this->load->model('catalog/product');

        $this->document->setTitle($this->language->get('heading_title'));

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

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
            'href' => $this->url->link('report/shiny_viewed', 'token=' . $this->session->data['token'] . $url, true)
        );

        $this->load->model('report/shiny');

        $filter_data = array(
            'start' => ($page - 1) * 100,
            'order' => "DESC",
            'limit' => 100
        );

        $data['products'] = array();

        // наши переменные
        $countAllArray = array();
        $countInt = 0;

        $getProductsAll = $this->model_report_shiny->getProductsAll(); // получить все данные
        foreach ($getProductsAll as $value => $key) {
            $dateInfo = date('d.m.Y', strtotime("+3 hours", $getProductsAll[$value]['view_date']));
            $getProductsAll[$value]['view_date'] = $dateInfo;
            $countAllArray[$dateInfo][$countInt] = $getProductsAll[$value]['product_id'];
            $countInt++;
        }

        $countAllArray = array_reverse($countAllArray, true);
        $data['countAllArray'] = $countAllArray;

        $product_view_all = $this->model_report_shiny->getProductsViews($filter_data);
        $product_viewed_total = $this->model_report_shiny->getTotalProductViews();
        $product_total = $this->model_report_shiny->getTotalProductsViewed();
        $product_total_today = $this->model_report_shiny->getDayProductsView();
        $data['product_total_today'] = $product_total_today;

        $i = 1;
        foreach($product_view_all as $product_view_item){

            $number = '';
            $pageNum = $this->request->get['page'];
            $tokenT = $this->request->get['token'];
            $number = ($pageNum) ? ((int)$pageNum*100)-100+$i: $i;




            $product_info = $this->model_catalog_product->getProduct($product_view_item['product_id']);
            $data['product_view_all'][] = array(
                'num'    => $number,
                //'date'   => date('d.m.Y-H:i:s', $product_view_item['view_date']),
                'date'   => date('d.m.Y-H:i:s', strtotime("+3 hours", $product_view_item['view_date'])),
                'name'  => $product_view_item['nameStatic'],
                'linkSite' => "/index.php?route=catalog/product&product_id=".$product_view_item['product_id'],
                'linkEdit' => "/admin/index.php?route=catalog/product/edit&token=".$tokenT."&product_id=".$product_view_item['product_id'],
                'countView' => $product_view_item['view_count'],
                'article' =>  $product_info['model'],
                'status' => $product_info['status'],
                'linkDeleted' => "/admin/index.php?route=catalog/product/deleted&amp;product_id=".$product_view_item['product_id']."&amp;token=".$tokenT

            );
            $hot = "";
            $i++;
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_viewed'] = $this->language->get('column_viewed');
        $data['column_percent'] = $this->language->get('column_percent');

        $data['button_reset'] = $this->language->get('button_reset');
        $data['product_total'] = $product_total;

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['reset'] = $this->url->link('report/shiny_viewed/reset', 'token=' . $this->session->data['token'] . $url, true);

        if (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } elseif (isset($this->error['warning'])) {
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
        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = 100;
        $pagination->url = $this->url->link('report/shiny_viewed', 'token=' . $this->session->data['token'] . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('report/shiny_viewed', $data));
    }

    public function reset() {
        $this->load->language('report/shiny_viewed');

        if (!$this->user->hasPermission('modify', 'report/shiny_viewed')) {
            $this->session->data['error'] = $this->language->get('error_permission');
        } else {
            $this->load->model('report/product');

            $this->model_report_shiny->reset();

            $this->session->data['success'] = $this->language->get('text_success');
        }

        $this->response->redirect($this->url->link('report/shiny_viewed', 'token=' . $this->session->data['token'], true));
    }
}