<?php
class ControllerInformationLeftmenu extends Controller {
    public function index() {
        $data = array();
        $data['country_code'] = $this->session->data['country_code'];
        $this->load->language('information/information');
        if($this->session->data['country_code'] == 'ua'){
        $data['link'] = ''; //
        }elseif($this->session->data['country_code'] == 'ru'){

        }else{

        }
        return $this->load->view('information/leftmenu', $data);
    }
}