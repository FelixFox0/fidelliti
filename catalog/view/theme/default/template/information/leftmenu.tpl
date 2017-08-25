
    <div class="col-sm-3">
      <ul class="static-pages__sidebar">
        <li>
          <a href="#">Нужна помощь?</a>
          <ul>
            <li><a href="<?php echo $faq; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i>Часто задаваемые вопросы</a></li>
            <li><a href="<?php echo $policy; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i>Политика конфиденциальности</a></li>
            <li><a href="<?php echo $cookies; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i>Политика cookies</a></li>
            <li><a href="<?php echo $contact; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i>Связаться с нами</a></li>
          </ul>
        </li>
        
        <li>
          <a href="#">Политика продаж</a>
          <ul>
            <li><a href="<?php echo $paymant; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i>Оплата</a></li>
            <li><a href="<?php echo $delivery; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i>Доставка</a></li>
            <li><a href="<?php echo $return; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i>Возврат</a></li>
            <li><a href="<?php echo $contact; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i>Публичная оферта</a></li>
          </ul>
        </li>
        <?php if($country_code == 'ua'){ ?> 
        <li>
          <a href="#">Вакансии</a>
          <ul>
            <li><a href="<?php echo $works; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i>Работай с нами</a></li>
          </ul>
        </li>
        <?php } ?> 
        <li>
          <a href="#">Колл-центр</a>
          <ul>
            <li><a href="tel:<?php echo $text_numb; ?>"><i class="fa fa-chevron-down" aria-hidden="true"></i><?php echo $text_numb; ?></a></li>
          </ul>
        </li>
      </ul>
    </div>
 
