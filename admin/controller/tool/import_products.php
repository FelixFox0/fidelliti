<?php
class ControllerToolImportProducts extends Controller { 
	private $error = array();
	private $ssl = 'SSL';

	public function __construct( $registry ) {
		parent::__construct( $registry );
		$this->ssl = (defined('VERSION') && version_compare(VERSION,'2.2.0.0','>=')) ? true : 'SSL';
        set_time_limit(1200);
	}


	public function index() {
		$this->load->language('tool/import_products');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('tool/import_products');
		$this->getForm();
	}


	public function upload() {
     
		$this->load->language('tool/import_products');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('tool/import_products');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateUploadForm())) {
			if ((isset( $this->request->files['upload'] )) && (is_uploaded_file($this->request->files['upload']['tmp_name']))) {
				$file = $this->request->files['upload']['tmp_name'];
				if ($this->model_tool_import_products->upload($file)==true) {
					$this->session->data['success'] = $this->language->get('text_success');
					$this->response->redirect($this->url->link('tool/import_products', 'token=' . $this->session->data['token'], $this->ssl));
				}
				else {
					$this->error['warning'] = $this->language->get('error_upload');
					if (defined('VERSION')) {
						if (version_compare(VERSION,'2.1.0.0') > 0) {
							$this->error['warning'] .= "<br />\n".$this->language->get( 'text_log_details_2_1_x' );
						} else
							$this->error['warning'] .= "<br />\n".$this->language->get( 'text_log_details_2_0_x' );
					} else {
						$this->error['warning'] .= "<br />\n".$this->language->get( 'text_log_details' );
					}
				}
			}
		}

		$this->getForm();
	}


	protected function return_bytes($val)
	{
		$val = trim($val);
	
		switch (strtolower(substr($val, -1)))
		{
			case 'm': $val = (int)substr($val, 0, -1) * 1048576; break;
			case 'k': $val = (int)substr($val, 0, -1) * 1024; break;
			case 'g': $val = (int)substr($val, 0, -1) * 1073741824; break;
			case 'b':
				switch (strtolower(substr($val, -2, 1)))
				{
					case 'm': $val = (int)substr($val, 0, -2) * 1048576; break;
					case 'k': $val = (int)substr($val, 0, -2) * 1024; break;
					case 'g': $val = (int)substr($val, 0, -2) * 1073741824; break;
					default : break;
				} break;
			default: break;
		}
		return $val;
	}


	public function settings() {
		$this->load->language('tool/import_products');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('tool/import_products');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateSettingsForm())) {
			if (!isset($this->request->post['import_products_settings_use_export_cache'])) {
				$this->request->post['import_products_settings_use_export_cache'] = '0';
			}
			if (!isset($this->request->post['import_products_settings_use_import_cache'])) {
				$this->request->post['import_products_settings_use_import_cache'] = '0';
			}
			$this->load->model('setting/setting');
			$this->model_setting_setting->editSetting('import_products', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success_settings');
			$this->response->redirect($this->url->link('tool/import_products', 'token=' . $this->session->data['token'], $this->ssl));
		}
		$this->getForm();
	}


	protected function getForm() {
		$data = array();
		$data['heading_title'] = $this->language->get('heading_title');
		


		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_loading_notifications'] = $this->language->get( 'text_loading_notifications' );
		$data['text_retry'] = $this->language->get('text_retry');

		$data['entry_export'] = $this->language->get( 'entry_export' );
		$data['entry_import'] = $this->language->get( 'entry_import' );
		$data['entry_export_type'] = $this->language->get( 'entry_export_type' );
		$data['entry_range_type'] = $this->language->get( 'entry_range_type' );
		$data['entry_start_id'] = $this->language->get( 'entry_start_id' );
		$data['entry_start_index'] = $this->language->get( 'entry_start_index' );
		$data['entry_end_id'] = $this->language->get( 'entry_end_id' );
		$data['entry_end_index'] = $this->language->get( 'entry_end_index' );
		$data['entry_incremental'] = $this->language->get( 'entry_incremental' );
		$data['entry_upload'] = $this->language->get( 'entry_upload' );

		$data['tab_export'] = $this->language->get( 'tab_export' );
		$data['tab_import'] = $this->language->get( 'tab_import' );
		$data['tab_settings'] = $this->language->get( 'tab_settings' );

		$data['button_export'] = $this->language->get( 'button_export' );
		$data['button_import'] = $this->language->get( 'button_import' );
		$data['button_settings'] = $this->language->get( 'button_settings' );
		$data['button_export_id'] = $this->language->get( 'button_export_id' );
		$data['button_export_page'] = $this->language->get( 'button_export_page' );

		$data['help_range_type'] = $this->language->get( 'help_range_type' );
		$data['help_incremental_yes'] = $this->language->get( 'help_incremental_yes' );
		$data['help_incremental_no'] = $this->language->get( 'help_incremental_no' );
		$data['help_format'] = $this->language->get( 'help_format' );

		$data['error_select_file'] = $this->language->get('error_select_file');
		$data['error_post_max_size'] = str_replace( '%1', ini_get('post_max_size'), $this->language->get('error_post_max_size') );
		$data['error_upload_max_filesize'] = str_replace( '%1', ini_get('upload_max_filesize'), $this->language->get('error_upload_max_filesize') );
		$data['error_id_no_data'] = $this->language->get('error_id_no_data');
		$data['error_page_no_data'] = $this->language->get('error_page_no_data');
		$data['error_param_not_number'] = $this->language->get('error_param_not_number');
		$data['error_notifications'] = $this->language->get('error_notifications');
		$data['error_no_news'] = $this->language->get('error_no_news');
		$data['error_batch_number'] = $this->language->get('error_batch_number');
		$data['error_min_item_id'] = $this->language->get('error_min_item_id');

		if (!empty($this->session->data['import_products_error']['errstr'])) {
			$this->error['warning'] = $this->session->data['import_products_error']['errstr'];
		}

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
			if (!empty($this->session->data['import_products_nochange'])) {
				$data['error_warning'] .= "<br />\n".$this->language->get( 'text_nochange' );
			}
		} else {
			$data['error_warning'] = '';
		}

		unset($this->session->data['import_products_error']);
		unset($this->session->data['import_products_nochange']);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], $this->ssl)
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tool/import_products', 'token=' . $this->session->data['token'], $this->ssl)
		);

		$data['back'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], $this->ssl);
		$data['button_back'] = $this->language->get( 'button_back' );
		$data['import'] = $this->url->link('tool/import_products/upload', 'token=' . $this->session->data['token'], $this->ssl);
		$data['export'] = $this->url->link('tool/import_products/download', 'token=' . $this->session->data['token'], $this->ssl);
		$data['settings'] = $this->url->link('tool/import_products/settings', 'token=' . $this->session->data['token'], $this->ssl);
		$data['post_max_size'] = $this->return_bytes( ini_get('post_max_size') );
		$data['upload_max_filesize'] = $this->return_bytes( ini_get('upload_max_filesize') );




		$data['token'] = $this->session->data['token'];

		$this->document->addStyle('view/stylesheet/import_products.css');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view( ((version_compare(VERSION, '2.2.0.0') >= 0) ? 'tool/import_products' : 'tool/import_products.tpl'), $data));
	}


	protected function validateUploadForm() {
		if (!$this->user->hasPermission('modify', 'tool/import_products')) {
			$this->error['warning'] = $this->language->get('error_permission');
		} /*else if (!isset( $this->request->post['incremental'] )) {
			$this->error['warning'] = $this->language->get( 'error_incremental' );
		} else if ($this->request->post['incremental'] != '0') {
			if ($this->request->post['incremental'] != '1') {
				$this->error['warning'] = $this->language->get( 'error_incremental' );
			}
		}*/

		if (!isset($this->request->files['upload']['name'])) {
			if (isset($this->error['warning'])) {
				$this->error['warning'] .= "<br /\n" . $this->language->get( 'error_upload_name' );
			} else {
				$this->error['warning'] = $this->language->get( 'error_upload_name' );
			}
		} else {
			$ext = strtolower(pathinfo($this->request->files['upload']['name'], PATHINFO_EXTENSION));
			if (($ext != 'xls') && ($ext != 'xlsx') && ($ext != 'ods')) {
				if (isset($this->error['warning'])) {
					$this->error['warning'] .= "<br /\n" . $this->language->get( 'error_upload_ext' );
				} else {
					$this->error['warning'] = $this->language->get( 'error_upload_ext' );
				}
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

}
?>