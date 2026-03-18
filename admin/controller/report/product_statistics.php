<?php
class ControllerReportProductStatistics extends Controller {
    public function index() {
        $this->load->language('report/product_statistics');
        $this->load->model('report/product_statistics');
        $this->load->model('catalog/product');

        $this->document->setTitle('Статистика З/Ч');

        $page = isset($this->request->get['page']) ? (int)$this->request->get['page'] : 1;
        $limit = 50;

        $data['today_stats'] = $this->model_report_product_statistics->getTodayStatistics();
        $data['today_stats_total'] = $this->model_report_product_statistics->getTotalViewsCount() . ' шт.';

        //$data['statistics_by_month'] = $this->model_report_product_statistics->getStatisticsByMonth();
        $data['statistics_by_days'] = $this->model_report_product_statistics->getStatisticsByDay(5);
        $data['statistics_by_years'] = $this->model_report_product_statistics->getStatisticsByYear();

        // Общая статистика с базы для пагинации
        $start = ($page - 1) * $limit;
        $products = $this->model_report_product_statistics->getProducts($start, $limit);
        $total_products = $this->model_report_product_statistics->getTotalProducts();

        $data['products'] = [];
        $i = 1;
        foreach ($products as $product) {
            $product_info = $this->model_catalog_product->getProduct($product['product_id']);

            $data['products'][] = [
                'num' => ($page - 1) * $limit + $i,
                'name' => $product['nameStatic'],
                'date' => explode(",", $product['view_date_list']),
                'article' => !$product_info['model'] ? '-' : $product_info['model'],
                'status' => !$product_info['model'] ? 'Продана' : ($product_info['status'] == 1 ? 'Активно' : 'Неактивно'),
                'countView' => $product['view_count'],
                'linkSite' => 'https://d4.by/index.php?route=catalog/product&product_id=' . $product['product_id'],
                'linkEdit' => $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $product['product_id'], true)
            ];
            $i++;
        }

        // Пагинация
        $pagination = new Pagination();
        $pagination->total = $total_products;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->url = $this->url->link('report/product_statistics', 'token=' . $this->session->data['token'] . '&page={page}', true);
        $data['pagination'] = $pagination->render();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('report/product_statistics.tpl', $data));
    }
}
