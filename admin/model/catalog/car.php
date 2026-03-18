<?php

class ModelCatalogCar extends Model {
    public function getCar() {
        $sql = "SELECT * FROM " . DB_PREFIX . "car";

        $query = $this->db->query($sql);

        return $query->rows;

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "car");

        return $query->row;
    }
}