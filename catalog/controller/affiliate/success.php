<?php
class ControllerAffiliateSuccess extends Controller {
	public function index() {
		$this->load->language('affiliate/success');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', '', false, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('affiliate/account', '', true, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('affiliate/success','',false, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if (!$this->config->get('config_affiliate_approval')) {
			$data['text_message'] = sprintf($this->language->get('text_message'), $this->config->get('config_name'), $this->url->link('information/contact', '', false, $this->session->data['country_code'], $this->session->data['language_name']));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_approval'), $this->config->get('config_name'), $this->url->link('information/contact', '', false, $this->session->data['country_code'], $this->session->data['language_name']));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('affiliate/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}
}