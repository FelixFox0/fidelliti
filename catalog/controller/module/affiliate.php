<?php
class ControllerModuleAffiliate extends Controller {
	public function index() {
		$this->load->language('module/affiliate');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_payment'] = $this->language->get('text_payment');
		$data['text_tracking'] = $this->language->get('text_tracking');
		$data['text_transaction'] = $this->language->get('text_transaction');

		$data['logged'] = $this->affiliate->isLogged();
		$data['register'] = $this->url->link('affiliate/register', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['login'] = $this->url->link('affiliate/login', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['logout'] = $this->url->link('affiliate/logout', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['forgotten'] = $this->url->link('affiliate/forgotten', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['account'] = $this->url->link('affiliate/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['edit'] = $this->url->link('affiliate/edit', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['password'] = $this->url->link('affiliate/password', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['payment'] = $this->url->link('affiliate/payment', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['tracking'] = $this->url->link('affiliate/tracking', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['transaction'] = $this->url->link('affiliate/transaction', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

		return $this->load->view('module/affiliate', $data);
	}
}