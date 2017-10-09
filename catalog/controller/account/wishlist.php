<?php
class ControllerAccountWishList extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/wishlist', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

			$this->response->redirect($this->url->link('account/login', '', true, $this->session->data['country_code'], $this->session->data['language_name']));
		}

		$this->load->language('account/wishlist');
		$this->load->language('account/account');
		
		$this->load->model('account/wishlist');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['remove'])) {
			// Remove Wishlist
			$this->model_account_wishlist->deleteWishlist($this->request->get['remove']);

			$this->session->data['success'] = $this->language->get('text_remove');

			$this->response->redirect($this->url->link('account/wishlist','',false, $this->session->data['country_code'], $this->session->data['language_name']));
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', '', false, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/wishlist', '', false, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_hello'] = $this->language->get('heading_hello');
		$data['heading_text'] = $this->language->get('heading_text');
		$data['heading_logout'] = $this->language->get('heading_logout');
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_account_start'] = $this->language->get('text_account_start');
		$data['text_my_account_sp'] = $this->language->get('text_my_account_sp');
		
		$data['menu_account'] = $this->language->get('menu_account');
		$data['menu_wishlist'] = $this->language->get('menu_wishlist');
		$data['menu_order'] = $this->language->get('menu_order');
		$data['menu_edit'] = $this->language->get('menu_edit');
		
		$data['column_image'] = $this->language->get('column_image');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_model'] = $this->language->get('column_model');
		$data['column_stock'] = $this->language->get('column_stock');
		$data['column_price'] = $this->language->get('column_price');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_continue_wish'] = $this->language->get('button_continue_wish');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['products'] = array();

		$results = $this->model_account_wishlist->getWishlist();

		foreach ($results as $result) {
			$product_info = $this->model_catalog_product->getProduct($result['product_id']);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_wishlist_width'), $this->config->get($this->config->get('config_theme') . '_image_wishlist_height'));
				} else {
					$image = false;
				}

				if ($product_info['quantity'] <= 0) {
					$stock = $product_info['stock_status'];
				} elseif ($this->config->get('config_stock_display')) {
					$stock = $product_info['quantity'];
				} else {
					$stock = $this->language->get('text_instock');
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				$data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'      => $image,
					'name'       => $product_info['name'],
					'model'      => $product_info['model'],
					'stock'      => $stock,
					'price'      => $price,
					'special'    => $special,
					'href'       => $this->url->link('product/product', 'product_id=' . $product_info['product_id'], false, $this->session->data['country_code'], $this->session->data['language_name']),
					'remove'     => $this->url->link('account/wishlist', 'remove=' . $product_info['product_id'], false, $this->session->data['country_code'], $this->session->data['language_name'])
				);
			} else {
				$this->model_account_wishlist->deleteWishlist($result['product_id']);
			}
		}

		$data['continue'] = $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['edit'] = $this->url->link('account/edit', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['password'] = $this->url->link('account/password', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['address'] = $this->url->link('account/address', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['wishlist'] = $this->url->link('account/wishlist', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['order'] = $this->url->link('account/order', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['download'] = $this->url->link('account/download', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['return'] = $this->url->link('account/return', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['transaction'] = $this->url->link('account/transaction', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['recurring'] = $this->url->link('account/recurring', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['add'] = $this->url->link('account/address/add', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
                $data['address'] = $this->url->link('account/address', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
 		$data['logout'] = $this->url->link('account/logout', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['account'] = $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/wishlist', $data));
	}

	public function add() {
		$this->load->language('account/wishlist');

		$json = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if ($this->customer->isLogged()) {
				// Edit customers cart
				$this->load->model('account/wishlist');

				$this->model_account_wishlist->addWishlist($this->request->post['product_id']);

				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . (int)$this->request->post['product_id'], false, $this->session->data['country_code'], $this->session->data['language_name']), $product_info['name'], $this->url->link('account/wishlist', '',false, $this->session->data['country_code'], $this->session->data['language_name']));

				$json['total'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
			} else {
				if (!isset($this->session->data['wishlist'])) {
					$this->session->data['wishlist'] = array();
				}

				$this->session->data['wishlist'][] = $this->request->post['product_id'];

				$this->session->data['wishlist'] = array_unique($this->session->data['wishlist']);

				$json['success'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true, $this->session->data['country_code'], $this->session->data['language_name']), $this->url->link('account/register', '', true, $this->session->data['country_code'], $this->session->data['language_name']), $this->url->link('product/product', 'product_id=' . (int)$this->request->post['product_id'],false, $this->session->data['country_code'], $this->session->data['language_name']), $product_info['name'], $this->url->link('account/wishlist', '',false, $this->session->data['country_code'], $this->session->data['language_name']));

				$json['total'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
