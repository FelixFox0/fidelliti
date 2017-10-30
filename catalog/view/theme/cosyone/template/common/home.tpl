<?php echo $header; ?>
<?php echo $home_top_top; ?>

<style>
    @media only screen and (max-width: 480px){
        .discount-home__inner a {
            padding: 15px 19px;
        }
        .woman-collection__info p {
            font-family: pt-b;
            font-size: 16px;
            line-height: 22px;
            letter-spacing: 1.15px;
        }
        .categories-home__item {
            font-size: 16px;
        }
    }
</style>
<div class="woman-collection" id="woman-collection">
  <div class="container woman-collection__container">
    <div class="woman-collection__inner">
      <div class="woman-collection__info">
        <h3 style="font-family: pt-book;"><?php echo $text_wsc; ?></h3>
        <p style="font-family: pt-b;"><?php echo $text_wsc_d; ?></p>
        <a href="<?php echo $categories1[2]['link']; ?>" style="font-size: 12px; padding: 18px 42px; font-family: pt-medium;"><?php echo $text_wsc_b; ?></a>
      </div>
      <div class="woman-collection__img">
        <img src="/image/wooman1.png" alt="wooman">
      </div>
    </div>
  </div>
</div>

<div class="categories-home">
  <div class="categories-home__wooman">
    <a href="<?php echo $categories1[0]['link']; ?>" class="categories-home__item first" style="font-family: pt-b;"><?php echo $categories1[0]['name']; ?></a>
    <a href="<?php echo $categories1[1]['link']; ?>" class="categories-home__item bags" style="font-family: pt-b;"><?php echo $categories1[1]['name']; ?></a>
    <a href="<?php echo $categories1[2]['link']; ?>" class="categories-home__item shoes" style="font-family: pt-b;"><?php echo $categories1[2]['name']; ?></a>
    <a href="<?php echo $categories1[3]['link']; ?>" class="categories-home__item accessories" style="font-family: pt-b;"><?php echo $categories1[3]['name']; ?></a>
  </div>
  <div class="categories-home__man">
    <a href="<?php echo $categories2[0]['link']; ?>" class="categories-home__item first" style="font-family: pt-b;"><?php echo $categories2[0]['name']; ?></a>
    <a href="<?php echo $categories2[1]['link']; ?>" class="categories-home__item bags2" style="font-family: pt-b;"><?php echo $categories2[1]['name']; ?></a>
    <a href="<?php echo $categories2[2]['link']; ?>" class="categories-home__item accessories2" style="font-family: pt-b;"><?php echo $categories2[2]['name']; ?></a>
  </div>
</div>
<div class="discount-home">
  <div class="container discount-home__container">
      <div class="discount-home__inner" style="background-image: url('/image/fidelitti-30-sale.gif');">
      <div class="discount-home__info">
        <h3><?php echo $text_sale; ?></h3>
        <p><?php echo $text_sale_d; ?></p>
        <a style="padding: 15px 19px;" href="<?php echo $categories1[4]['link']; ?>"><?php echo $text_sale_b; ?></a>
      </div>
      
    </div>
  </div>
</div>


<?php echo $content_bottom; ?>

<?php if (false): ?>
  

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
<?php if(false){ ?>
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
<?php } ?>

<?php endif ?>
<?php echo $footer; ?> 