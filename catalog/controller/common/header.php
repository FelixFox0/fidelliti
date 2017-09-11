<?php
class ControllerCommonHeader extends Controller {
	public function index() {
//            var_dump($_SERVER['HTTP_ACCEPT_LANGUAGE']);
//            die();
//            var_dump($this->session->data['language_name']);
//            var_dump($this->url->link('product/category', '', false, $this->session->data['country_code'], $this->session->data['language_name']));
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']), $this->customer->getFirstName(), $this->url->link('account/logout', '', true, $this->session->data['country_code'], $this->session->data['language_name']));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
                
                
                $data['text_blog'] = $this->language->get('text_blog');
                $data['text_customer']= $this->language->get('text_customer');
                $data['text_phone'] = $this->language->get('text_phone');
                $data['text_work_week'] = $this->language->get('text_work_week');
                $data['text_work_time'] = $this->language->get('text_work_time');
                $data['text_call_me'] = $this->language->get('text_call_me');
                $data['text_sand_mail'] = $this->language->get('text_sand_mail');
                $data['text_chat']  = $this->language->get('text_chat');
                $data['text_our_managers'] = $this->language->get('text_our_managers');
                $data['text_asc_question'] = $this->language->get('text_asc_question');
                $data['text_read_faq'] = $this->language->get('text_read_faq');
                $data['text_read_faq_but'] = $this->language->get('text_read_faq_but');
                
                $data['text_about'] = $this->language->get('text_about');
                $data['text_sotr'] = $this->language->get('text_sotr');
                $data['text_our_prod'] = $this->language->get('text_our_prod');
                $data['text_contact'] = $this->language->get('text_contact');
                
                $data['text_logo_top'] = $this->language->get('text_logo_top');
                $data['shippig'] = $this->language->get('shippig');
                $data['text_select_country'] = $this->language->get('text_select_country');

		$data['home'] = $this->url->link('common/home', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['register'] = $this->url->link('account/register', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['login'] = $this->url->link('account/login', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['order'] = $this->url->link('account/order', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['transaction'] = $this->url->link('account/transaction', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['download'] = $this->url->link('account/download', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['logout'] = $this->url->link('account/logout', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['shopping_cart'] = $this->url->link('checkout/cart', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['checkout'] = $this->url->link('checkout/checkout', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['contact'] = $this->url->link('information/contact', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['telephone'] = $this->config->get('config_telephone', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
                
                $data['my_company'] = $this->url->link('information/informationf','information_id=7', false, $this->session->data['country_code'], $this->session->data['language_name']);
                $data['our_production'] = $this->url->link('information/informationf','information_id=8', false, $this->session->data['country_code'], $this->session->data['language_name']);
                
                $data['text_free_call'] = $this->language->get('text_read_faq_but');
                
                $data['text_phone'] = $this->language->get('text_phone_'. $this->session->data['country_code']);
                
                $data['text2'] = $this->language->get('text2_'. $this->session->data['country_code']);
                
                $data['text_search2'] = $this->language->get('text_search2');
                $data['text_see_all'] = $this->language->get('text_see_all');

                $data['blog'] = $this->url->link('blog/home', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
                
		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'], false,$this->session->data['country_code'], $this->session->data['language_name'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'], false,$this->session->data['country_code'], $this->session->data['language_name'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');
                
                if(isset($this->session->data['country_test'])){
                    $data['countries'] = $this->load->controller('common/countries');
                } else{
                    $data['countries'] = false;
                }
                
                
                $this->load->model('localisation/language');

		$data['llanguages'] = array();

		$results = $this->model_localisation_language->getLanguages();
//                var_dump($results);
//                die();
		foreach ($results as $result) {
			if ($result['status']) {
				$data['llanguages'][] = array(
					'name' => $result['name'],
					'code' => $result['code'],
				);
			}
		}
                $data['code'] = $this->session->data['language'];
                
                
                $this->load->model('common/countries');
                $data['countries_array'] = $this->model_common_countries->getCountries();
                $data['country_s'] = $this->session->data['country_code'];
                $data['href'] = substr($_SERVER['REQUEST_URI'],1);
                $this->load->model('startup/url');
                if($this->model_startup_url->checkCountryIso(substr($data['href'], 0, stripos($data['href'],'/')))){
                    $data['href'] = substr($data['href'], stripos($data['href'],'/'));
                }elseif($this->model_startup_url->checkCountryIso(substr($data['href'], 0))){
                    $data['href'] = '/';
                }else{
                    $data['href'] = '/'.$data['href'];
                }
                if($this->model_startup_url->getLanguageByName(substr($data['href'], 1,3 ))){
                    $data['href'] = '/' . substr($data['href'], 5);
                }
                
//                var_dump($data['countries_array']);
//                var_dump($data['href']);
                
		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}
                
                $this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['top']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'], false, $this->session->data['country_code'], $this->session->data['language_name'])
				);
			}
		}
//                var_dump($data['informations']);
                
//                var_dump($data);
		return $this->load->view('common/header', $data);
	}
}
