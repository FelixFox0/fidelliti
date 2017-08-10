<?php
class ModelCommonCountries extends Model {
        public function getCountries(){
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE status = 1");
		return $query->rows;
        }
}