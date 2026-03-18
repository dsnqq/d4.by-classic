<?php
class ControllerAccountingProductAccounting extends Controller {

    public function index() {
        $this->document->setTitle('Проданные запчасти');

        $this->load->model('accounting/product_accounting');

        // Фильтры
        $filter_date_from = $this->request->get['date_from'] ?? '';
        $filter_date_to   = $this->request->get['date_to'] ?? '';

        // Пагинация
        $page  = $this->request->get['page'] ?? 1;
        $limit = 20;
        $start = ($page - 1) * $limit;

        $filter_data = [
            'date_from' => $filter_date_from,
            'date_to'   => $filter_date_to,
            'start'     => $start,
            'limit'     => $limit
        ];

        $data['sales'] = [];
        $results = $this->model_accounting_product_accounting->getSales($filter_data);

        foreach ($results as $row) {
            $data['sales'][] = [
                'id'           => $row['id'],
                'product_name' => $row['product_name'],
                'model'        => $row['model'],
                'price'        => $row['price'],
                'price_byn'        => $row['price_byn'],
                'sold_at'      => date('Y-m-d H:i', strtotime($row['sold_at']))
            ];
        }

        // Статистика
        $stats = $this->model_accounting_product_accounting->getStats();
        $data['stats_total'] = $stats['total'];
        $data['stats_today'] = $stats['today'];
        $data['stats_week']  = $stats['week'];
        $data['stats_month'] = $stats['month'];

        // Всего записей
        $total = $this->model_accounting_product_accounting->getTotalSales($filter_data);

        // Пагинация
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->url = $this->url->link(
            'accounting/product_accounting',
            'token=' . $this->session->data['token'] .
            '&page={page}&date_from=' . $filter_date_from .
            '&date_to=' . $filter_date_to,
            true
        );

        $data['pagination'] = $pagination->render();
        $data['results'] = sprintf(
            'Показано с %d по %d из %d',
            ($total) ? ($start + 1) : 0,
            ((($start + $limit) > $total) ? $total : ($start + $limit)),
            $total
        );

        // Передача фильтров в шаблон
        $data['date_from'] = $filter_date_from;
        $data['date_to'] = $filter_date_to;

        // Общие элементы
        $data['token'] = $this->session->data['token'];
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput(
            $this->load->view('accounting/product_accounting.tpl', $data)
        );
    }

    public function exportCsv() {
        if (!isset($this->request->get['token']) ||
            $this->request->get['token'] != $this->session->data['token']) {
            exit('Invalid token');
        }

        $this->load->model('accounting/product_accounting');

        $filter_data = [
            'date_from' => $this->request->get['date_from'] ?? '',
            'date_to'   => $this->request->get['date_to'] ?? ''
        ];

        $results = $this->model_accounting_product_accounting->getSalesForExport($filter_data);

        header('Content-Type: text/csv; charset=utf-8');
        header('Content-Disposition: attachment; filename="product_sales_' . date('Y-m-d') . '.csv"');

        $output = fopen('php://output', 'w');

        // BOM для Excel
        fwrite($output, "\xEF\xBB\xBF");

        // Заголовки CSV
        fputcsv($output, [
            'ID',
            'Наименование',
            'Артикул',
            'Цена USD',
            'Цена BYN',
            'Дата продажи'
        ], ';');

        foreach ($results as $row) {
            fputcsv($output, [
                $row['id'],
                $row['product_name'],
                $row['model'],
                $row['price'],
                $row['price_byn'],
                $row['sold_at']
            ], ';');
        }

        fclose($output);
        exit;
    }

}
