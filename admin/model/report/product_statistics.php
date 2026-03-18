<?php
class ModelReportProductStatistics extends Model {

    /** Подсчёт количества за сегодня просмотров в файле **/
    public function getTotalViewsCount() {
        $file = DIR_SYSTEM . 'product_views.log';
        if (!file_exists($file)) return 0;

        $lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        return count($lines);
    }

    /** Вывод последних 30 промотренных З/Ч из файла **/
    public function getTodayStatistics() {
        $stats = [];

        $file = DIR_SYSTEM . 'product_views.log';
        if (!file_exists($file)) return $stats;

        $lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

        // Читаем снизу вверх
        $lines = array_reverse($lines);

        $i = 1;
        $product_ids = [];

        // Сначала собираем уникальные product_id
        foreach ($lines as $line) {
            $view = json_decode($line, true);
            if (!$view) continue;

            $pid = (int)$view['product_id'];
            if (!in_array($pid, $product_ids)) {
                $product_ids[] = $pid;
            }
        }

        // Ограничиваем только последние 30 уникальных товаров
        $product_ids = array_slice($product_ids, 0, 30);

        // Получаем данные из базы по этим product_id
        if ($product_ids) {
            $ids_str = implode(',', $product_ids);
            $query = $this->db->query("
            SELECT p.product_id, p.model, pd.name, p.status
            FROM " . DB_PREFIX . "product p
            LEFT JOIN " . DB_PREFIX . "product_description pd
            ON (p.product_id = pd.product_id)
            WHERE p.product_id IN ($ids_str) AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
        ");

            $products_data = [];
            foreach ($query->rows as $row) {
                $products_data[$row['product_id']] = $row;
            }
        }

        // Формируем статистику
        foreach ($lines as $line) {
            $view = json_decode($line, true);
            if (!$view) continue;

            $pid = (int)$view['product_id'];

            if (!in_array($pid, $product_ids)) continue; // Берем только последние 30

            if (!isset($stats[$pid])) {
                $stats[$pid] = [
                    'num'   => $i,
                    'count' => 0,
                    'name'  => $view['nameStatic'],
                    'model' => !$products_data[$pid]['model'] ? '-' : $products_data[$pid]['model'],
                    'status' => !$products_data[$pid]['model'] ? 'Продана' : ($products_data[$pid]['status'] == 1 ? 'Активно' : 'Неактивно'),
                    'linkSite' => 'https://d4.by/index.php?route=catalog/product&product_id=' . $pid,
                    'linkEdit' => $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $pid, true),
                    'date'  => date('Y-m-d H:i:s', strtotime("+3 hours", $view['timestamp']))
                ];
                $i++;
            }

            $stats[$pid]['count']++;
        }

        return $stats;
    }

    /** Получается статистику по месяцам последние 12 **/
    public function getStatisticsByMonth() {
        $stats = [];

        // Формируем массив последних 12 месяцев
        $months = [];
        for ($i = 0; $i < 12; $i++) {
            $months[] = date('Y-m', strtotime("-$i month"));
        }

        // Инициализируем статистику нулями
        foreach ($months as $m) {
            $stats[$m] = 0;
        }

        // Берём все записи с view_date_list
        $query = $this->db->query("SELECT view_date_list FROM " . DB_PREFIX . "product_statistics");

        foreach ($query->rows as $row) {
            $dates = explode(',', $row['view_date_list']); // массив timestamp

            foreach ($dates as $ts) {
                $ts = (int)$ts;
                if ($ts <= 0) continue;

                $month = date('Y-m', $ts);

                // Считаем только если месяц входит в последние 12 месяцев
                if (isset($stats[$month])) {
                    $stats[$month]++;
                }
            }
        }

        // Сортируем по возрастанию даты
        //ksort($stats);

        return $stats;
    }

    public function getStatisticsByDay($days = 10) {
        $stats = [];

        // Формируем массив последних $days дней
        $dates_list = [];
        for ($i = 0; $i < $days; $i++) {
            $day = date('Y-m-d', strtotime("-$i day"));
            $dates_list[$day] = 0; // инициализируем нулями
        }

        // Берём все записи с view_date_list
        $query = $this->db->query("SELECT view_date_list FROM " . DB_PREFIX . "product_statistics");

        foreach ($query->rows as $row) {
            $timestamps = explode(',', $row['view_date_list']); // массив timestamp

            foreach ($timestamps as $ts) {
                $ts = (int)$ts;
                if ($ts <= 0) continue;

                $day = date('Y-m-d', $ts);

                // Считаем только если день входит в последние $days дней
                if (isset($dates_list[$day])) {
                    $dates_list[$day]++;
                }
            }
        }

        // Сортируем по возрастанию даты (от старого к новому)
        //ksort($dates_list);

        return $dates_list;
    }

    // Получение статистики из базы за произвольный период
    public function getStatisticsFromDb($start_date = '', $end_date = '') {
        $sql = "SELECT * FROM `" . DB_PREFIX . "product_statistics`";
        $where = [];
        if ($start_date) $where[] = "view_date_list LIKE '%" . $this->db->escape($start_date) . "%'";
        if ($end_date) $where[] = "view_date_list LIKE '%" . $this->db->escape($end_date) . "%'";
        if ($where) $sql .= " WHERE " . implode(" AND ", $where);

        $query = $this->db->query($sql);
        return $query->rows;
    }

    /** Получение всех З/Ч для пагинации **/
    /*public function getProducts($start = 0, $limit = 100) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_statistics` ORDER BY view_count DESC LIMIT " . (int)$start . "," . (int)$limit);
        return $query->rows;
    }*/

    /** Получение всех З/Ч для пагинации **/
    public function getProducts($start = 0, $limit = 100) {
        $query = $this->db->query("SELECT *, CAST(SUBSTRING_INDEX(view_date_list, ',', -1) AS UNSIGNED) AS last_view FROM `" . DB_PREFIX . "product_statistics` ORDER BY last_view DESC LIMIT " . (int)$start . "," . (int)$limit);
        return $query->rows;
    }

    public function getTotalProducts() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "product_statistics`");
        return $query->row['total'];
    }

    public function getStatisticsByYear() {
        $cache_key = 'product_statistics_years';

        // Проверяем есть ли кеш
        $stats = $this->cache->get($cache_key);
        if ($stats) {
            return $stats; // возвращаем из кеша
        }

        // Если нет кеша, формируем статистику
        $stats = [];

        $query = $this->db->query("SELECT view_date_list FROM `" . DB_PREFIX . "product_statistics`");

        foreach ($query->rows as $row) {
            $dates = explode(',', $row['view_date_list']); // массив timestamp

            foreach ($dates as $ts) {
                $ts = (int)$ts;
                if ($ts <= 0) continue;

                $year = date('Y', $ts);
                $month = date('m', $ts);

                if (!isset($stats[$year])) {
                    $stats[$year] = [
                        'total' => 0,
                        'months' => []
                    ];
                }

                if (!isset($stats[$year]['months'][$month])) {
                    $stats[$year]['months'][$month] = 0;
                }

                // Считаем просто количество дат
                $stats[$year]['months'][$month]++;
                $stats[$year]['total']++;
            }
        }

        $stats['2025']['months']['11'] = 98664;

        // Сортируем годы по убыванию (последний год первым)
        krsort($stats);

        // Сортируем месяцы в каждом году по убыванию (последний месяц первым)
        foreach ($stats as &$year_data) {
            ksort($year_data['months']);
        }

        // Сохраняем результат в кеш на 2 недели (14*24*60*60 секунд)
        $this->cache->set($cache_key, $stats, 14*24*60*60);

        return $stats;
    }
}
