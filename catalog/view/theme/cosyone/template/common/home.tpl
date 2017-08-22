<?php echo $header; ?>
<div class="banners">
  <div class="container banners__container">
    <div class="banners__item">
      <div class="banners__item-img">
        <a href="<?php echo $link_0; ?>"><img src="/image/home1.jpg" alt=""></a>
      </div>
      <div class="banners__item-info">
        <div class="banners__item-title">
          <?php echo $text_0; ?>     
        </div>
        <div class="banners__item-button">
          <a href="<?php echo $link_0; ?>" class="button"><?php echo $shopping; ?></a>
        </div>
      </div>
    </div>
    <div class="banners__item">
      <div class="banners__item-img">
        <a href="<?php echo $link_0; ?>"><img src="/image/home2.jpg" alt=""></a>
      </div>
      <div class="banners__item-info">
        <div class="banners__item-title">
          <?php echo $text_1; ?>     
          
        </div>
        <div class="banners__item-button">
          <a href="<?php echo $link_0; ?>" class="button"><?php echo $shopping; ?></a>
        </div>
      </div>
    </div>
    <div class="banners__item">
      <div class="banners__item-img">
        <a href="<?php echo $link_1; ?>"><img src="/image/home3.jpg" alt=""></a>
      </div>
      <div class="banners__item-info">
        <div class="banners__item-title">
          <?php echo $text_2; ?>        
        </div>
        <div class="banners__item-button">
          <a href="<?php echo $link_1; ?>" class="button"><?php echo $shopping; ?></a>
        </div>
      </div>
    </div>
    <div class="banners__item">
      <div class="banners__item-img">
        <a href="<?php echo $link_2; ?>"><img src="/image/home4.jpg" alt=""></a>
      </div>
      <div class="banners__item-info">
        <div class="banners__item-title">
          <?php echo $text_0; ?>            
        </div>
        <div class="banners__item-subtitle">
          <?php echo $text_3; ?>     
        </div>
        <div class="banners__item-button">
          <a href="<?php echo $link_2; ?>" class="button"><?php echo $shopping; ?></a>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$("li.home").addClass("current");
	$(".breadcrumb_wrapper").hide();
</script>
<div class="container main">
  <?php echo $home_top_top; ?>
  <div class="home_top_wrapper">
<?php echo $home_top_left; ?><?php echo $home_top_center; ?><?php echo $home_top_right; ?>
</div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> homepage">
    <?php echo $content_top; ?>
     <?php echo $content_bottom_half; ?>
     <?php echo $content_bottom; ?>
     </div>
    <?php echo $column_right; ?>
    </div>
</div>

<div class="static-pages">
  <div class="static-pages__title">
    Политика COOKIES
  </div>
  <div class="clearfix static-pages__container">
    <div class="col-md-3">
      <ul class="static-pages__sidebar">
        <li>
          <a href="#">Нужна помощь?</a>
          <ul>
            <li><a href="#"><i class="fa fa-chevron-down" aria-hidden="true"></i>Часто задаваемые вопросы</a></li>
            <li><a href="#"><i class="fa fa-chevron-down" aria-hidden="true"></i>Политика конфиденциальности</a></li>
            <li><a href="#"><i class="fa fa-chevron-down" aria-hidden="true"></i>Часто задаваемые вопросы</a></li>
            <li><a href="#"><i class="fa fa-chevron-down" aria-hidden="true"></i>Политика конфиденциальности</a></li>
            <li><a href="#"><i class="fa fa-chevron-down" aria-hidden="true"></i>Часто задаваемые вопросы</a></li>
            <li><a href="#"><i class="fa fa-chevron-down" aria-hidden="true"></i>Политика конфиденциальности</a></li>
          </ul>
          </li>

          <li>
          <a href="#">Колл-центр</a>
          <ul>
            <li><a href="tel:8 800 505 72 13"><i class="fa fa-chevron-down" aria-hidden="true"></i>8 800 505 72 13</a></li>
          </ul>
          </li>
      </ul>
    </div>
    <div class="col-md-9">
      <div class="static-pages__content">
        <div class="panel-group" id="accordion">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                Collapsible Group 1</a>
              </h4>
            </div>
            <div id="collapse1" class="panel-collapse collapse">
              <div class="panel-body">
                <h3>qweqwe</h3>
                <h4>qweeqw</h4>
                <h5>qweqweqweqweqweqwe</h5>
                <ul>
                  <li>qeqweqweqw eqw </li>
                  <li>qeqweqweqw eqw </li>
                  <li>qeqweqweqw eqw </li>
                  <li>qeqweqweqw eqw </li>
                  <li>qeqweqweqw eqw </li>
                </ul>

                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, laborum cumque itaque ut vel aliquid laboriosam reprehenderit quas nam <b>quibusdam sapiente</b> veniam quam impedit commodi est, temporibus maiores! Totam, doloribus!</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, laborum cumque itaque ut vel <i>aliquid laboriosam reprehenderit quas nam quibusdam sapiente veniam quam impedit</i> commodi est, temporibus maiores! Totam, doloribus!</p>
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                Collapsible Group 2</a>
              </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
              <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
              minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
              commodo consequat.</div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                Collapsible Group 3</a>
              </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
              <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
              minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
              commodo consequat.</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="text-popup" class="white-popup mfp-hide">
    <div class="large-12 columns modal_title">
        ОБСЛУЖИВАНИЕ КЛИЕНТОВ
    </div>
    <div class="white-popup__items">
    <div class="large-6 medium-6 small-6 columns modal__phone">
        <div><img src="/image/call-answer1.png" alt=""></div>
        <div>Телефон</div>
        <div><span class="prmn-cmngr-message">8 800 505 72 13</span></div>

        <div>С понедельника по пятницу</div> 
        <div>с 9:30 до 18:30 <br>По выходным <br>с 10:00 до 18:00 <br> UTC+02:00 </div>
    </div>
    <div class="large-6 medium-6 small-6 columns modal__email">
        <div>
            <img src="/image/mail-black-envelope-symbol.png" alt="">
        </div>
        <div>
            E-mail
        </div>
        <div>
            Пожалуйста, свяжитесь<br>
            с нами, перейдя по ссылке ниже
        </div>
        <div>
            <a href="/contact-us/">Отправить E-mail</a>
        </div>
    </div>
    <div class="large-6 medium-6 small-6 columns modal__chat">
        <div>
            <img src="/image/chat.png" alt="">
        </div>
        <div>
            ЧАТ
        </div>
        <div>
            Наши операторы<br> 
            в настоящее время доступны.
        </div>
        <div>
            <a href="javascript:jivo_api.open();">Задать вопрос</a>
        </div>
    </div>
    <div class="large-6 medium-6 small-6 columns modal__faq">
        <div>
            <img src="/image/question.png" alt="">
        </div>
        <div>
            FAQ 
        </div>
        <div>
            Читайте часто задаваемые вопросы для получения  дополнительной информации 
        </div>
        <div>
            <a href="/faq/">Читать FAQ</a>
        </div>
    </div>
    </div>
<button title="Close (Esc)" type="button" class="mfp-close">×</button></div>
<?php echo $footer; ?> 