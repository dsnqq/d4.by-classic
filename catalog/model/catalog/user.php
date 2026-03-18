<?php
class ModelCatalogUser extends Model
{
    public function checkUserInBD($data = array())
    {
        $sql = "SELECT firstname,lastname,user_id,username FROM " . DB_PREFIX . "user WHERE username = '" . $this->db->escape($data['login']) . "'";

        $query = $this->db->query($sql);

        return $query->rows[0];
    }
}