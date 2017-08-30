<?php
class ControllerModuleDragndropPosition extends Controller {
	private $error = array();

	public function index() {
		
	}

	public function position() {
//            die();
//            var_dump($this->request->post['order']);
            $this->load->model('module/dragndrop_position');
            $this->model_module_dragndrop_position->productPosition($this->request->post['order']);
            //var_dump($this->request->get);
            $json = array();
            $json['success'] = 'Вы изменили положение!';
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
	}
}