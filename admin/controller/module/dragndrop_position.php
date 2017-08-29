<?php
class ControllerModuleDragndropPosition extends Controller {
	private $error = array();

	public function index() {
		
	}

	public function position() {
//            die();
            var_dump($this->request->post);
            //var_dump($this->request->get);
	}
}