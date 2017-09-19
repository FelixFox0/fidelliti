<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');
                if(($this->session->data['country_code']=='ua')||($this->session->data['country_code']=='ru')){
                    $country = $this->session->data['country_code'];
                }else{
                    $country = 'en';
                }
                $data['country_code'] = $country;

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
                
                $data['text_customers'] = $this->language->get('text_customers');
                $data['text_policy'] = $this->language->get('text_policy');
                $data['text_company'] = $this->language->get('text_company');
                $data['text_call_me'] = $this->language->get('text_call_me');
                $data['text_faq'] = $this->language->get('text_faq');
                $data['text_payment'] = $this->language->get('text_payment');
                $data['text_delivery'] = $this->language->get('text_delivery');
                $data['text_return'] = $this->language->get('text_return');
                $data['text_news'] = $this->language->get('text_news');
                $data['text_production'] = $this->language->get('text_production');
                $data['text_works'] = $this->language->get('text_works');
                $data['text_phone'] = $this->language->get('text_'.$country.'_phone');

                $data['text_numb'] = $this->language->get('text_'.$country);


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
                
                $data['faq'] = $this->url->link('information/information','information_id=4', false, $this->session->data['country_code'], $this->session->data['language_name']);
                $data['all_news'] = $this->url->link('blog/home','', false, $this->session->data['country_code'], $this->session->data['language_name']);
                $data['our_production'] = $this->url->link('information/informationf','information_id=8', false, $this->session->data['country_code'], $this->session->data['language_name']);
                $data['works'] = $this->url->link('information/information','information_id=7', false, $this->session->data['country_code'], $this->session->data['language_name']);
                
                if($this->session->data['country_code']=='ua'){
                    $country = $this->session->data['country_code'];
                    $data['paymant'] = $this->url->link('information/information','information_id=14', false, $this->session->data['country_code'], $this->session->data['language_name']);
                    $data['delivery'] = $this->url->link('information/information','information_id=11', false, $this->session->data['country_code'], $this->session->data['language_name']);
                    $data['return'] = $this->url->link('information/information','information_id=10', false, $this->session->data['country_code'], $this->session->data['language_name']);

                }elseif($this->session->data['country_code']=='ru'){
                    $data['paymant'] = $this->url->link('information/information','information_id=15', false, $this->session->data['country_code'], $this->session->data['language_name']);
                    $data['delivery'] = $this->url->link('information/information','information_id=12', false, $this->session->data['country_code'], $this->session->data['language_name']);
                    $data['return'] = $this->url->link('information/information','information_id=17', false, $this->session->data['country_code'], $this->session->data['language_name']);
                }else{
                    $data['paymant'] = $this->url->link('information/information','information_id=16', false, $this->session->data['country_code'], $this->session->data['language_name']);
                    $data['delivery'] = $this->url->link('information/information','information_id=13', false, $this->session->data['country_code'], $this->session->data['language_name']);
                    $data['return'] = $this->url->link('information/information','information_id=18', false, $this->session->data['country_code'], $this->session->data['language_name']);
                }
                
                
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
