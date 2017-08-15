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
<?php echo $footer; ?> 