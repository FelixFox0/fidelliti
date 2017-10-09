<?php
class ControllerAccountNewsletter extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/newsletter', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

			$this->response->redirect($this->url->link('account/login', '', true, $this->session->data['country_code'], $this->session->data['language_name']));
		}

		$this->load->language('account/newsletter');
		$this->load->language('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->load->model('account/customer');

			$this->model_account_customer->editNewsletter($this->request->post['newsletter']);

			$this->session->data['success'] = $this->language->get('text_success');

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
			'text' => $this->language->get('text_newsletter'),
			'href' => $this->url->link('account/newsletter', '', true, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['heading_hello'] = $this->language->get('heading_hello');
		$data['heading_text'] = $this->language->get('heading_text');
		$data['heading_logout'] = $this->language->get('heading_logout');
		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_account_sp'] = $this->language->get('text_my_account_sp');
		$data['heading_info'] = $this->language->get('heading_info');
		$data['button_news'] = $this->language->get('button_news');
		
		$data['menu_account'] = $this->language->get('menu_account');
		$data['menu_wishlist'] = $this->language->get('menu_wishlist');
		$data['menu_order'] = $this->language->get('menu_order');
		$data['menu_edit'] = $this->language->get('menu_edit');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
                
                                
                $data['text_about_account'] = $this->language->get('text_about_account');
                $data['text_address'] = $this->language->get('text_address');
                $data['text_newsletter'] = $this->language->get('text_newsletter');

		$data['entry_newsletter'] = $this->language->get('entry_newsletter');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_back'] = $this->language->get('button_back');

		$data['action'] = $this->url->link('account/newsletter', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

		$data['newsletter'] = $this->customer->getNewsletter();

		$data['back'] = $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
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
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/newsletter', $data));
	}
}