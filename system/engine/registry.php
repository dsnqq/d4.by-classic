<?php
final class Registry {
	private $data = array();

	public function get($key) {
		return (isset($this->data[$key]) ? $this->data[$key] : null);
	}

	public function set($key, $value) {
		$this->data[$key] = $value;/* IMDBOptimizer Start */
		if ($key == 'db') {
			if (class_exists('DB')) {
				require_once DIR_SYSTEM . 'IMDBOptimizer/Cache/IMDBOCacheProcessor.php';
				$processor = new IMDBOCacheProcessor($value);
				$this->data[$key] = $processor;
			}
		}/* IMDBOptimizer End */
	}

	public function has($key) {
		return isset($this->data[$key]);
	}
}