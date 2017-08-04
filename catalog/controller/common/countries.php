<?php
class ControllerCommonCountries extends Controller {
	public function index() {
            //$this->load->language('common/countries');
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
//            var_dump($data['countries']);
//            die();
            return $this->load->view('common/countries', $data);
            
        }
}
?>