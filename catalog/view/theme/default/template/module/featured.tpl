<?php if(false){ ?>
<h3><?php echo $heading_title; ?></h3>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>

<?php } ?>


<div class="fid-collections">
  <div class="container">
      <h3 style="text-align: center; font-weight: 700;"><?php echo $heading_title; ?></h3>
    <div class="fid-collections__items product-grid">
        
      <?php foreach ($products as $product) { ?>
      <div class="fid-collections__item product-layout">
        <div class="fid-collections__item-img image">
         <!--<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt=""></a>-->
          
          <?php if ($product['thumb_hover']) { ?>
        <div class="image_hover" style="display: block; opacity: 0;"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb_hover']; ?>" alt="" /></a></div>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="" /></a>
        <?php } elseif ($product['thumb']) { ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="" /></a>
        <?php } ?>
        
        <?php if ($product['label']) { ?>
            <img src="<?php echo $product['label']['label_image']; ?>" alt="<?php echo $product['label']['label_name']; ?>" class="product-layout__bage">
        <?php } ?>  
        </div>
        
          
        <!--<div class="fid-collections__item-articul">
          <?php echo $product['model']; ?>
        </div>-->
          
          <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new" style="color: #962d35;"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
          
        <div class="fid-collections__item-name">
          <?php echo $product['name']; ?>
        </div>
        <div class="fid-collections__item-show">
            <a href="javascript:void(0)" onclick="cart.add('<?php echo $product['product_id']; ?>');" style="font-size: 12px; font-family: pt-medium;"><?php echo $button_cart; ?></a>
        </div>
      </div>
      <?php } ?>
        
        
    </div>
  </div>
  
</div>

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