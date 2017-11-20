<?php echo $header; ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/css/lightslider.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.0/css/lightgallery.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.min.js"></script>
<script type="text/javascript" src="/catalog/view/theme/cosyone/js/cloud-zoom.1.0.2.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.0/js/lightgallery-all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-zoom/1.7.20/jquery.zoom.min.js"></script>


<?php if ($label) { ?>
<style>
    .owl-item:first-child li span:last-child{
        position: static !important;
    }
</style>
<?php } ?>  
<style>
    .lightSlider>li>img{
        max-width: 417px;
    }
    
    
    
    
    .product-page__image{
        max-width: 750px;
        margin: 0 auto;
    }
    
    .product-page__image__min{
        width: 100px;
    }
    .product-page__image__min__fix{
        width: 100px;
        position: fixed;
    }
    
    .product-page__info {
        margin-left: 0px;
        position: fixed;
        overflow: scroll;
        height: 730px;
    }
    
    .product-page__info__fix{
        width: 320px;
    }
    
    .product-page__info::-webkit-scrollbar { 
        display: none; 
    }
    
    .popup a:hover{
        cursor: crosshair;
    }
    
    #desctop_popup{
        width: 100%;
        position: fixed;
        top: 0;
        z-index: 9999;
        display: none;
        overflow: auto;
        cursor: zoom-out;
    }
    
    #desctop_popup img{
        width: 100%;
    }
</style>

<div id="desctop_popup">
    
</div>

<div class="one-click mfp-hide">
  <div class="one-click__inner">
    <div class="one-click__header">
      <?php echo $text_by1click; ?>
    </div>
    <div class="one-click__body">
      <form id='one_click_form' method="get" action="" class="one-click__form">
        <div class="one-click__input" >
          <input name='name' type="text" placeholder="<?php echo $text_name; ?>" required>
        </div>
        <div class="one-click__input">
          <input name='phone' type="phone" placeholder="<?php echo $text_phone; ?>" required>
        </div>
        <div class="one-click__input" >
          <input name='mail' type="email" placeholder="<?php echo $text_mail; ?>" required>
        </div>
        <div class="one-click__submit">

          <input id="one_click" class="button" type="submit" data-loading-text="<?php echo $text_loading; ?>" value="<?php echo $button_cart; ?>">
        </div>
      </form>
    </div>

    <!-- Тут можно найти как добавить переводы, https://jqueryvalidation.org/documentation/ -->
    <script>
      $("#one_click_form").validate({
        submitHandler: function(form) {
          $.ajax({
            url: '/index.php?route=product/product/oneclickbye&product_id=<?php echo $product_id; ?>',
            type: 'post',
            data: $('#one_click_form').serialize(),
            dataType: 'json',
            beforeSend: function() {
              
            },
            complete: function() {
              
            },
            success: function(json) {     
              if (json['success']) {
                location = json['success'];
                //alert("Ваш заказ получен"); 
              }else{
                  alert("Ваш заказ не получен");
              }
            }
          });
        }
       });
    </script>
    <div class="one-click__footer">
      <div><?php echo $text_prod; ?><b><?php echo $heading_title; ?></b></div>
              <div><?php echo $text_price; ?><b>
          
        <?php if ($price) { ?>
        <?php if ($special) { ?>
        <?php echo $special; ?>

       
        <?php }else{ ?>
        <?php echo $price; ?>
        <?php } ?>
           <?php } ?>           
          </b></div>
    </div>
  </div>
</div>



<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>
   <div class="row"><?php echo $column_left; ?>
   <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
