<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
                
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

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}