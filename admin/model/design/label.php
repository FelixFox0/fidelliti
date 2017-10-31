<?php
class ModelDesignLabel extends Model {
    public function addlabel($data) {
        //$this->event->trigger('pre.admin.label.add', $data);

        $this->db->query("INSERT INTO " . DB_PREFIX . "product_label SET label_name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "', label_height = '" . (int)$data['label_height'] . "', label_width = '" . (int)$data['label_width'] . "', status = '" . (int)$data['status'] . "'");

        $label_id = $this->db->getLastId();

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "product_label SET label_image = '" . $this->db->escape($data['image']) . "' WHERE product_label_id = '" . (int)$label_id . "'");
        }

        /*if (isset($data['label_store'])) {
            foreach ($data['label_store'] as $store_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "label_to_store SET label_id = '" . (int)$label_id . "', store_id = '" . (int)$store_id . "'");
            }
        }*/

        /*if (isset($data['keyword'])) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'label_id=" . (int)$label_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }*/

        $this->cache->delete('label');

        //$this->event->trigger('post.admin.label.add', $label_id);

        return $label_id;
    }

    public function editlabel($label_id, $data) {
        //$this->event->trigger('pre.admin.label.edit', $data);

        $this->db->query("UPDATE " . DB_PREFIX . "product_label SET label_name = '" . $this->db->escape($data['name']) . "', label_height = '" . (int)$data['label_height'] . "', label_width = '" . (int)$data['label_width'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE product_label_id = '" . (int)$label_id . "'");

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "product_label SET label_image = '" . $this->db->escape($data['image']) . "' WHERE product_label_id = '" . (int)$label_id . "'");
        }

        //$this->db->query("DELETE FROM " . DB_PREFIX . "label_to_store WHERE label_id = '" . (int)$label_id . "'");

        /*if (isset($data['label_store'])) {
            foreach ($data['label_store'] as $store_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "label_to_store SET label_id = '" . (int)$label_id . "', store_id = '" . (int)$store_id . "'");
            }
        }*/

        //$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'label_id=" . (int)$label_id . "'");

        /*if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'label_id=" . (int)$label_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }*/

        $this->cache->delete('label');

        //$this->event->trigger('post.admin.label.edit', $label_id);
    }

    public function deletelabel($label_id) {
        //$this->event->trigger('pre.admin.label.delete', $label_id);

        $this->db->query("DELETE FROM " . DB_PREFIX . "product_label WHERE product_label_id = '" . (int)$label_id . "'");
        //$this->db->query("DELETE FROM " . DB_PREFIX . "product_label_to_store WHERE label_id = '" . (int)$label_id . "'");
        //$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'label_id=" . (int)$label_id . "'");

        $this->cache->delete('label');

        //$this->event->trigger('post.admin.label.delete', $label_id);
    }

    public function getlabel($label_id) {
        $query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "product_label WHERE product_label_id = '" . (int)$label_id . "'");

        return $query->row;
    }

    public function getLabels($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "product_label";

        if (!empty($data['filter_name'])) {
            $sql .= " WHERE label_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sort_data = array(
            'label_name',
            'sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY label_name";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    /*public function getlabelStores($label_id) {
        $label_store_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "label_to_store WHERE label_id = '" . (int)$label_id . "'");

        foreach ($query->rows as $result) {
            $label_store_data[] = $result['store_id'];
        }

        return $label_store_data;
    }*/

    public function getTotallabels() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_label");

        return $query->row['total'];
    }

    public function getLabelByName($name)
    {
        $sql = "SELECT * FROM " . DB_PREFIX . "product_label";
        $sql .= " WHERE name LIKE '" . $this->db->escape($name) . "%'";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function createLabelByName($name)
    {
        $sort_order = 0;
        $this->db->query("INSERT INTO " . DB_PREFIX . "product_label SET name = '" . $this->db->escape($name) . "', sort_order = '" . (int)$sort_order . "'");

        $label_id = $this->db->getLastId();
        $store_id = 0;

        //$this->db->query("INSERT INTO " . DB_PREFIX . "label_to_store SET label_id = '" . (int)$label_id . "', store_id = '" . (int)$store_id . "'");

        return array('0'=> array(
            'label_id' => (string) $label_id,
            'name' => $name,
            'sort_order' => (string) $sort_order
        ));
    }
}
