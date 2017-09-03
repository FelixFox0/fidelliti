
    <div class="col-sm-3 hidden-xs hidden-sm">
      <ul class="static-pages__sidebar">
        <li>
          <a href="#"><?php echo $text_need_help; ?></a>
          <ul>
            <li><a href="<?php echo $faq; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_faq; ?></a></li>
            <li><a href="<?php echo $policy; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_policy; ?></a></li>
            <li><a href="<?php echo $cookies; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_cookies; ?></a></li>
            <li><a href="<?php echo $contact; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_callback; ?></a></li>
          </ul>
        </li>
        
        <li>
          <a href="#"><?php echo $text_polit_prod; ?></a>
          <ul>
            <li><a href="<?php echo $paymant; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_payment; ?></a></li>
            <li><a href="<?php echo $delivery; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_shipping; ?></a></li>
            <li><a href="<?php echo $return; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_return; ?></a></li>
            <li><a href="<?php echo $ofert; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_ofert; ?></a></li>
          </ul>
        </li>
        <?php if($country_code == 'ua'){ ?> 
        <li>
          <a href="#"><?php echo $text_work; ?></a>
          <ul>
            <li><a href="<?php echo $works; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_work2; ?></a></li>
          </ul>
        </li>
        <?php } ?> 
        <li>
          <a href="#"><?php echo $text_callcenter; ?></a>
          <ul>
            <li><a href="tel:<?php echo $text_numb; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_numb; ?></a></li>
          </ul>
        </li>
      </ul>
    </div>
 
