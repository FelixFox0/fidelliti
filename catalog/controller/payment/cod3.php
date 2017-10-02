<?php
class ControllerPaymentCod3 extends Controller {
	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');

		$data['text_loading'] = $this->language->get('text_loading');

		$data['continue'] = $this->url->link('checkout/success', '', false, $this->session->data['country_code'], $this->session->data['language_name']);

		return $this->load->view('payment/cod3', $data);
	}

	public function confirm() {
		if ($this->session->data['payment_method']['code'] == 'cod3') {
			$this->load->model('checkout/order');

			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('cod3_order_status_id'));
		}
	}
}
