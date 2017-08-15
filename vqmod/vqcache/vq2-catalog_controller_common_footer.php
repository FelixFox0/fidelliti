<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

			$data['live_search'] = $this->load->controller('module/d_ajax_search');
			$data['cosyone_cookie'] = $this->load->controller('common/cosyone_cookie');	
			$data['footer_modules'] = $this->load->controller('common/footer_modules');
			$cosyone_footer_block_title = $this->config->get('cosyone_footer_custom_block_title');
			if(empty($cosyone_footer_block_title[$this->config->get('config_language_id')])) {
				$data['cosyone_footer_custom_block_title'] = false;
			} else if (isset($cosyone_footer_block_title[$this->config->get('config_language_id')])) {
				$data['cosyone_footer_custom_block_title'] = html_entity_decode($cosyone_footer_block_title[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			$data['cosyone_footer_payment_icon'] = $this->config->get('cosyone_footer_payment_icon');
			$data['cosyone_use_retina'] = $this->config->get('cosyone_use_retina');
			$cosyone_footer_block = $this->config->get('cosyone_footer_custom_block');
			if(empty($cosyone_footer_block[$this->config->get('config_language_id')])) {
				$data['cosyone_footer_custom_block'] = false;
			} else if (isset($cosyone_footer_block[$this->config->get('config_language_id')])) {
				$data['cosyone_footer_custom_block'] = html_entity_decode($cosyone_footer_block[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'], false, $this->session->data['country_code'], $this->session->data['language_name'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact','', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['return'] = $this->url->link('account/return/add', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['sitemap'] = $this->url->link('information/sitemap', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['manufacturer'] = $this->url->link('product/manufacturer','', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['voucher'] = $this->url->link('account/voucher', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true,$this->session->data['country_code'], $this->session->data['language_name']);
		$data['special'] = $this->url->link('product/special', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['account'] = $this->url->link('account/account', '', true,$this->session->data['country_code'], $this->session->data['language_name']);
		$data['order'] = $this->url->link('account/order', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

//		$data['powered'] = sprintf(date('Y', time()), $this->config->get('config_name'), $this->language->get('text_powered'));

                $data['powered'] = '© ' . date('Y', time()) . ' ' . $this->config->get('config_name') . $this->language->get('text_powered');
		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
