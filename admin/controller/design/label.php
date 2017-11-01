<?php
class ControllerDesignLabel extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('design/label');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('design/label');

        $this->getList();
    }

    public function add() {
        $this->load->language('design/label');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('design/label');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_design_label->addlabel($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('design/label', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('design/label');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('design/label');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_design_label->editlabel($this->request->get['product_label_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('design/label', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('design/label');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('design/label');
//var_dump($this->request->post['selected']);
//                die();
        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $product_label_id) {
                
                $this->model_design_label->deletelabel($product_label_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('design/label', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getList();
    }

    public function getList() {
        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'name';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('design/label', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

        $data['add'] = $this->url->link('design/label/add', 'token=' . $this->session->data['token'] . $url, '');
        $data['delete'] = $this->url->link('design/label/delete', 'token=' . $this->session->data['token'] . $url, '');
        $data['edit_params'] = $this->url->link('design/label/edit_params', 'token=' . $this->session->data['token']. $url, '');
        $data['token'] = $this->session->data['token'];

        $data['labels'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $label_total = $this->model_design_label->getTotallabels();

        $results = $this->model_design_label->getLabels($filter_data);
        
        $this->load->model('tool/image');
        
        foreach ($results as $result) {
            if($result){
                if($result['label_width'] && $result['label_height']){
                    $result['label_image'] = $this->model_tool_image->resize($result['label_image'],$result['label_width'], $result['label_height']);
                }elseif($result['label_width']){
                    $result['label_image'] = $this->model_tool_image->resize_width($result['label_image'], $result['label_width']);
                }elseif($result['label_height']){
                    $result['label_image'] = $this->model_tool_image->resize_height($result['label_image'], $result['label_height']);
                }else{
                    $result['label_image'] = $this->model_tool_image->resize_width($result['label_image'], 45);
                }
            }
            $data['labels'][] = array(
                'product_label_id' => $result['product_label_id'],
                'label_name'            => $result['label_name'],
                'label_image'   		  => $result['label_image'],
				'label_height'          => $result['label_height'],
				'label_width'          => $result['label_width'],
                'sort_order'      => $result['sort_order'],
                'edit'            => $this->url->link('design/label/edit', 'token=' . $this->session->data['token'] . '&product_label_id=' . $result['product_label_id'] . $url, 'SSL')
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('design/label', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
        $data['sort_sort_order'] = $this->url->link('design/label', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $label_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('design/label', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($label_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($label_total - $this->config->get('config_limit_admin'))) ? $label_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $label_total, ceil($label_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('design/label_list.tpl', $data));
    }

    public function getForm() {
        $this->load->model('design/label');
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['product_label_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_default'] = $this->language->get('text_default');
        $data['text_amount'] = $this->language->get('text_amount');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_label_height'] = $this->language->get('entry_label_height');
        $data['entry_label_width'] = $this->language->get('entry_label_width');
        $data['entry_image'] = $this->language->get('entry_image');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['label_name'])) {
            $data['error_name'] = $this->error['label_name'];
        } else {
            $data['error_name'] = '';
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
		
		$url = '';
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('design/label', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

        if (!isset($this->request->get['product_label_id'])) {
            $data['action'] = $this->url->link('design/label/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $data['action'] = $this->url->link('design/label/edit', 'token=' . $this->session->data['token'] . '&product_label_id=' . $this->request->get['product_label_id'] . $url, 'SSL');
        }

        $data['cancel'] = $this->url->link('design/label', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['product_label_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $label_info = $this->model_design_label->getlabel($this->request->get['product_label_id']);
        }

        $data['token'] = $this->session->data['token'];

        if (isset($this->request->post['label_name'])) {
            $data['label_name'] = $this->request->post['label_name'];
        } elseif (!empty($label_info)) {
            $data['label_name'] = $label_info['label_name'];
        } else {
            $data['label_name'] = '';
        }

        if (isset($this->request->post['label_height'])) {
            $data['label_height'] = $this->request->post['label_height'];
        } elseif (!empty($label_info)) {
            $data['label_height'] = $label_info['label_height'];
        } else {
            $data['label_height'] = '0';
        }

        if (isset($this->request->post['label_width'])) {
            $data['label_width'] = $this->request->post['label_width'];
        } elseif (!empty($label_info)) {
            $data['label_width'] = $label_info['label_width'];
        } else {
            $data['label_width'] = '0';
        }

        if (isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif (!empty($label_info)) {
            $data['image'] = $label_info['label_image'];
        } else {
            $data['image'] = '';
        }

        $this->load->model('tool/image');

        if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
        } elseif (!empty($label_info) && is_file(DIR_IMAGE . $label_info['label_image'])) {
            $data['thumb'] = $this->model_tool_image->resize($label_info['label_image'], 100, 100);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        if (isset($this->request->post['sort_order'])) {
            $data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($label_info)) {
            $data['sort_order'] = $label_info['sort_order'];
        } else {
            $data['sort_order'] = '';
        }
		
		if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($label_info)) {
            $data['status'] = $label_info['status'];
        } else {
            $data['status'] = 1;
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('design/label_form.tpl', $data));
    }

    public function validateForm() {
        if (!$this->user->hasPermission('modify', 'design/label')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 2) || (utf8_strlen($this->request->post['name']) > 64)) {
            $this->error['label_name'] = $this->language->get('error_name');
        }

//        if ((utf8_strlen($this->request->post['label_height']) == '')) {
//            $this->error['label_height'] = $this->language->get('error_label_height');
//        }

        if ((float)$this->request->post['label_height'] < 0) {
            $this->error['label_height'] = $this->language->get('error_label_height_zero');
        }

//        if ((utf8_strlen($this->request->post['label_width']) == '')) {
//            $this->error['label_width'] = $this->language->get('error_label_width');
//        }

        if ((float)$this->request->post['label_width'] < 0) {
            $this->error['label_width'] = $this->language->get('error_label_width_zero');
        }

        return !$this->error;
    }

    public function validateDelete() {
        if (!$this->user->hasPermission('modify', 'design/label')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        $this->load->model('design/label');

        foreach ($this->request->post['selected'] as $product_label_id) {
            $product_total = $this->model_design_label->getTotallabels($product_label_id);

            if ($product_total) {
                //$this->error['warning'] = sprintf($this->language->get('error_product'), $product_total);
            }
        }

        return !$this->error;
    }

    public function autocomplete() {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->model('design/label');

            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'start'       => 0,
                'limit'       => 50
            );

            $results = $this->model_design_label->getLabels($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'product_label_id' => $result['product_label_id'],
                    'label_name'       => strip_tags(html_entity_decode($result['label_name'], ENT_QUOTES, 'UTF-8'))
                );
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['label_name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
