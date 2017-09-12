<?php
class ControllerCommonSearch extends Controller {
	public function index() {
		$this->load->language('common/search');

		$data['text_search'] = $this->language->get('text_search');
                $data['text_bye'] = $this->language->get('text_bye');
                $data['text_wish'] = $this->language->get('text_wish');
                $data['text_dop'] = $this->language->get('text_dop');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		return $this->load->view('common/search', $data);
	}
}