<?php
class ControllerCommonHome extends Controller {
	public function index() {
//            var_dump($this->session->data);
//            die();
            if($this->session->data['language_name']=='ukr'){
                $code = '_ua';
            }elseif($this->session->data['language_name']=='rus'){
                $code = '';
            }else{
                $code = '_en';
            }
            
            $data['title'] = $this->config->get('config_meta_title' . $code);
            
		$this->document->setTitle($this->config->get('config_meta_title' . $code));
		$this->document->setDescription($this->config->get('config_meta_description' . $code));
		$this->document->setKeywords($this->config->get('config_meta_keyword' . $code));
                
                $this->load->language('common/home');
                $data['shopping'] = $this->language->get('shopping');
                $data['text_0'] = $this->language->get('text_0');
                $data['text_1'] = $this->language->get('text_1');
                $data['text_2'] = $this->language->get('text_2');
                $data['text_3'] = $this->language->get('text_3');
                
                
                $data['link_0'] = $this->url->link('product/category', 'path=61', false, $this->session->data['country_code'], $this->session->data['language_name']);
                $data['link_1'] = $this->url->link('product/category', 'path=71', false, $this->session->data['country_code'], $this->session->data['language_name']);
                $data['link_2'] = $this->url->link('product/category', 'path=91', false, $this->session->data['country_code'], $this->session->data['language_name']);

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

                $this->load->model('catalog/category');
                $data['categories1'][] = array(
                    'name' => $this->model_catalog_category->getCategory(20)['name'],
                    'link' => $this->url->link('product/category', 'path=20', false, $this->session->data['country_code'], $this->session->data['language_name']),
                );
                $data['categories1'][] = array(
                    'name' => $this->model_catalog_category->getCategory(61)['name'],
                    'link' => $this->url->link('product/category', 'path=61', false, $this->session->data['country_code'], $this->session->data['language_name']),
                );
                $data['categories1'][] = array(
                    'name' => $this->model_catalog_category->getCategory(94)['name'],
                    'link' => $this->url->link('product/category', 'path=94', false, $this->session->data['country_code'], $this->session->data['language_name']),
                );
                $data['categories1'][] = array(
                    'name' => $this->model_catalog_category->getCategory(65)['name'],
                    'link' => $this->url->link('product/category', 'path=65', false, $this->session->data['country_code'], $this->session->data['language_name']),
                );
                $data['categories1'][] = array(
                    'name' => $this->model_catalog_category->getCategory(69)['name'],
                    'link' => $this->url->link('product/category', 'path=69', false, $this->session->data['country_code'], $this->session->data['language_name']),
                );
                
                $data['categories2'][] = array(
                    'name' => $this->model_catalog_category->getCategory(70)['name'],
                    'link' => $this->url->link('product/category', 'path=70', false, $this->session->data['country_code'], $this->session->data['language_name']),
                );
                $data['categories2'][] = array(
                    'name' => $this->model_catalog_category->getCategory(71)['name'],
                    'link' => $this->url->link('product/category', 'path=71', false, $this->session->data['country_code'], $this->session->data['language_name']),
                );
                $data['categories2'][] = array(
                    'name' => $this->model_catalog_category->getCategory(72)['name'],
                    'link' => $this->url->link('product/category', 'path=72', false, $this->session->data['country_code'], $this->session->data['language_name']),
                );
                
                $data['text_wsc'] = $this->language->get('text_wsc');
                $data['text_wsc_d'] = $this->language->get('text_wsc_d');
                $data['text_wsc_b'] = $this->language->get('text_wsc_b');
                $data['text_sale'] = $this->language->get('text_sale');
                $data['text_sale_d'] = $this->language->get('text_sale_d');
                $data['text_sale_b'] = $this->language->get('text_sale_b');

                
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}