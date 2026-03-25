<?php
namespace Session;
class Native extends \SessionHandler {
    #[\ReturnTypeWillChange]
    public function create_sid() {
        try {
            return parent::create_sid();
        } catch (\Throwable $e) {
            if (function_exists('random_bytes')) {
                return substr(bin2hex(random_bytes(26)), 0, 26);
            }
            if (function_exists('openssl_random_pseudo_bytes')) {
                $bytes = openssl_random_pseudo_bytes(26);
                if ($bytes !== false) {
                    return substr(bin2hex($bytes), 0, 26);
                }
            }
            return substr(bin2hex(uniqid('', true)), 0, 26);
        }
    }

    #[\ReturnTypeWillChange]
    public function open($path, $name) {
        return parent::open($path, $name);
    }

    #[\ReturnTypeWillChange]
    public function close() {
        return parent::close();
    }

    #[\ReturnTypeWillChange]
    public function read($session_id) {
        return parent::read($session_id);
    }

    #[\ReturnTypeWillChange]
    public function write($session_id, $data) {
        return parent::write($session_id, $data);
    }

    #[\ReturnTypeWillChange]
    public function destroy($session_id) {
        return parent::destroy($session_id);
    }

    #[\ReturnTypeWillChange]
    public function gc($maxlifetime) {
        return parent::gc($maxlifetime);
    }
}
