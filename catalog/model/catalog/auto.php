<?php

class ModelCatalogAuto extends Model {
    public function getCars($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "car";

        $sql .= " ORDER BY product_id DESC";

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

    public function getCar($id) {
        $sql = "SELECT * FROM " . DB_PREFIX . "car WHERE `product_id`=" . $id;
        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getMarka() {
        $product_marka_data = array();

        $sql = "SELECT cd.name FROM " . DB_PREFIX . "category c INNER JOIN " . DB_PREFIX . "category_description cd ON c.category_id = cd.category_id WHERE c.parent_id = 0";
        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $product_marka_data[] = $result['name'];
        }

        return $product_marka_data;
    }

    public function getModel($post) {
        $product_model_data = array();
        $model_id = '';

        $sql = "SELECT category_id FROM " . DB_PREFIX . "category_description WHERE name = '".$post['marka']."'";
        $query = $this->db->query($sql);
        $model_id = $query->rows[0]['category_id'];

        $sql2 = "SELECT cd.name FROM " . DB_PREFIX . "category c INNER JOIN " . DB_PREFIX . "category_description cd ON c.category_id = cd.category_id WHERE c.parent_id = '".$model_id."'";
        $query2 = $this->db->query($sql2);

        foreach ($query2->rows as $result) {
            $product_model_data[] = $result['name'];
        }

        return $product_model_data;
    }

    public function getTotalCarsId() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "car");

        return $query->row['total'];
    }
    
    public function setCar($data, $car_images) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "car SET model = '" . $this->db->escape($data['model']) . "', modelCar = '" . $this->db->escape($data['modelCar']) . "', name = '" . $this->db->escape($data['name']) . "', marka = '" . $this->db->escape($data['marka']) . "', vin = '" . $this->db->escape($data['vin']) . "', country = '" . $this->db->escape($data['country']) . "', year = '" . $this->db->escape($data['year']) . "', power = '" . $this->db->escape($data['power']) . "', volume = '" . $this->db->escape($data['volume']) . "', typePower = '" . $this->db->escape($data['typePower']) . "', aboutPower = '" . $this->db->escape($data['aboutPower']) . "', body = '" . $this->db->escape($data['body']) . "', status = '" . (int)$data['status'] . "', color = '" . $this->db->escape($data['color']) . "', date_added = NOW()");

        $car_id = $this->db->getLastId();

        if (isset($car_images)) {
            $this->db->query("UPDATE " . DB_PREFIX . "car SET images = '" . $this->db->escape($car_images) . "' WHERE product_id = '" . (int)$car_id . "'");
        }

        $this->cache->delete('car');

        return $car_id;
    }

    public function removeCar($id) {
        $this->db->query("INSERT INTO  " . DB_PREFIX . "arhive_car SELECT * FROM " . DB_PREFIX . "car WHERE product_id = '" . (int)$id . "'");
        $this->db->query("UPDATE  " . DB_PREFIX . "arhive_car SET date_delete = NOW() WHERE product_id = '" . (int)$id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "car WHERE product_id = '" . (int)$id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$id . "'");

        $this->cache->delete('car');
    }
    
    public function saveCar($id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "car SET " . $this->db->escape($data['name']) . "= '" . $this->db->escape($data['edits']) . "' WHERE product_id = '" . (int)$id . "'");

        $this->cache->delete('car');
    }

    public function editCar($id, $data, $car_images) {
        $this->db->query("UPDATE " . DB_PREFIX . "car SET model = '" . $this->db->escape($data['model']) . "', modelCar = '" . $this->db->escape($data['modelCar']) . "', name = '" . $this->db->escape($data['name']) . "', marka = '" . $this->db->escape($data['marka']) . "', vin = '" . $this->db->escape($data['vin']) . "', country = '" . $this->db->escape($data['country']) . "', year = '" . $this->db->escape($data['year']) . "', power = '" . $this->db->escape($data['power']) . "', volume = '" . $this->db->escape($data['volume']) . "', typePower = '" . $this->db->escape($data['typePower']) . "', aboutPower = '" . $this->db->escape($data['aboutPower']) . "', body = '" . $this->db->escape($data['body']) . "', status = '" . (int)$data['status'] . "', color = '" . $this->db->escape($data['color']) . "', date_modified = NOW() WHERE product_id = '" . (int)$id . "'");

        if (isset($car_images)) {
            $this->db->query("UPDATE " . DB_PREFIX . "car SET images = '" . $this->db->escape($car_images) . "' WHERE product_id = '" . (int)$id . "'");
        }

        $this->cache->delete('car');
    }
}