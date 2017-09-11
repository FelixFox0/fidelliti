<?php
class ControllerProductSearch extends Controller {
	public function index() {
		$this->load->language('product/search');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

			if (file_exists('catalog/view/theme/cosyone/js/countdown/jquery.countdown_' . $this->language->get('code') . '.js')) {
			$this->document->addScript('catalog/view/theme/cosyone/js/countdown/jquery.countdown_' . $this->language->get('code') . '.js');
			} else {
			$this->document->addScript('catalog/view/theme/cosyone/js/countdown/jquery.countdown_en.js');
			}
			$this->load->language('common/cosyone');
				$data['text_category_expire'] = $this->language->get('text_category_expire');
				$data['cosyone_category_per_row'] = $this->config->get('cosyone_category_per_row');
				$data['cosyone_rollover_effect'] = $this->config->get('cosyone_rollover_effect');
				$data['cosyone_percentage_sale_badge'] = $this->config->get('cosyone_percentage_sale_badge');
				$cosyone_quicklook = $this->config->get('cosyone_text_ql');
				if(empty($cosyone_quicklook[$this->config->get('config_language_id')])) {
					$data['cosyone_text_ql'] = false;
				} else if (isset($cosyone_quicklook[$this->config->get('config_language_id')])) {
					$data['cosyone_text_ql'] = html_entity_decode($cosyone_quicklook[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
				}
				$data['cosyone_brand'] = $this->config->get('cosyone_brand');
				$data['cosyone_product_countdown'] = $this->config->get('cosyone_product_countdown');
				$data['cosyone_product_hurry'] = $this->config->get('cosyone_product_hurry');
				$data['cosyone_default_view'] = $this->config->get('cosyone_default_view');
				$data['cosyone_grid_category'] = $this->config->get('cosyone_grid_category');
			

		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = '';
		}

		if (isset($this->request->get['tag'])) {
			$tag = $this->request->get['tag'];
		} elseif (isset($this->request->get['search'])) {
			$tag = $this->request->get['search'];
		} else {
			$tag = '';
		}

		if (isset($this->request->get['description'])) {
			$description = $this->request->get['description'];
		} else {
			$description = '';
		}

		if (isset($this->request->get['category_id'])) {
			$category_id = $this->request->get['category_id'];
		} else {
			$category_id = 0;
		}

		if (isset($this->request->get['sub_category'])) {
			$sub_category = $this->request->get['sub_category'];
		} else {
			$sub_category = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		if (isset($this->request->get['search'])) {
			$this->document->setTitle($this->language->get('heading_title') .  ' - ' . $this->request->get['search']);
		} elseif (isset($this->request->get['tag'])) {
			$this->document->setTitle($this->language->get('heading_title') .  ' - ' . $this->language->get('heading_tag') . $this->request->get['tag']);
		} else {
			$this->document->setTitle($this->language->get('heading_title'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', '', false, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . $this->request->get['mfp'];
				}
			

		if (isset($this->request->get['search'])) {
			$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['tag'])) {
			$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['description'])) {
			$url .= '&description=' . $this->request->get['description'];
		}

		if (isset($this->request->get['category_id'])) {
			$url .= '&category_id=' . $this->request->get['category_id'];
		}

		if (isset($this->request->get['sub_category'])) {
			$url .= '&sub_category=' . $this->request->get['sub_category'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('product/search', $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		if (isset($this->request->get['search'])) {
			$data['heading_title'] = $this->language->get('heading_title') .  ' - ' . $this->request->get['search'];
		} else {
			$data['heading_title'] = $this->language->get('heading_title');
		}

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_sub_category'] = $this->language->get('text_sub_category');
		$data['text_quantity'] = $this->language->get('text_quantity');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_price'] = $this->language->get('text_price');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_points'] = $this->language->get('text_points');
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');

		$data['entry_search'] = $this->language->get('entry_search');
		$data['entry_description'] = $this->language->get('entry_description');

		$data['button_search'] = $this->language->get('button_search');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_list'] = $this->language->get('button_list');
		$data['button_grid'] = $this->language->get('button_grid');

		$data['compare'] = $this->url->link('product/compare', '', false, $this->session->data['country_code'], $this->session->data['language_name']);

		$this->load->model('catalog/category');

		// 3 Level Category Search
		$data['categories'] = array();

		$categories_1 = $this->model_catalog_category->getCategories(0);

		foreach ($categories_1 as $category_1) {
			$level_2_data = array();

			$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);

			foreach ($categories_2 as $category_2) {
				$level_3_data = array();

				$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

				foreach ($categories_3 as $category_3) {
					$level_3_data[] = array(
						'category_id' => $category_3['category_id'],
						'name'        => $category_3['name'],
					);
				}

				$level_2_data[] = array(
					'category_id' => $category_2['category_id'],
					'name'        => $category_2['name'],
					'children'    => $level_3_data
				);
			}

			$data['categories'][] = array(
				'category_id' => $category_1['category_id'],
				'name'        => $category_1['name'],
				'children'    => $level_2_data
			);
		}

		$data['products'] = array();

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$filter_data = array(
				'filter_name'         => $search,
				'filter_tag'          => $tag,
				'filter_description'  => $description,
				'filter_category_id'  => $category_id,
				'filter_sub_category' => $sub_category,
				'sort'                => $sort,
				'order'               => $order,
				'start'               => ($page - 1) * $limit,
				'limit'               => $limit
			);

			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 417, 706);
				} else {
					$image = $this->model_tool_image->resize($result['image'], 417, 706);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}


			// Cosyone custom code starts	
			  if ((float)$result['special']) {
				$sales_percantage = ((($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')))-($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'))))/(($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')))/100));
				} else {
				$sales_percantage = false;
				}
			  if ((float)$result['special']) {
    			$special_info = $this->model_catalog_product->getSpecialPriceEnd($result['product_id']);
        		$special_date_end = strtotime($special_info['date_end']) - time();
    			} else {
        		$special_date_end = false;
    			}
				$images = $this->model_catalog_product->getProductImages($result['product_id']);
            	if(isset($images[0]['image']) && !empty($images[0]['image'])){
                 $images =$images[0]['image'];
               } else {
				$images = false;
				}
				// Cosyone custom code ends
			   
				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,

			// Cosyone custom code starts	
			  'sales_percantage' => number_format($sales_percantage, 0, ',', '.'),
			  'special_date_end' => $special_date_end,
			  'stock_quantity' => sprintf($this->language->get('text_category_stock_quantity'), (int)$result['quantity']),
			  'brand_name'		=> $result['manufacturer'],
			  'thumb_hover'  => $this->model_tool_image->resize($images, $this->config->get('theme_default_image_product_width'), $this->config->get('theme_default_image_product_height')),
			  // Cosyone custom code ends
			   
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],

		'quickview'        => $this->url->link('product/quickview', 'product_id=' . $result['product_id'] . $url, '', 'SSL', $this->session->data['country_code'], $this->session->data['language_name']),
		
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
				);
			}

