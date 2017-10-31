<?php
class ModelCatalogLabel extends Model {

	public function getLabel($label_id) {
        $query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "product_label WHERE product_label_id = '" . (int)$label_id . "'");

        return $query->row;
	}
}
