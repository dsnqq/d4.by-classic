<?php
/**
 * Stub Core class for PHP 8.x compatibility.
 * Used when ionCube-encoded core files (PHP 7.x) cannot run on PHP 8.x.
 * The CityManager module will be silently disabled.
 * To restore full functionality, obtain a PHP 8.x-compatible version
 * from the module developer: mr.progroman@yandex.ru
 */
namespace progroman\CityManager;

abstract class Core {
    const NOMINATIVE = 0;

    protected static $instance;
    protected static $drivers = [];

    protected $registry;
    protected $session;
    protected $country_id = 0;
    protected $country_name = '';
    protected $zone_id = 0;
    protected $zone_name = '';
    protected $district_name = '';
    protected $prefix_zone_name = '';
    protected $prefix_city_name = '';
    protected $city_name = '';
    protected $postcode = '';
    protected $fias_country_id = 0;
    protected $fias_zone_id = 0;
    protected $fias_id = 0;
    protected $popup_city_name = null;
    protected $dev_mode = false;
    protected $is_first_visit = false;

    public function __construct() {
        $this->session = new class {
            public $data = [];
        };
    }

    public static function instance() {
        if (!static::$instance) {
            static::$instance = new static();
        }
        return static::$instance;
    }

    public static function addDriver($driver) {
        static::$drivers[] = $driver;
    }

    public static function validLicense($secret_key) {
        return false;
    }

    public function defineLocation() {}
    public function setCurrency() {}
    public function setFias($fias_id) { return false; }

    public function setting($key, $value = null) { return null; }
    public function getSessionKey() { return 'progroman_citymanager'; }
    public function getCookieKey($key) { return 'progroman_cm_' . $key; }
    public function getValueFromSession($key) { return null; }
    public function getRedirectUrl($uri) { return false; }
    public function getMessage($key) { return ''; }
    public function getMessages() { return []; }
    public function setCookie($key, $value, $time = 0) {}

    protected function loadModel($name) {
        return new class {
            public function __call($name, $args) { return []; }
        };
    }

    protected function log($msg) {}
    protected function needRedirect() { return false; }
}
