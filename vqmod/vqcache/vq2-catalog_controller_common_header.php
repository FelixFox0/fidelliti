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

			if ($this->config->get('cosyone_use_custom_font')) {
			$this->document->addStyle('//fonts.googleapis.com/css?family=' . $this->config->get('cosyone_font1_import'));
			$this->document->addStyle('//fonts.googleapis.com/css?family=' . $this->config->get('cosyone_font2_import'));
			} else {
			$this->document->addStyle('//fonts.googleapis.com/css?family=Roboto:300,400,500,600');
			$this->document->addStyle('//fonts.googleapis.com/css?family=Roboto+Slab:300,400,600,700');
			}
			$data['cosyone_styles'] = $this->load->controller('common/cosyone_styles');
			$data['header_login'] = $this->load->controller('common/header_login');
			$data['header_wishlist_compare'] = $this->load->controller('common/header_wishlist_compare');
			$data['cosyone_default_product_style'] = $this->config->get('cosyone_default_product_style');
			$data['cosyone_use_custom'] = $this->config->get('cosyone_use_custom');
			$data['cosyone_container_layout'] = $this->config->get('cosyone_container_layout');
			$data['cosyone_use_breadcrumb'] = $this->config->get('cosyone_use_breadcrumb');
			$data['cosyone_menu_sticky'] = $this->config->get('cosyone_menu_sticky');
			$data['cosyone_menu_border'] = $this->config->get('cosyone_menu_border');
			$data['cosyone_header_style'] = $this->config->get('cosyone_header_style');
			$data['cosyone_header_search'] = $this->config->get('cosyone_header_search');
			$data['cosyone_menu_mega_second_thumb'] = $this->config->get('cosyone_menu_mega_second_thumb');
			$data['cosyone_menu_block_width'] = $this->config->get('cosyone_menu_block_width');
			$data['cosyone_custom_menu_block'] = $this->config->get('cosyone_custom_menu_block');
			$data['cosyone_custom_menu_url1'] = '/' . $this->session->data['country_code'] . '/' . $this->session->data['language_name'] . $this->config->get('cosyone_custom_menu_url1');
			$data['cosyone_custom_menu_url2'] = '/' . $this->session->data['country_code'] . '/' . $this->session->data['language_name'] . $this->config->get('cosyone_custom_menu_url2');
			$data['cosyone_custom_menu_url3'] = '/' . $this->session->data['country_code'] . '/' . $this->session->data['language_name'] . $this->config->get('cosyone_custom_menu_url3');
			$data['cosyone_custom_menu_url4'] = '/' . $this->session->data['country_code'] . '/' . $this->session->data['language_name'] . $this->config->get('cosyone_custom_menu_url4');
			$data['cosyone_custom_menu_url5'] = '/' . $this->session->data['country_code'] . '/' . $this->session->data['language_name'] . $this->config->get('cosyone_custom_menu_url5');
                        $data['cosyone_custom_menu_url6'] = '/' . $this->session->data['country_code'] . '/' . $this->session->data['language_name'] . $this->config->get('cosyone_custom_menu_url6');
			$cosyone_top_promo = $this->config->get('cosyone_top_promo_message');
			if(empty($cosyone_top_promo[$this->config->get('config_language_id')])) {
				$data['cosyone_top_promo_message'] = false;
			} else if (isset($cosyone_top_promo[$this->config->get('config_language_id')])) {
				$data['cosyone_top_promo_message'] = html_entity_decode($cosyone_top_promo[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			$cosyone_menu_block_title = $this->config->get('cosyone_custom_menu_block_title');
			if(empty($cosyone_menu_block_title[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_block_title'] = false;
			} else if (isset($cosyone_menu_block_title[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_block_title'] = html_entity_decode($cosyone_menu_block_title[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			$cosyone_menu_custom_block = $this->config->get('cosyone_menu_custom_block_content');
			if(empty($cosyone_menu_custom_block[$this->config->get('config_language_id')])) {
				$data['cosyone_menu_custom_block_content'] = false;
			} else if (isset($cosyone_menu_custom_block[$this->config->get('config_language_id')])) {
				$data['cosyone_menu_custom_block_content'] = html_entity_decode($cosyone_menu_custom_block[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			$cosyone_menu_custom_link1 = $this->config->get('cosyone_custom_menu_title1');
			if(empty($cosyone_menu_custom_link1[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title1'] = false;
			} else if (isset($cosyone_menu_custom_link1[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title1'] = html_entity_decode($cosyone_menu_custom_link1[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			$cosyone_menu_custom_link2 = $this->config->get('cosyone_custom_menu_title2');
			if(empty($cosyone_menu_custom_link2[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title2'] = false;
			} else if (isset($cosyone_menu_custom_link2[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title2'] = html_entity_decode($cosyone_menu_custom_link2[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			$cosyone_menu_custom_link3 = $this->config->get('cosyone_custom_menu_title3');
			if(empty($cosyone_menu_custom_link3[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title3'] = false;
			} else if (isset($cosyone_menu_custom_link3[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title3'] = html_entity_decode($cosyone_menu_custom_link3[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			$cosyone_menu_custom_link4 = $this->config->get('cosyone_custom_menu_title4');
			if(empty($cosyone_menu_custom_link4[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title4'] = false;
			} else if (isset($cosyone_menu_custom_link4[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title4'] = html_entity_decode($cosyone_menu_custom_link4[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			$cosyone_menu_custom_link5 = $this->config->get('cosyone_custom_menu_title5');
			if(empty($cosyone_menu_custom_link5[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title5'] = false;
			} else if (isset($cosyone_menu_custom_link5[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title5'] = html_entity_decode($cosyone_menu_custom_link5[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
                            
                        $cosyone_menu_custom_link6 = $this->config->get('cosyone_custom_menu_title6');
			if(empty($cosyone_menu_custom_link6[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title6'] = false;
			} else if (isset($cosyone_menu_custom_link6[$this->config->get('config_language_id')])) {
				$data['cosyone_custom_menu_title6'] = html_entity_decode($cosyone_menu_custom_link6[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}    
			$data['cosyone_show_home_icon'] = $this->config->get('cosyone_show_home_icon');
			$data['cosyone_max_width'] = $this->config->get('cosyone_max_width');
			$data['cosyone_use_responsive'] = $this->config->get('cosyone_use_responsive');
			$data['cosyone_header_cart'] = $this->config->get('cosyone_header_cart');
			// Cosyone ends
		

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

		// cosyone custom code start
		$this->load->language('common/cosyone');
		$data['cosyone_text_mobile_menu'] = $this->language->get('cosyone_text_mobile_menu');
		// Cosyone ends
		
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
                
                if(($this->session->data['country_code']=='ua')||($this->session->data['country_code']=='ru')){
                    $country_code = $this->session->data['country_code'];
                }else{
                    $country_code = 'en';
                }
                
                $data['text_phone'] = $this->language->get('text_phone_'. $country_code);
                $data['text_free_call'] = $this->language->get('text_free_call');
                
                $data['text2'] = $this->language->get('text2_'. $country_code);
                
                $data['text_search2'] = $this->language->get('text_search2');
                $data['text_see_all'] = $this->language->get('text_see_all');

                $data['blog'] = $this->url->link('blog/home', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
                
		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		// Custom categories starts
		// Add current class for active categories
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$data['category_1_id'] = $parts[0];
		} else {
			$data['category_1_id'] = 0;
		}
					
		$categories_1 = $this->model_catalog_category->getCategories(0);
		$this->load->model('tool/image');
		foreach ($categories_1 as $category_1) {
		if ($category_1['top']) {
			$level_2_data = array();
			$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
			foreach ($categories_2 as $category_2) {
				$level_3_data = array();

				// Third level
				$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

				foreach ($categories_3 as $category_3) {
					
					$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category_3['category_id']));

					$level_3_data[] = array(
					'name' => $category_3['name'] .($this->config->get('config_product_count') ?  ' (' . $total . ')' : ''),
					'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id'], false, $this->session->data['country_code'], $this->session->data['language_name'])
					);
				 } 
				
				// Second level
				$categories_2 = $this->model_catalog_category->getCategories(0);
				
				$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category_2['category_id'], 'filter_sub_category' => true));
				
        		if ($category_2['image']) {
				$category_2_image = $this->model_tool_image->resize($category_2['image'], $this->config->get('cosyone_menu_mega_second_image_w'), $this->config->get('cosyone_menu_mega_second_image_h'));
				} else {
				$category_2_image = '';
				}
				$level_2_data[] = array(
					'name'    	=> $category_2['name']  .($this->config->get('config_product_count') ?  '<span>' . ' (' . $total . ')' . '</span>' : ''),
					'thumb' 	=> $category_2_image,
					'children'	=> $level_3_data,
					'href'    	=> $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'], false, $this->session->data['country_code'], $this->session->data['language_name'])
				);					
		}
			
				// First level
                        if ($category_1['image']) {
                        $category_1_image = $this->model_tool_image->resize($category_1['image'], 350, 350);
                        } else {
                        $category_1_image = '';
                        }
			$data['categories'][] = array(
				'category_1_id' => $category_1['category_id'],
				'column'   => $category_1['column'] ? $category_1['column'] : 1,
				'name'     => $category_1['name'],
				'children' => $level_2_data,
				'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'], false, $this->session->data['country_code'], $this->session->data['language_name']),
                                'thumb'    => $category_1_image,
			);
		}
	}
                            //var_dump($data['categories']);
	// Custom categories ends
	






























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
