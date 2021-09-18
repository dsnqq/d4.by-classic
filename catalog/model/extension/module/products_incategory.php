<?php
class ModelExtensionModuleProductsInCategory extends Model {
	public function getProductMainCategoryId($product_id) {
		$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "' AND main_category = '1' LIMIT 1");

		return ($query->num_rows ? (int)$query->row['category_id'] : 0);
	}
	public function getProductMainCategoryName($main_category_id) {
		$query = $this->db->query("SELECT name FROM " . DB_PREFIX . "category_description WHERE category_id = '" . (int)$main_category_id. "'");

		return ($query->num_rows ? $query->row['name'] : 0);
	}
	public function getProductMainCategoryUrl($main_category_id) {
		$query = $this->db->query("SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = '" . "category_id=".(int)$main_category_id. "'");

		return ($query->num_rows ? $query->row['keyword'] : 0);
	}
}
?>