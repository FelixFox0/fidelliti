<div class="box products">
  	<div class="box-heading products"><?php echo $heading_title; ?></div>
    <div class="<?php echo $grid; ?>">
    <div class="grid_holder">
    <div class="container">
    <div class="owl-carousel product-grid _in-prod">
      <?php foreach ($products as $product) { ?>
      <!--
    --><div class="item contrast_font product-layout">
       <div class="image">
        <?php if (false) { ?>   
        <?php if ($product['thumb_hover'] && $cosyone_rollover_effect == 'enabled') { ?>
        <div class="image_hover"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb_hover']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        <?php } elseif ($product['thumb']) { ?> -->
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        <?php } ?>

        <?php } ?>
        
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        <?php if ($product['label']) { ?>
            <img src="<?php echo $product['label']['label_image']; ?>" alt="<?php echo $product['label']['label_name']; ?>" class="product-layout__bage">
        <?php } ?>  

        <?php if ($cosyone_text_ql && false) {?>
        <div class="main_quicklook">
        <a href="<?php echo $product['quickview']; ?>" rel="nofollow" class="button quickview"><i class="fa fa-eye"></i> <?php echo $cosyone_text_ql; ?></a>
        </div>
      <?php } ?>
        </div><!-- image ends -->
      <div class="information_wrapper">
      <div class="left">
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
       <?php if ($product['brand_name'] && $cosyone_brand) { ?>
                <span class="brand main_font"><?php echo $product['brand_name']; ?></span>
                <?php } ?>
                <?php if ($product['rating']) { ?>      
      <div class="rating"><span class="rating r<?php echo $product['rating']; ?>"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span></div>
      <?php } ?>
      </div>
      <div class="description main_font"><?php // echo $product['description']; ?></div>
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>

        <?php if (($product['special']) && ($product['special_date_end'] > 0) && ($cosyone_product_countdown)) { ?>
      <div class="offer_popup">
        <div class="offer_background"></div>
        <div class="offer_content">
        <div class="countdown <?php echo $product['product_id']; ?>"></div>
        <?php if ($cosyone_product_hurry) { ?>
        <span class="hurry main_font"><?php echo $product['stock_quantity']; ?></span>
        <?php } ?>
        </div>
        </div>
    <script type="text/javascript">
    $('.<?php echo $product['product_id']; ?>').countdown({
    until: <?php echo $product['special_date_end']; ?>, 
    layout: '<span class="main_font"><?php echo $text_category_expire; ?></span><br /><i>{dn}</i> {dl}&nbsp; <i>{hn}</i>  {hl}&nbsp; <i>{mn}</i>  {ml}&nbsp; <i>{sn}</i> {sl}'});
    </script>
      <?php } ?>
      </div>
    </div><!--
    -->
      <?php } ?>
    </div>
</div>
</div>
</div>
</div>


<script type="text/javascript">
$(document).ready(function() {
  $('.product-grid._in-prod').owlCarousel({
    items: 4,
    pagination: true,
    navigation:true,
    slideSpeed:500,
    autoHeight:true,
    itemsDesktopSmall : [768, 2],
    navigationText: [
    "<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
    "<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"
    ],
    responsive:{
        0:{
            items:1
        },
        600:{
            items:2
        },
        1000:{
            items:4
        }
    }
      
  }); 
}); 
</script>

<style>
    .image_hover:hover{
        opacity: 1!important;
        transition: .7s;
    }
    .image_hover:not(:hover){
        opacity: 0!important;
        transition: .7s;
    }
    .product-layout__bage{
        position: absolute;
        top: 40px;
        right: 0px;
        width: auto!important;
        /*width: 35px;*/
    }
    .image:hover .product-layout__bage{
        opacity: 0;
        transition: .9s;
    }
    .image:not(:hover) .product-layout__bage{
        opacity: 1;
        transition: 1.5s;
    }
</style>