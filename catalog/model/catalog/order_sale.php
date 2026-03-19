<?php
    class ModelCatalogOrderSale extends Model {
        public function getOrderProducts($order_id) {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

            return $query->rows;
        }

        public function getOrders($data = array()) {
            $sql = "SELECT * FROM oc_order";

            if (!empty($data['filter_order_id'])) {
                $sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
            }

            if (!empty($data['filter_customer'])) {
                $sql .= " AND CONCAT(o.firstname, ' ', o.lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
            }

            if (!empty($data['filter_date_added'])) {
                $sql .= " AND DATE(o.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
            }

            if (!empty($data['filter_date_modified'])) {
                $sql .= " AND DATE(o.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
            }

            if (!empty($data['filter_total'])) {
                $sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
            }

            $sql .= " ORDER BY order_id";


            if (isset($data['order']) && ($data['order'] == 'DESC')) {
                $sql .= " DESC";
            } else {
                $sql .= " ASC";
            }

            if (isset($data['start']) || isset($data['limit'])) {
                if ($data['start'] < 0) {
                    $data['start'] = 0;
                }

                if ($data['limit'] < 1) {
                    $data['limit'] = 20;
                }

                $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
            }

            $query = $this->db->query($sql);

            return $query->rows;
        }

        public function getTotalOrders() {
            $sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order`";

            $query = $this->db->query($sql);

            return $query->row['total'];
        }
    }
?>