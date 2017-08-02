<?php
class ControllerStartupSeoUrl extends Controller {
	public function index() {
//            die('333');
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
//                var_dump($this->request->get['_route_']);
                if(isset($this->request->get['_route_'])){
                    $this->load->model('startup/url');
                    if($this->model_startup_url->checkCountryIso(substr($this->request->get['_route_'], 0, stripos($this->request->get['_route_'],'/')))){
                        $this->session->data['country_code'] = substr($this->request->get['_route_'], 0, stripos($this->request->get['_route_'],'/'));
                        if(stripos($this->request->get['_route_'], '/index.php')){
                            unset($this->request->get['_route_']);
                        }else{
                            $this->request->get['_route_'] = substr($this->request->get['_route_'], stripos($this->request->get['_route_'],'/')+1);
                        }
                    }elseif($this->model_startup_url->checkCountryIso(substr($this->request->get['_route_'], 0))){
                        $this->session->data['country_code'] = substr($this->request->get['_route_'], 0);

                            unset($this->request->get['_route_']);
                        
                    }else{
                        if(isset($this->session->data['country_code_old'])){
                            $this->session->data['country_code']=$this->session->data['country_code_old'];
                        }else{
                            $this->session->data['country_code'] = 'ua';
                        }
                    }
                    
                } else {
                    if(isset($this->session->data['country_code_old'])){
                        $this->session->data['country_code']=$this->session->data['country_code_old'];
                    }else{
                        $this->session->data['country_code'] = 'ua';
                    }
                }
                
//                var_dump($this->session->data['country_code']);
//                var_dump($this->session->data['language']);
//                die();
                
                if((!isset($this->session->data['country_code_old']))||(!isset($this->session->data['language_old']))){
                    if(($this->session->data['country_code']=='ru')||($this->session->data['country_code']=='ua')){
                        $code = 'ru-ru';
                    }else{
                        $code = 'en-gb';
                    }
                    $this->load->model('localisation/language');
                    $languages = $this->model_localisation_language->getLanguages();
                    $this->session->data['language'] = $code;
                    $language = new Language($code);
                    $language->load($code);
                    $this->registry->set('language', $language);
                    $this->config->set('config_language_id', $languages[$code]['language_id']);
                    $this->session->data['country_code_lang'] = $this->session->data['country_code'];
                    
                    $this->session->data['country_code_old'] = $this->session->data['country_code'];
                    $this->session->data['language_old'] = $this->session->data['language'];
                }elseif($this->session->data['country_code']!=$this->session->data['country_code_old']){
                    if(($this->session->data['country_code']=='ru')||($this->session->data['country_code']=='ua')){
                        $code = 'ru-ru';
                    }else{
                        $code = 'en-gb';
                    }
                    $this->load->model('localisation/language');
                    $languages = $this->model_localisation_language->getLanguages();
                    $this->session->data['language'] = $code;
                    $language = new Language($code);
                    $language->load($code);
                    $this->registry->set('language', $language);
                    $this->config->set('config_language_id', $languages[$code]['language_id']);
                    $this->session->data['country_code_lang'] = $this->session->data['country_code'];
                    
                    $this->session->data['country_code_old'] = $this->session->data['country_code'];
                    $this->session->data['language_old'] = $this->session->data['language'];
                }else{
                    $this->session->data['country_code_old'] = $this->session->data['country_code'];
                    $this->session->data['language_old'] = $this->session->data['language'];
                }
                
                
//                var_dump($this->session->data['country_code_old']);
//                var_dump($this->session->data['language_old']);
                // Change language by country
                /*if(isset($this->session->data['country_code'])){
                    if(isset($this->session->data['country_code_lang'])){
                        if($this->session->data['country_code']!=$this->session->data['country_code_lang']){
                            if(($this->session->data['country_code']=='RU')||($this->session->data['country_code']=='UA')){
                                $code = 'ru-ru';
                            }else{
                                $code = 'en-gb';
                            }
                            $this->load->model('localisation/language');
                            $languages = $this->model_localisation_language->getLanguages();
                            $this->session->data['language'] = $code;
                            $language = new Language($code);
                            $language->load($code);
                            $this->registry->set('language', $language);
                            $this->config->set('config_language_id', $languages[$code]['language_id']);
                            $this->session->data['country_code_lang'] = $this->session->data['country_code'];
                        }
                    }else{
                        if(($this->session->data['country_code']=='RU')||($this->session->data['country_code']=='UA')){
                            $code = 'ru-ru';
                        }else{
                            $code = 'en-gb';
                        }
                        $this->load->model('localisation/language');
                        $languages = $this->model_localisation_language->getLanguages();
                        $this->session->data['language'] = $code;
                        $language = new Language($code);
                        $language->load($code);
                        $this->registry->set('language', $language);
                        $this->config->set('config_language_id', $languages[$code]['language_id']);
                        $this->session->data['country_code_lang'] = $this->session->data['country_code'];
                    }
                }
                */
                
                
                	
                
                
                
                /*
                if(isset($this->request->get['_route_'])){
                    if(stripos($this->request->get['_route_'], '/index.php')){
                        $this->session->data['country_code'] = substr($this->request->get['_route_'], 0, stripos($this->request->get['_route_'],'/'));
                        //var_dump($this->session->data['country_code']);
                        unset($this->request->get['_route_']);
                    }else{
                        $this->load->model('startup/url');
                        if($this->model_startup_url->checkCountryIso(substr($this->request->get['_route_'], 0, stripos($this->request->get['_route_'],'/')))){

                            
//                            var_dump($this->model_startup_url->checkCountryIso(substr($this->request->get['_route_'], 0, stripos($this->request->get['_route_'],'/'))));

                            $this->session->data['country_code'] = substr($this->request->get['_route_'], 0, stripos($this->request->get['_route_'],'/'));
                            $this->request->get['_route_'] = substr($this->request->get['_route_'], stripos($this->request->get['_route_'],'/')+1);
                            //var_dump($this->request->get['_route_']);
                        }
                    }
                }
                */
                
		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);
//                        array_shift($parts);
			// remove any empty arrays from trailing
			if (utf8_strlen(end($parts)) == 0) {
				array_pop($parts);
			}

			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");

				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);

					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}

					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}

					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}

					if ($query->row['query'] && $url[0] != 'information_id' && $url[0] != 'manufacturer_id' && $url[0] != 'category_id' && $url[0] != 'product_id') {
						$this->request->get['route'] = $query->row['query'];
					}
				} else {
					$this->request->get['route'] = 'error/not_found';

					break;
				}
			}

			if (!isset($this->request->get['route'])) {
				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';
				} elseif (isset($this->request->get['path'])) {
					$this->request->get['route'] = 'product/category';
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				} elseif (isset($this->request->get['information_id'])) {
					$this->request->get['route'] = 'information/information';
				}
			}

			if (isset($this->request->get['route'])) {
				return new Action($this->request->get['route']);
			}
		}
	}

	public function rewrite($link) {
		$url_info = parse_url(str_replace('&amp;', '&', $link));

		$url = '';

		$data = array();

		parse_str($url_info['query'], $data);

		foreach ($data as $key => $value) {
            
if (isset($data['route'])) {
	if (
            ($data['route'] == 'product/product' && $key == 'product_id') 
            || (($data['route'] == 'product/manufacturer/info' 
            || $data['route'] == 'product/product') && $key == 'manufacturer_id') 
            || ($data['route'] == 'information/information' && $key == 'information_id')
        ) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");
 
		if ($query->num_rows && $query->row['keyword']) {
			$url .= '/' . $query->row['keyword'];
			unset($data[$key]);
		}
	} elseif ($key == 'path') {
		$categories = explode('_', $value);
 
		foreach ($categories as $category) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");
 
			if ($query->num_rows && $query->row['keyword']) {
				$url .= '/' . $query->row['keyword'];
			} else {
				$url = '';
 
				break;
			}
		}
 
		unset($data[$key]);
	}else{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($value) . "'");
		if (($query->num_rows && $query->row['keyword']) or $value == 'common/home') {
			$url .= '/' . $query->row['keyword'];
			unset($data[$key]);
		}
 
	}
}
            
		}

		if ($url) {
			unset($data['route']);

			$query = '';

			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . rawurlencode((string)$key) . '=' . rawurlencode((is_array($value) ? http_build_query($value) : (string)$value));
				}

				if ($query) {
					$query = '?' . str_replace('&', '&amp;', trim($query, '&'));
				}
			}

			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
			return $link;
		}
	}
}
