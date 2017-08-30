<?php
class ModelModuleDragndropposition extends Model{
    public function productPosition($data) {
//        var_dump($data);
//        die();
        foreach ($data as $key => $order) {
            
        
        $this->db->query("UPDATE " . DB_PREFIX . "product SET sort_order = '" . (int)$order . "', date_modified = NOW() WHERE product_id = '" . (int)$key . "'");
        }
        
    }
}