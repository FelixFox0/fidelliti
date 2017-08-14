<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}


			$data['home_top_top'] = $this->load->controller('common/home_top_top');
			$data['home_top_left'] = $this->load->controller('common/home_top_left');
			$data['home_top_center'] = $this->load->controller('common/home_top_center');
			$data['home_top_right'] = $this->load->controller('common/home_top_right');
			$data['content_bottom_half'] = $this->load->controller('common/content_bottom_half');
			// Cosyone ends
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}