<div id="content" class="<?php echo $class; ?> product" itemscope itemtype="http://data-vocabulary.org/Product">
  

  
  <div class="product-page _top">
      
    <div class="container">
      <div class="product-page__container">
          <div class="product-page__image__min">
              <div class="product-page__image__min__fix">
              <?php if ($thumb) { ?>
              <?php if ($cosyone_product_zoom) { ?>
              <a href="<?php // echo $href; ?>#product_top">
              <div data-thumb="<?php echo $thumb; ?>" data-src="<?php echo $popup_big; ?>">
                  
                <img itemprop="image" src="<?php echo $popup_big; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $meta_title; ?>" />
              </div>
              </a>
              <?php } else { ?>
              <li data-thumb="<?php echo $popup_big; ?>" data-src="<?php echo $popup_big; ?>">
                <img itemprop="image" src="<?php echo $popup_big; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $meta_title; ?>" />

              </li>
              <?php } ?>
            <?php } ?>
            <?php foreach ($images as $key=>$image) { ?>
                <!--<a href="<?php echo $href . '#product' . $key; ?>">-->
                <a href="<?php echo '#product' . $key; ?>">
                    <div  data-thumb="<?php echo $image['thumb']; ?>" data-src="<?php echo $image['popup_big']; ?>">

                        <img src="<?php echo $image['popup_big']; ?>" alt="<?php echo $meta_title; ?>" />
                    </div>
                </a>
                <?php } ?>
              </div>
          </div>
          <div class="product-page__image" style="width: auto;">

            
            <?php if ($thumb) { ?>
              <?php if ($cosyone_product_zoom) { ?>
              <div id="product_top" class="popup" data-thumb="<?php echo $thumb; ?>" data-src="<?php echo $popup; ?>">
                <a href="<?php echo $popup_orig; ?>"><img itemprop="image" src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $meta_title; ?>" /></a>
                <?php if ($label) { ?>
                    <img src="<?php echo $label['label_image']; ?>" alt="<?php echo $label['label_name']; ?>" class="product-layout__bage">
                <?php } ?>  
              </div>

              <?php } else { ?>
              <li data-thumb="<?php echo $popup; ?>" data-src="<?php echo $popup; ?>">
                <img itemprop="image" src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $meta_title; ?>" />

              </li>
              <?php } ?>
            <?php } ?>
            <?php foreach ($images as $key=>$image) { ?>
                <div id="product<?php echo $key; ?>" class="popup" data-thumb="<?php echo $image['thumb']; ?>" data-src="<?php echo $image['popup']; ?>">

                  <a href="<?php echo $image['popup_orig']; ?>"><img src="<?php echo $image['popup']; ?>" alt="<?php echo $meta_title; ?>" /></a>
                </div>
                <?php } ?>

          
      </div>
      <div class="product-page__info__fix">
          <div class="product-page__info"  id="product">
          
            <div class="product-page__title">
              <h1 itemprop="name"><?php echo $heading_title; ?></h1>
            </div>
            <div class="product-page__price">
              <div class="cart">
         
                  <?php if ($price) { ?> 
                  <div class="price">
                    
                    <?php if (!$special) { ?>
                    <span itemprop="price"><?php echo $price; ?></span>
                    <?php } else { ?>
                        <?php //if (!$cosyone_product_yousave) { ?>
                        <span class="price-old"><?php echo $price; ?></span> <span class="price-new" itemprop="price"><?php echo $special; ?></span>
                        <?php //} ?>
                    <?php } ?>
                      
                  </div> 
                  <div class="product-page__options">
              <?php if ($options) { ?>
      <div class="options contrast_font">
        <?php foreach ($options as $option) { ?>
                
        <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
        
        <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <i>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                    </i>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
        
        <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
    
        
            
         <?php if ($option['type'] == 'image') { ?>
         <?php if($cosyone_image_options == 'thumbs'){ ?>
         <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
         <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
         <div id="input-option<?php echo $option['product_option_id']; ?>" class="clean-option-image">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <div class="single-option main_font" <?php if ($option_value['price']) { ?>data-tooltip="<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>"<?php } ?>>
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $meta_title; ?>" /></label>
                </div>
            <?php } ?>
          </div>
          </div>
         <?php } else { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php } ?>
        
        <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            
        <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label><br />
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="button"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
         <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
        <?php } ?>
      </div> <!-- .options ends -->
      <?php } ?> 
            </div>
                  <span class="stockk">
                  <span class=" <?php if ($data_qty > 0) {echo "in_stock"; } ?>"><?php echo $stock; ?></span>
                 </span> <!-- rich snippet ends -->
                 </span>
                  <?php } ?>
                     
                      <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

                      <button type="submit" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="button contrast"><?php echo $button_cart; ?></button>

                      <button class="button contrast open-popup" data-mfp-src=".one-click"><?php echo $text_by1cl; ?></button>
                      
                      
                      
                      <div class="icons_wrapper">
                <a class ="wishlistTrigger"  onclick="wishlist.add('<?php echo $product_id; ?>');" ><i class="fa fa-heart-o wishlistTrigger"></i><?php echo $text_add_favorite; ?></a>
                <a href="#"><?php echo $text_delivery; ?></a>
    
                    </div>
                    
                    
                    
                   </div> <!-- Cart ends -->
            </div>

            <div class="panel-group footer-mobile second visible-xs" id="accordion2">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion2" href="#collapse11">
                    <?php echo $tab_description; ?></a>
                  </h4>
                </div>
                <div id="collapse11" class="panel-collapse collapse in">
                  <div class="panel-body">
                    <?php echo $description; ?>
                     <?php echo $text_sku; ?><?php echo $sku; ?>
                      <?php if ($tags) { ?>
                      <div class="tags">
                        <?php for ($i = 0; $i < count($tags); $i++) { ?>
                        <?php if ($i < (count($tags) - 1)) { ?>
                        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                        <?php } else { ?>
                        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                        <?php } ?>
                        <?php } ?>
                      </div>
                      <?php } ?>
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion2" href="#collapse22">
                    <?php echo $text_detali; ?></a>
                  </h4>
                </div>
                <div id="collapse22" class="panel-collapse collapse">
                  <div class="panel-body">
                    <?php echo $detali; ?>
                    <table class="attribute">
                      <?php foreach ($attribute_groups as $attribute_group) { ?>
                      <thead>
                        <tr>
                          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        <tr>
                          <td><?php echo $attribute['name']; ?></td>
                          <td><?php echo $attribute['text']; ?></td>
                        </tr>
                        <?php } ?>
                      </tbody>
                      <?php } ?>
                    </table>
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion2" href="#collapse33">
                    <?php echo $text_size; ?></a>
                  </h4>
                </div>
                <div id="collapse33" class="panel-collapse collapse">
                  <div class="panel-body">
                    <?php //echo $razmer; ?>
                    <?php echo $text_size; ?>: <?php echo $size; ?></a>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="product-page__tabs hidden-xs">
              <ul class="nav nav-tabs product-page">
                <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
                
                
                <?php if ($attribute_groups) { ?>
                    <!--<li class=""><a href="#tab-detail" data-toggle="tab"><?php echo $text_detali; ?></a></li>-->
                    <li><a href="#tab-specification" data-toggle="tab"><?php echo $text_detali; ?></a></li>
                <?php } ?>
                <li class=""><a href="#tab-size" data-toggle="tab"><?php echo $text_size; ?></a></li>             
              </ul>
                  
                  <div class="tab-content">
                  
                  <div class="tab-pane active" id="tab-description"><?php echo $description; ?>
                      <?php echo $text_sku; ?><?php echo $sku; ?>
                  <?php if ($tags) { ?>
                  <div class="tags">
                    <?php for ($i = 0; $i < count($tags); $i++) { ?>
                    <?php if ($i < (count($tags) - 1)) { ?>
                    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                    <?php } else { ?>
                    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                    <?php } ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                  </div>
                      
                      
                        <?php if ($attribute_groups) { ?>
                        <div class="tab-pane" id="tab-specification">
                          <table class="attribute">
                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                            <thead>
                              <tr>
                                <td colspan="2"><?php echo $attribute_group['name']; ?></td>
                              </tr>
                            </thead>
                            <tbody>
                              <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                              <tr>
                                <td><?php echo $attribute['name']; ?></td>
                                <td><?php echo $attribute['text']; ?></td>
                              </tr>
                              <?php } ?>
                            </tbody>
                            <?php } ?>
                          </table>
                        </div>
                        <?php } ?>
                      

                  <div class="tab-pane" id="tab-detail">
                      <?php echo $detali; ?>
                  </div>

                  <div class="tab-pane" id="tab-size">
                      <?php //echo $razmer; ?>
                      <?php echo $text_size; ?>: <?php echo $size; ?></a>
                  </div>
                </div>
            </div>

           </div> 
          </div>
        </div>
    </div>
  </div>



       
  	<?php if ($products) { ?>
  	<div class="box products">
  	<div class="box-heading products"><?php echo $text_related; ?></div>
    <div class="<?php echo $cosyone_grid_related; ?>">
    <div class="grid_holder">
    <div class="product-grid carousel related">
      <?php foreach ($products as $product) { ?>
      <div class="item contrast_font">
        <div class="image">
        <?php if ($product['special'] && $cosyone_percentage_sale_badge == 'enabled') { ?>
         <div class="sale_badge">-<?php echo $product['sales_percantage']; ?>%</div>
	    <?php } ?>
        <?php if ($product['thumb']) { ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $meta_title; ?>" /></a>
        <?php } ?>
        
        <?php if ($cosyone_text_ql) { ?>
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
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="cart">       
      <button type="submit" class="button contrast" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" ><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
    </div>  
        <div class="icons_wrapper">
    <a class="sq_icon wishlistTrigger" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="wishlistTrigger fa fa-heart"></i></a><a class="sq_icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>
    <?php if ($cosyone_text_ql) { ?>
    <a href="<?php echo $product['quickview']; ?>" rel="nofollow" class="sq_icon qlook quickview" data-tooltip="<?php echo $cosyone_text_ql; ?>"><i class="fa fa-eye"></i></a>
    <?php } ?>
    <a class="sq_icon contrast add_to_cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" data-tooltip="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a>
    <a class="plain_link wishlist wishlistTrigger" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
    <a class="plain_link compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
        </div>
        </div>
      </div>
      <?php } ?>
    </div>
    </div>
    </div>
    </div>
  <?php } ?>
  
  
  <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>

<script>
$(document).ready(function() {
    $('.product-page__image__min__fix').css('height', $(window).height() - 50);
    $('.product-page__info').css('height', $(window).height() + 50);
    
    $('.popup img').css('max-height', $(window).height() - $('#product_top').offset().top);
    
    $('#desctop_popup').css('height', $(window).height());
    
});

$( ".product-page__image__min__fix a" ).click(function (e) {
    e.preventDefault();
    
    var id  = $(this).attr('href');

    //узнаем высоту от начала страницы до блока на который ссылается якорь
    var top = $(id).offset().top - 75;
    //console.log($(id).offset().top);

    //анимируем переход на расстояние - top за 1500 мс
    $('body,html').animate({scrollTop: top}, 700);
    
});

$( ".popup a" ).click(function (e) {
    e.preventDefault();
    $('#desctop_popup').html('<img src="' + $(this).attr('href') + '">');
    $('#desctop_popup').css('display', 'block');
    $('body').css('overflow-y', 'hidden');
    
    
    $( "#desctop_popup" ).scrollTop($("#desctop_popup img").height()/2 - $(window).height()/2);
    //console.log(this);
});
    
$( "#desctop_popup" ).click(function (e) {
    $('#desctop_popup').css('display', 'none');
    $('body').css('overflow-y', 'auto');
});
     
     
$( window ).scroll(function() {
    //console.log(($(window).scrollTop()));
    if($( window ).scrollTop()<170){
        $('.product-page__info').css('top', 'auto');
        $('.product-page__image__min__fix').css('top', 'auto');
        $('.product-page__info').css('position', 'relative');
        $('.product-page__image__min__fix').css('position', 'relative');
        $('.product-page__info').css('bottom', 'auto');
        $('.product-page__image__min__fix').css('bottom', 'auto');
    }else if( ($( window ).scrollTop() >= 170) && (($(document).height() - $(window).scrollTop() - $(window).height()) > 1170) ){
        $('.product-page__info').css('top', '50px');
        $('.product-page__image__min__fix').css('top', '50px');
        $('.product-page__info').css('position', 'fixed');
        $('.product-page__image__min__fix').css('position', 'fixed');
    }else{
        $('.product-page__info').css('bottom', '0px');
        $('.product-page__info').css('position', 'absolute');
        $('.product-page__image__min__fix').css('bottom', '0px');
        $('.product-page__image__min__fix').css('position', 'absolute');
        
        $('.product-page__info').css('top', 'auto');
        $('.product-page__image__min__fix').css('top', 'auto');
     }
});




</script>

<script type="text/javascript"><!--
$(document).ready(function() {
   $('.colorbox').colorbox({
      overlayClose: true,
	  maxWidth:'95%',
	  rel:'gallery',
      opacity: 0.5
}); 
});
//--></script>
<script type="text/javascript">
        jQuery(function($) {
			//Product thumbnails
			$(".cloud-zoom-gallery").last().removeClass("cboxElement");
			$(".cloud-zoom-gallery").click(function() {
				$("#zoom-btn").attr('href', $(this).attr('href'));
				$("#zoom-btn").attr('title', $(this).attr('title'));
			
						$(".cloud-zoom-gallery").each(function() {
						$(this).addClass("cboxElement");
					});
					$(this).removeClass("cboxElement");
							});
            
        });
</script>
<script type="text/javascript">
$(document).ready(function() {
var owlAdditionals = $('.image_carousel');
var wrapperWidth = $(".image-additional").width();
var itemWidth = (<?php echo $additional_width; ?> + 10);
var itemcalc = Math.round(wrapperWidth / itemWidth);
owlAdditionals.owlCarousel({
items : itemcalc,
mouseDrag: true,
responsive:false,
pagination: false,
navigation:true,
slideSpeed:200,
navigationText: [
"<div class='slide_arrow_prev add_img'><i class='fa fa-angle-left'></i></div>",
"<div class='slide_arrow_next add_img'><i class='fa fa-angle-right'></i></div>"
]
});
});
</script>
<script type="text/javascript">
$(document).ready(function() {
var grid5 = 5;
var grid4 = 4;
var grid3 = 3;
var owlRelated = $('.product-grid.related.carousel');
owlRelated.owlCarousel({
itemsCustom: [ [0, 1], [350, 2], [550, 3], [1025, <?php echo $cosyone_grid_related; ?>]],
pagination: false,
navigation:true,
slideSpeed:500,
scrollPerPage:false,
navigationText: [
"<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
"<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"]
}); 
});
</script>
<script type="text/javascript">
$('.quantity_button.plus').on('click', function(){
        var oldVal = $('input.quantity').val();
        var newVal = (parseInt($('input.quantity').val(),10) +1);
      $('input.quantity').val(newVal);
    });

    $('.quantity_button.minus').on('click', function(){
        var oldVal = $('input.quantity').val();
        if (oldVal > 1)
        {
            var newVal = (parseInt($('input.quantity').val(),10) -1);
        }
        else
        {
            newVal = 1;
        }
        $('input.quantity').val(newVal);
    });
</script>
<?php if ($special_date_end > 0) { ?>

<script type="text/javascript">
	$('.offer').countdown({
		until: <?php echo $special_date_end ?>, 
		layout: '{desc}<i>{dn}</i> {dl} <i>{hn}</i> {hl} <i>{mn}</i> {ml} <i>{sn}</i> {sl}',
		description: '<span class="main_font"><?php echo $text_expire ?></span>&nbsp;'
		});
</script>
<?php } ?>
<script type="text/javascript">
$(".to_review").click(function() {
    $('html, body').animate({
        scrollTop: $("#tab-review").offset().top
    }, 1000);
});
</script>

<!-- Default scrips below -->    
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: '/index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
    
    
    <script type="text/javascript"><!--
    $('#lg-zoom-in').on('click', function() {
    //console.log('azazaza');
    
    });
    //--></script> 
    
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: '/index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {

        $(".shortcut #cart-total").html(json['total']);
        $('#cart-total').html(json['total']);
        
        $('#cart').load('/index.php?route=common/cart/info #cart > *'); //Added
        $("#cart-panel .mm-panels > *").load('index.php?route=common/cart/info #cart > *');

				if($(window).innerWidth() > 1100) {
          /*$.colorbox({
            html:'<div class="cart_notification"><div class="product"><img src="' + json['image'] + '"/><span>' + json['success'] + '</span></div><div class="bottom"><a class="button contrast" href="' + json['link_cart'] + '">' + json['text_cart'] + '</a> ' + '<a class="button" href="' + json['link_checkout'] + '">' + json['text_checkout'] + '</a></div></div>',
            className: "notification",
            initialHeight:50,
            initialWidth:50,
            width:"90%",
            maxWidth:400,
            height:"90%",
            maxHeight:200
            });*/
            $.magnificPopup.open({
            items: {
              src: '<div class="white-popup _new"><div class="product"><h3 class="white-popup__title"><?php echo $text_add_cart; ?></h3><span>' + json['success'] + '</span></div><div class="bottom"><a class="button" onclick="$.magnificPopup.close();return false;" href="' + json['link_cart'] + '">' + json['text_cart'] + '</a> ' + '<a class="button" href="' + json['link_checkout'] + '">' + json['text_checkout'] + '</a></div></div>',
              type: 'inline'
            }
          });

          $('#cart').load('/index.php?route=common/cart/info #cart > *'); //Added
        } else {
          var API2 = $("#cart-panel").data( "mmenu" );
          API2.open();
        }
 				 
			   

        
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: '/index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('/index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: '/index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});
//--></script>



<script type="text/javascript">

if($(window).innerWidth() >= 1100) {
/*
$('.product-slider').lightSlider({
          gallery:true,
          item:1,
          vertical:true,
          verticalHeight:706,
          vThumbWidth:130,
          thumbItem:5,
          thumbMargin:4,
          slideMargin:0,
          enableDrag: false,
          currentPagerPosition:'left',
          prevHtml: '<i class="fa fa-angle-double-up" aria-hidden="true"></i>',
          nextHtml: '<i class="fa fa-angle-double-down" aria-hidden="true"></i>',
            onSliderLoad: function(el) {
              el.lightGallery({
                  selector: '.product-slider .lslide',
              });
          },
          responsive : [
            {
                breakpoint:800,
                settings: {
                    item:2,
                    vertical: false,
                    pager: false
                  }
            },
            {
                breakpoint:480,
                settings: {
                    item:2,
                    vertical: false,
                    pager: false
                  }
            }
        ] 
          });  

*/
} else {
  $('.product-slider').owlCarousel({
  items : 1,
  mouseDrag: true,
  responsive:false,
  pagination: true,
  navigation:false,
});

}
 
</script> 




<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script>
</div>
<?php echo $footer; ?>