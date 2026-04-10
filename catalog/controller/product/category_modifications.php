<?php

class ControllerProductCategoryModifications extends Controller {

	public function index() {
		$this->response->addHeader('Content-Type: text/html; charset=UTF-8');

		if (!isset($this->request->server['REQUEST_METHOD']) || $this->request->server['REQUEST_METHOD'] != 'POST') {
			$this->response->addHeader('HTTP/1.1 405 Method Not Allowed');
			$this->response->setOutput(' ');

			return;
		}

		$category_id = isset($this->request->post['category_id']) ? (int) $this->request->post['category_id'] : 0;

		if ($category_id < 1) {
			$this->response->setOutput('');

			return;
		}

		$language_id = (int) $this->config->get('config_language_id');

		$query = $this->db->query("
			SELECT DISTINCT fd.name
			FROM `" . DB_PREFIX . "category_filter` cf
			INNER JOIN `" . DB_PREFIX . "filter_description` fd ON (cf.filter_id = fd.filter_id)
			WHERE cf.category_id = '" . (int) $category_id . "'
			AND fd.language_id = '" . $language_id . "'
			ORDER BY fd.name ASC
		");

		$html = '';

		foreach ($query->rows as $row) {
			$name = htmlspecialchars((string) $row['name'], ENT_QUOTES | ENT_HTML5, 'UTF-8');
			$html .= "<div class='link_modification'> - {$name}</div>\n";
		}

		$this->response->setOutput($html);
	}
}