			$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . $this->request->get['mfp'];
				}
			

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/search', 'sort=p.sort_order&order=ASC' . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/search', 'sort=pd.name&order=ASC' . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/search', 'sort=pd.name&order=DESC' . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/search', 'sort=p.price&order=ASC' . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/search', 'sort=p.price&order=DESC' . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/search', 'sort=rating&order=DESC' . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/search', 'sort=rating&order=ASC' . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/search', 'sort=p.model&order=ASC' . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/search', 'sort=p.model&order=DESC' . $url, false, $this->session->data['country_code'], $this->session->data['language_name'])
			);

			$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . $this->request->get['mfp'];
				}
			

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/search', $url . '&limit=' . $value, false, $this->session->data['country_code'], $this->session->data['language_name'])
				);
			}

			$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . $this->request->get['mfp'];
				}
			

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/search', $url . '&page={page}', false, $this->session->data['country_code'], $this->session->data['language_name']);

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
			    $this->document->addLink($this->url->link('product/search', '', true, $this->session->data['country_code'], $this->session->data['language_name']), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('product/search', '', true, $this->session->data['country_code'], $this->session->data['language_name']), 'prev');
			} else {
			    $this->document->addLink($this->url->link('product/search', $url . '&page='. ($page - 1), true, $this->session->data['country_code'], $this->session->data['language_name']), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('product/search', $url . '&page='. ($page + 1), true, $this->session->data['country_code'], $this->session->data['language_name']), 'next');
			}
		}

		$data['search'] = $search;
		$data['description'] = $description;
		$data['category_id'] = $category_id;
		$data['sub_category'] = $sub_category;

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');


				if( isset( $this->request->get['mfilterAjax'] ) ) {
					$settings	= $this->config->get('mega_filter_settings');
					$baseTypes	= array( 'stock_status', 'manufacturers', 'rating', 'attributes', 'price', 'options', 'filters' );
		
					if( isset( $this->request->get['mfilterBTypes'] ) ) {
						$baseTypes = explode( ',', $this->request->get['mfilterBTypes'] );
					}
					
					if( ! empty( $settings['calculate_number_of_products'] ) || in_array( 'categories:tree', $baseTypes ) ) {
						if( empty( $settings['calculate_number_of_products'] ) ) {
							$baseTypes = array( 'categories:tree' );
						}
				
						$this->load->model( 'module/mega_filter' );

						$idx = 0;
		
						if( isset( $this->request->get['mfilterIdx'] ) )
							$idx = (int) $this->request->get['mfilterIdx'];
						
						$data['mfilter_json'] = json_encode( MegaFilterCore::newInstance( $this, NULL )->getJsonData($baseTypes, $idx) );
					}
				
					$data['header'] = $data['column_left'] = $data['column_right'] = $data['content_top'] = $data['content_bottom'] = $data['footer'] = '';
				}
				
				if( ! empty( $data['breadcrumbs'] ) && ! empty( $this->request->get['mfp'] ) ) {
					foreach( $data['breadcrumbs'] as $mfK => $mfBreadcrumb ) {
						$mfReplace = preg_replace( '/path\[[^\]]+\],?/', '', $this->request->get['mfp'] );
						$mfFind = ( mb_strpos( $mfBreadcrumb['href'], '?mfp=', 0, 'utf-8' ) !== false ? '?mfp=' : '&mfp=' );
						
						$data['breadcrumbs'][$mfK]['href'] = str_replace(array(
							$mfFind . $this->request->get['mfp'],
							'&amp;mfp=' . $this->request->get['mfp'],
							$mfFind . urlencode( $this->request->get['mfp'] ),
							'&amp;mfp=' . urlencode( $this->request->get['mfp'] )
						), $mfReplace ? $mfFind . $mfReplace : '', $mfBreadcrumb['href'] );
					}
				}
			
		$this->response->setOutput($this->load->view('product/search', $data));
	}
}
