<?php
class ModelAccountingProductAccounting extends Model {

    public function getSales($data = []) {
        $sql = "
            SELECT *
            FROM " . DB_PREFIX . "product_accounting
            WHERE 1
        ";

        if (!empty($data['date_from'])) {
            $sql .= " AND DATE(sold_at) >= '" . $this->db->escape($data['date_from']) . "'";
        }

        if (!empty($data['date_to'])) {
            $sql .= " AND DATE(sold_at) <= '" . $this->db->escape($data['date_to']) . "'";
        }

        $sql .= " ORDER BY sold_at DESC";

        if (isset($data['start']) || isset($data['limit'])) {
            $start = (int)$data['start'];
            $limit = (int)$data['limit'];

            if ($start < 0) $start = 0;
            if ($limit < 1) $limit = 20;

            $sql .= " LIMIT " . $start . "," . $limit;
        }

        return $this->db->query($sql)->rows;
    }

    public function getTotalSales($data = []) {
        $sql = "
            SELECT COUNT(*) AS total
            FROM " . DB_PREFIX . "product_accounting
            WHERE 1
        ";

        if (!empty($data['date_from'])) {
            $sql .= " AND DATE(sold_at) >= '" . $this->db->escape($data['date_from']) . "'";
        }

        if (!empty($data['date_to'])) {
            $sql .= " AND DATE(sold_at) <= '" . $this->db->escape($data['date_to']) . "'";
        }

        return (int)$this->db->query($sql)->row['total'];
    }

    public function getStats() {
        return [
            'total' => (int)$this->db->query("
                SELECT COUNT(*) total FROM " . DB_PREFIX . "product_accounting
            ")->row['total'],

            'today' => (int)$this->db->query("
                SELECT COUNT(*) total FROM " . DB_PREFIX . "product_accounting
                WHERE DATE(sold_at) = CURDATE()
            ")->row['total'],

            'week' => (int)$this->db->query("
                SELECT COUNT(*) total FROM " . DB_PREFIX . "product_accounting
                WHERE sold_at >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
            ")->row['total'],

            'month' => (int)$this->db->query("
                SELECT COUNT(*) total FROM " . DB_PREFIX . "product_accounting
                WHERE sold_at >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
            ")->row['total'],
        ];
    }

    public function getSalesForExport($data = []) {
        $sql = "
        SELECT id, product_name, model, price, price_byn, sold_at
        FROM " . DB_PREFIX . "product_accounting
        WHERE 1
    ";

        if (!empty($data['date_from'])) {
            $sql .= " AND DATE(sold_at) >= '" . $this->db->escape($data['date_from']) . "'";
        }

        if (!empty($data['date_to'])) {
            $sql .= " AND DATE(sold_at) <= '" . $this->db->escape($data['date_to']) . "'";
        }

        $sql .= " ORDER BY sold_at DESC";

        return $this->db->query($sql)->rows;
    }

}
