<?php
class ControllerInformationLeftmenu extends Controller {
    public function index() {
        $data = array();
        $data['country_code'] = $this->session->data['country_code'];
        
                if(($this->session->data['country_code']=='ua')||($this->session->data['country_code']=='ru')){
                    $country = $this->session->data['country_code'];
                }else{
                    $country = 'en';
                }
        $this->load->language('information/information');
        
        $data['contact'] = $this->url->link('information/contact','', false, $this->session->data['country_code'], $this->session->data['language_name']);
        $data['faq'] = $this->url->link('information/information','information_id=4', false, $this->session->data['country_code'], $this->session->data['language_name']);
        $data['works'] = $this->url->link('information/information','information_id=7', false, $this->session->data['country_code'], $this->session->data['language_name']);
        
        $data['cookies'] = $this->url->link('information/information','information_id=8', false, $this->session->data['country_code'], $this->session->data['language_name']);
        $data['policy'] = $this->url->link('information/information','information_id=9', false, $this->session->data['country_code'], $this->session->data['language_name']);
        $data['ofert'] = $this->url->link('information/information','information_id=19', false, $this->session->data['country_code'], $this->session->data['language_name']);
        
        if($this->session->data['country_code']=='ua'){
            $country = $this->session->data['country_code'];
            $data['paymant'] = $this->url->link('information/information','information_id=14', false, $this->session->data['country_code'], $this->session->data['language_name']);
            $data['delivery'] = $this->url->link('information/information','information_id=11', false, $this->session->data['country_code'], $this->session->data['language_name']);
            $data['return'] = $this->url->link('information/information','information_id=10', false, $this->session->data['country_code'], $this->session->data['language_name']);
        
        }elseif($this->session->data['country_code']=='ru'){
            $data['paymant'] = $this->url->link('information/information','information_id=15', false, $this->session->data['country_code'], $this->session->data['language_name']);
            $data['delivery'] = $this->url->link('information/information','information_id=12', false, $this->session->data['country_code'], $this->session->data['language_name']);
            $data['return'] = $this->url->link('information/information','information_id=17', false, $this->session->data['country_code'], $this->session->data['language_name']);
        
        }else{
            $data['paymant'] = $this->url->link('information/information','information_id=16', false, $this->session->data['country_code'], $this->session->data['language_name']);
            $data['delivery'] = $this->url->link('information/information','information_id=13', false, $this->session->data['country_code'], $this->session->data['language_name']);
            $data['return'] = $this->url->link('information/information','information_id=18', false, $this->session->data['country_code'], $this->session->data['language_name']);
        
        }
        $data['text_numb'] = $this->language->get('text_'.$country);
        
        /*
        if($this->session->data['country_code'] == 'ua'){
        $data['link'] = ''; //
        }elseif($this->session->data['country_code'] == 'ru'){

        }else{

        }*/
        return $this->load->view('information/leftmenu', $data);
    }
}