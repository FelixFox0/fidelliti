<?php
class ModelTotalSubTotal extends Model {
	public function getTotal($total) {
		$this->load->language('total/sub_total');
//                var_dump($total);
//                die();
                if(isset($total['country_code'])){
                    $sub_total = $this->cart->getSubTotal($total['country_code']);
//                    var_dump("cacac");
                }else{
                    $sub_total = $this->cart->getSubTotal();
                }
        
//                var_dump($sub_total);
		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $voucher) {
				$sub_total += $voucher['amount'];
			}
		}

		$total['totals'][] = array(
			'code'       => 'sub_total',
			'title'      => $this->language->get('text_sub_total'),
			'value'      => $sub_total,
			'sort_order' => $this->config->get('sub_total_sort_order')
		);
//                var_dump($total['total']);
		$total['total'] += $sub_total;
	}
}
