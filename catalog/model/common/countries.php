<?php
class ModelCommonCountries extends Model {
        public function getCountries(){
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country");
		return $query->rows;
        }
}