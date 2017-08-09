<?php
class ControllerModuleAccount extends Controller {
	public function index() {
		$this->load->language('module/account');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');

		$data['logged'] = $this->customer->isLogged();
		$data['register'] = $this->url->link('account/register', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['login'] = $this->url->link('account/login', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['logout'] = $this->url->link('account/logout', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['forgotten'] = $this->url->link('account/forgotten', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['account'] = $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['edit'] = $this->url->link('account/edit', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['password'] = $this->url->link('account/password', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['address'] = $this->url->link('account/address', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['wishlist'] = $this->url->link('account/wishlist', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['order'] = $this->url->link('account/order', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['download'] = $this->url->link('account/download', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['reward'] = $this->url->link('account/reward', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['return'] = $this->url->link('account/return', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['transaction'] = $this->url->link('account/transaction', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['recurring'] = $this->url->link('account/recurring', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

		return $this->load->view('module/account', $data);
	}
}