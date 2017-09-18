<?php
class ControllerShippingFlat3 extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('shipping/flat3');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('flat3', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/shipping', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_none'] = $this->language->get('text_none');

		$data['entry_cost'] = $this->language->get('entry_cost');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_shipping'),
			'href' => $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('shipping/flat3', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('shipping/flat3', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->post['flat3_cost'])) {
			$data['flat3_cost'] = $this->request->post['flat3_cost'];
		} else {
			$data['flat3_cost'] = $this->config->get('flat3_cost');
		}

		if (isset($this->request->post['flat3_tax_class_id'])) {
			$data['flat3_tax_class_id'] = $this->request->post['flat3_tax_class_id'];
		} else {
			$data['flat3_tax_class_id'] = $this->config->get('flat3_tax_class_id');
		}

		$this->load->model('localisation/tax_class');

		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		if (isset($this->request->post['flat3_geo_zone_id'])) {
			$data['flat3_geo_zone_id'] = $this->request->post['flat3_geo_zone_id'];
		} else {
			$data['flat3_geo_zone_id'] = $this->config->get('flat3_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['flat3_status'])) {
			$data['flat3_status'] = $this->request->post['flat3_status'];
		} else {
			$data['flat3_status'] = $this->config->get('flat3_status');
		}

		if (isset($this->request->post['flat3_sort_order'])) {
			$data['flat3_sort_order'] = $this->request->post['flat3_sort_order'];
		} else {
			$data['flat3_sort_order'] = $this->config->get('flat3_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('shipping/flat3', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'shipping/flat3')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}