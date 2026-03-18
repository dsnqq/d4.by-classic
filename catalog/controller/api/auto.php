<?php
class ControllerApiAuto extends Controller {
    /*
     * Main function to handle HTTP request
     * */
    public function cars() {
        $postRead  = json_decode(file_get_contents('php://input'),true);
        $postWrite = $this->request->post;

        $route = $this->request->get['route'];
        $path = explode('/', $route);
        $login = $this->_getAuth($postRead, $this->request->server);

        $login = true; // NO AUTH

        try {
            if($login){
                $this->findRenderComponent($path, $postRead, $postWrite);

                if (isset($this->request->server['HTTP_ORIGIN'])) {
                    $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
                    $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
                    $this->response->addHeader('Access-Control-Max-Age: 1000');
                    $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
                }

                $this->response->addHeader('Content-Type: application/json');
            } else {
                $this->response->redirect($this->url->link('error/not_found', '', true));
            }
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    /*
     * Function find component BY methods
     * */
    private function findRenderComponent($path, $postRead, $postWrite) {
        if($this->isCar($path)) {
            $this->_getCar($path[3]);
        } elseif($this->isCarList($path)) {
            $this->_getCars($postRead);
        } elseif($this->isCarCreate($path)) {
            $this->_setCar($postWrite);
        } elseif($this->isCarDelete($path)) {
            $this->_removeCar($path[3]);
        } elseif($this->isCarsTotal($path)) {
            $this->_getTotalCarsId();
        } elseif($this->isCarEdit($path)) {
            $this->_setEditCar($path[3], $postWrite);
        } elseif($this->isCarSave($path)) {
            $this->_setSaveCar($path[3], $postWrite);
        } elseif($this->isMarkaGet($path)) {
            $this->_getMarka();
        } elseif($this->isModelGet($path)) {
            $this->_getModel($postRead);
        } else {
            $this->response->redirect($this->url->link('error/not_found', '', true));
        }
    }

    /*
     * Function to Auth
     * Add token and session['api_id']
     * */
    private function _getAuth($post, $serve) {
        if (!isset($_SESSION['api_id'])) {
            $this->load->model('account/api');

            $api_info = $this->model_account_api->getApiByKey($post['key']);

            if ($api_info) {
                $ip_data = array();

                $results = $this->model_account_api->getApiIps($api_info['api_id']);

                foreach ($results as $result) {
                    $ip_data[] = trim($result['ip']);
                }

                if (in_array($serve['REMOTE_ADDR'], $ip_data)) {
                    session_start();
                    $_SESSION['api_id'] = $api_info['api_id'];

                    return true;
                }
                //throw new Exception('Неверный IP клиента');
                return false;
            }
            //throw new Exception('Неверный ключ API');
            return false;
        } else {
            return true;
        }
    }

    /*
     * Function to create information about the car
     * */
    private function _setCar($post) {

        $json = [];
        $json['carId'] = false;

        if($this->request->server['REQUEST_METHOD'] == 'POST') {

            $this->load->model('catalog/auto');

            if($post["images"]){
                $date_now = date("d.m.Y");
                $time = strtotime($date_now);

                $car_images = [];

                foreach (explode(",", $post["images"]) as $image) {
                    $car_images[] = "catalog/d4_img/" . $time . "/" . $image;
                }

                $car_images = implode(",", $car_images);
            }

            $car_id = $this->model_catalog_auto->setCar($post, $car_images);

            $json['carId'] = $car_id;
        }

        $this->response->setOutput(json_encode($json));
    }

    /*
     * Function to edit information about the car by ID and Post
     * */
    private function _setEditCar($id, $post) {

        $json = [];
        $json['carEdit'] = false;

        if($this->request->server['REQUEST_METHOD'] == 'POST') {
            $this->load->model('catalog/auto');

            if($post["images"]){
                $date_now = date("d.m.Y");
                $time = strtotime($date_now);

                $car_images = [];

                foreach (explode(",", $post["images"]) as $image) {
                    $car_images[] = "catalog/d4_img/" . $time . "/" . $image;
                }

                $car_images = implode(",", $car_images);
            }

            $this->model_catalog_auto->editCar($id, $post, $car_images);

            $json['carEdit'] = true;
        }

        $this->response->setOutput(json_encode($json));
    }

    /*
     * Function to save information about the car by ID and Post on list page
     * */
    private function _setSaveCar($id, $post) {

        $json = [];
        $json['carEdit'] = false;

        if($this->request->server['REQUEST_METHOD'] == 'POST') {
            $this->load->model('catalog/auto');

            $this->model_catalog_auto->saveCar($id, $post);

            $json['carEdit'] = true;
        }

        $this->response->setOutput(json_encode($json));
    }

    /*
     * Function to delete information about the car by ID
     * */
    private function _removeCar($id) {
        $json = [];
        $json['response'] = false;

        if($this->request->server['REQUEST_METHOD'] == 'POST' && isset($id)) {
            $this->load->model('catalog/auto');

            $car_id = $this->model_catalog_auto->removeCar($id);

            $json['response'] = true;
        }

        $this->response->setOutput(json_encode($json));
    }


    /*
     * Function to get marka list
     * */
    private function _getMarka() {
        $json = [];

        $this->load->model('catalog/auto');

        $marka = $this->model_catalog_auto->getMarka();

        $json['marka'] = $marka;

        $this->response->setOutput(json_encode($json));
    }

    /*
     * Function to get model list
     * */
    private function _getModel($post) {
        $json = [];

        $this->load->model('catalog/auto');

        $model = $this->model_catalog_auto->getModel($post);

        $json['model'] = $model;

        $this->response->setOutput(json_encode($json));
    }

    /*
     * Function to get information about the car by ID
     * */
    private function _getCar($id) {
        $json = [];

        $this->load->model('catalog/auto');

        $car = $this->model_catalog_auto->getCar($id);

        if($car[0]["images"]) {
            $car[0]["images"] = explode(",", $car[0]["images"]); // IMG in array

            $j = 0;
            foreach ($car[0]["images"] as $img) {
                $image = explode("/", $img);
                $car[0]["imagesServer"][$j] = end($image); // IMG Server in array
                $j++;
            }
        }

        $json['car'] = $car[0];

        $this->response->setOutput(json_encode($json));
    }

    /*
     * Function to get totals car
     * */
    private function _getTotalCarsId() {
        $json = [];

        $this->load->model('catalog/auto');

        $total = $this->model_catalog_auto->getTotalCarsId();

        $json['total'] = (int)$total;

        $this->response->setOutput(json_encode($json));
    }

    /*
     * Function to get information about cars with pagination
     * */
    private function _getCars($param) {
        $json = [];

        $this->load->model('catalog/auto');

        if(isset($param['page'])) {
            $page = (int)$param['page'];
        } else {
            $page = 1;
        }

        if (isset($param['limit'])) {
            $limit = (int)$param['limit'];
        } else {
            $limit = 10;
        }

        $filter_data = array(
            'start' => ($page - 1) * $limit,
            'limit' => $limit
        );

        $cars = $this->model_catalog_auto->getCars($filter_data);

        foreach ($cars as &$car) {
            if($car['images']) {
                $car['images'] = explode(",", $car['images']);
            }
        }

        $json['cars'] = $cars;

        $this->response->setOutput(json_encode($json));
    }

    /*
     * @route: api/auto/cars/:id
     * Url settings for car index
     * */
    private function isCar($path) {
        return is_numeric(trim($path[3])) && isset($path[3]) && !isset($path[4]);
    }

    /*
     * @route: api/auto/cars/total/
     * Url settings for cars total
     * */
    private function isCarsTotal($path) {
        return !isset($path[4]) && $path[3] == 'total';
    }

    /*
     * @route: api/auto/cars/:id/edit
     * Url
     * */
    private function isCarEdit($path) {
        return !isset($path[5]) && is_numeric(trim($path[3])) && $path[4] == 'edit';
    }

    /*
     * @route: api/auto/cars/:id/save
     * Url save info about car on list page
     * */
    private function isCarSave($path) {
        return !isset($path[5]) && is_numeric(trim($path[3])) && $path[4] == 'save';
    }

    /*
     * @route: api/auto/cars
     * Url settings for car list
     * */
    private function isCarList($path) {
        return !isset($path[3]) && count($path) == 3;
    }

    /*
     * @route: api/auto/cars/create
     * Url settings for car create
     * */
    private function isCarCreate($path) {
        return !isset($path[4]) && $path[3] == 'create';
    }

    /*
     * @route: api/auto/cars/marka
     * Url settings get marka car
     * */
    private function isMarkaGet($path) {
        return !isset($path[4]) && $path[3] == 'marka';
    }

    /*
     * @route: api/auto/cars/model
     * Url settings get model car
     * */
    private function isModelGet($path) {
        return !isset($path[4]) && $path[3] == 'model';
    }

    /*
     * @route: api/auto/cars/:id/delete
     * Url settings for car delete
     * */
    private function isCarDelete($path) {
        return is_numeric(trim($path[3])) && isset($path[4]) && !isset($path[5]) && $path[4] == 'delete';
    }
}
?>