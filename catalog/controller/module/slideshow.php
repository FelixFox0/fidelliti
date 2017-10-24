<?php
class ControllerModuleSlideshow extends Controller {
	public function index($setting) {
            
            if($this->session->data['language_name']=='ukr'){
                $code = '_ua';
            }elseif($this->session->data['language_name']=='rus'){
                $code = '';
            }else{
                $code = '_en';
            }
            
                $data['title'] = $this->config->get('config_meta_title' . $code);
            
                $this->load->language('module/slideshow');
                $data['text_link'] = $this->language->get('text_link');
                
		static $module = 0;		

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('/catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('/catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);
//                var_dump($results);
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
                                        'description'  => html_entity_decode($result['description']),
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('module/slideshow', $data);
	}
}
