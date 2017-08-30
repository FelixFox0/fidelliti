<?php
class ControllerCommonCountries extends Controller {
	public function index() {
            //$this->load->language('common/countries');
            $data['geo_country'] = json_decode(file_get_contents('http://freegeoip.net/json/'.$this->request->server['REMOTE_ADDR']))->country_code;
//            var_dump($data['geo_country']);
//            die();
            $this->load->model('common/countries');
            $data['countries'] = $this->model_common_countries->getCountries();
            $data['country_s'] = $this->session->data['country_code'];
            $data['href'] = substr($_SERVER['REQUEST_URI'],1);
            $this->load->model('startup/url');
            if($this->model_startup_url->checkCountryIso(substr($data['href'], 0, stripos($data['href'],'/')))){
                $data['href'] = substr($data['href'], stripos($data['href'],'/'));
//                var_dump($data['href']);
            }elseif($this->model_startup_url->checkCountryIso(substr($data['href'], 0))){
                $data['href'] = '/';
            }else{
                $data['href'] = '/'.$data['href'];
            }
//            var_dump(substr($data['href'], 1,3));
            if($this->model_startup_url->getLanguageByName(substr($data['href'], 1,3 ))){
                $data['href'] = '/' . substr($data['href'], 5);
            }
//            var_dump($data['countries']);
//            die();
            $data['browser_lang'] = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
//            var_dump($data['browser_lang']);
//            die();
            $this->load->model('localisation/language');

		$data['languages'] = array();
                
		$results = $this->model_localisation_language->getLanguages();

		foreach ($results as $result) {
			if ($result['status']) {
				$data['languages'][] = array(
					'name' => $result['name'],
					'code' => $result['code']
				);
			}
		}
                
//                var_dump($results);
            return $this->load->view('common/countries', $data);
            
        }
}
?>