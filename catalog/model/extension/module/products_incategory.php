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

	/**
	 * Одним запросом: category_id => name, parent_id (для блока «похожие» без N+1).
	 *
	 * @param array $category_ids
	 * @return array<int, array{name:string,parent_id:int}>
	 */
	public function getCategoriesInfoByIds(array $category_ids) {
		$category_ids = array_values(array_unique(array_filter(array_map('intval', $category_ids))));
		if (!$category_ids) {
			return array();
		}

		$query = $this->db->query(
			"SELECT c.category_id, c.parent_id, cd.name FROM " . DB_PREFIX . "category c
			LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "')
			WHERE c.category_id IN (" . implode(',', $category_ids) . ")"
		);

		$map = array();
		foreach ($query->rows as $row) {
			$map[(int)$row['category_id']] = array(
				'name'      => isset($row['name']) ? $row['name'] : '',
				'parent_id' => (int)$row['parent_id'],
			);
		}

		return $map;
	}
}
?>