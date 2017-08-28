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
        
        $data['policy'] = $this->url->link('information/information','information_id=8', false, $this->session->data['country_code'], $this->session->data['language_name']);
        $data['cookies'] = $this->url->link('information/information','information_id=9', false, $this->session->data['country_code'], $this->session->data['language_name']);
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
        
        $data['text_need_help'] = $this->language->get('text_need_help');
        $data['text_faq'] = $this->language->get('text_faq');
        $data['text_policy'] = $this->language->get('text_policy');
        $data['text_cookies'] = $this->language->get('text_cookies');
        $data['text_callback'] = $this->language->get('text_callback');
        $data['text_polit_prod'] = $this->language->get('text_polit_prod');
        $data['text_payment'] = $this->language->get('text_payment');
        $data['text_shipping'] = $this->language->get('text_shipping');
        $data['text_return'] = $this->language->get('text_return');
        $data['text_ofert'] = $this->language->get('text_ofert');
        $data['text_work'] = $this->language->get('text_work');
        $data['text_work2'] = $this->language->get('text_work2');
        $data['text_callcenter'] = $this->language->get('text_callcenter');
        
        /*
        if($this->session->data['country_code'] == 'ua'){
        $data['link'] = ''; //
        }elseif($this->session->data['country_code'] == 'ru'){

        }else{

        }*/
        return $this->load->view('information/leftmenu', $data);
    }
}