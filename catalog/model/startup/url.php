<?php
class ModelStartupUrl extends Model {
	public function checkCountryIso($iso_code) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE iso_code_2 = '" . $iso_code . "'");
//                var_dump($query->row);
//                die();
		return $query->row;
	}
}