<?php
class ControllerAccountPassword extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/password', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

			$this->response->redirect($this->url->link('account/login', '', true, $this->session->data['country_code'], $this->session->data['language_name']));
		}

		$this->load->language('account/password');
		$this->load->language('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->load->model('account/customer');

			$this->model_account_customer->editPassword($this->customer->getEmail(), $this->request->post['password']);

			$this->session->data['success'] = $this->language->get('text_success');

			// Add to activity log
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $this->customer->getId(),
				'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
			);

			$this->model_account_activity->addActivity('password', $activity_data);

			$this->response->redirect($this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', '', false, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/password', '', true, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_title_pass'] = $this->language->get('heading_title_pass');
		
		$data['menu_account'] = $this->language->get('menu_account');
		$data['menu_wishlist'] = $this->language->get('menu_wishlist');
		$data['menu_order'] = $this->language->get('menu_order');
		$data['menu_edit'] = $this->language->get('menu_edit');
		
		$data['heading_hello'] = $this->language->get('heading_hello');
		$data['heading_text'] = $this->language->get('heading_text');
		$data['heading_logout'] = $this->language->get('heading_logout');
		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_account_sp'] = $this->language->get('text_my_account_sp');
		$data['pass_discription'] = $this->language->get('pass_discription');
		$data['row_require'] = $this->language->get('row_require');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_nosave'] = $this->language->get('button_nosave');

		$data['text_password'] = $this->language->get('text_password');

		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm'] = $this->language->get('entry_confirm');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_back'] = $this->language->get('button_back');

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
		}

		$data['action'] = $this->url->link('account/password', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['edit'] = $this->url->link('account/edit', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['password'] = $this->url->link('account/password', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['address'] = $this->url->link('account/address', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['wishlist'] = $this->url->link('account/wishlist', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['order'] = $this->url->link('account/order', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['download'] = $this->url->link('account/download', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['return'] = $this->url->link('account/return', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['transaction'] = $this->url->link('account/transaction', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['recurring'] = $this->url->link('account/recurring', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['add'] = $this->url->link('account/address/add', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
                $data['address'] = $this->url->link('account/address', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['logout'] = $this->url->link('account/logout', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['account'] = $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

                $data['text_about_account'] = $this->language->get('text_about_account');
                $data['text_address'] = $this->language->get('text_address');
                $data['text_newsletter'] = $this->language->get('text_newsletter');

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}

		$data['back'] = $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/password', $data));
	}

	protected function validate() {
		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}

		return !$this->error;
	}
}