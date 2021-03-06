<?php
class ControllerCommonLanguage extends Controller {
	public function index() {
//            die('sda');
		$this->load->language('common/language');

		$data['text_language'] = $this->language->get('text_language');

		$data['action'] = $this->url->link('common/language/language', '', $this->request->server['HTTPS'], $this->session->data['country_code'], $this->session->data['language_name']);

		$data['code'] = $this->session->data['language'];

		$this->load->model('localisation/language');

		$data['languages'] = array();

		$results = $this->model_localisation_language->getLanguages();

		foreach ($results as $result) {
			if ($result['status']) {
				$data['languages'][] = array(
//					'name' => $result['name'],
                                        'name' => $this->language->get($result['code']),
					'code' => $result['code']
				);
			}
		}

		if (!isset($this->request->get['route'])) {
			$data['redirect'] = $this->url->link('common/home');
		} else {
//                    var_dump($this->request->get);
			$url_data = $this->request->get;

			$route = $url_data['route'];

			unset($url_data['route']);
                        unset($url_data['_route_']);

			$url = '';

			if ($url_data) {
				$url = '&' . urldecode(http_build_query($url_data, '', '&'));
			}

			$data['redirect'] = $this->url->link($route, $url, $this->request->server['HTTPS']);
		}

		return $this->load->view('common/language', $data);
	}

	public function language() {
//            var_dump($this->request->post['code']);
//            die();
		if (isset($this->request->post['code'])) {
			$this->session->data['language'] = $this->request->post['code'];
                        $this->load->model('startup/url');
                        $this->session->data['language_name'] = $this->model_startup_url->getLanguageByCode($this->session->data['language'])['name'];
//                        $this->session->data['country_code_old'] = $this->request->post['code'];
//                        var_dump($this->session->data['language_name']);
//                        die();
		}
//                var_dump($this->request->post);
//                die();
		if (isset($this->request->post['redirect'])) {
			$this->response->redirect($this->request->post['redirect']);
		} else {
			$this->response->redirect($this->url->link('common/home'));
		}
	}
}