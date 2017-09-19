<?php echo $header; ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/css/lightslider.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.0/css/lightgallery.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/cosyone/js/cloud-zoom.1.0.2.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.0/js/lightgallery-all.min.js"></script>


<div class="one-click mfp-hide">
  <div class="one-click__inner">
    <div class="one-click__header">
      <?php echo $text_by1click; ?>
    </div>
    <div class="one-click__body">
      <form id='one_click_form' action="" class="one-click__form">
        <div class="one-click__input" >
          <input name='name' type="text" placeholder="<?php echo $text_name; ?>">
        </div>
        <div class="one-click__input">
          <input name='phone' type="text" placeholder="<?php echo $text_phone; ?>">
        </div>
        <div class="one-click__input" >
          <input name='mail' type="text" placeholder="<?php echo $text_mail; ?>">
        </div>
        <div class="one-click__submit">
          <button type="submit" id="one_click" data-loading-text="<?php echo $text_loading; ?>" class="button"><?php echo $button_cart; ?></button>
        </div>
      </form>
    </div>
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
      <div class="product-page__image">
        <div class="product-slider" id="#imageGallery">
            <?php if ($thumb) { ?>
              <?php if ($cosyone_product_zoom) { ?>
              <li data-thumb="<?php echo $thumb; ?>" data-src="<?php echo $popup; ?>">
              <img itemprop="image" src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>

              <?php } else { ?>
              <li data-thumb="<?php echo $popup; ?>" data-src="<?php echo $popup; ?>">
              <img itemprop="image" src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
              <?php } ?>
            <?php } ?>
            <?php foreach ($images as $image) { ?>
                <li data-thumb="<?php echo $image['thumb']; ?>" data-src="<?php echo $image['popup']; ?>">
                  <img src="<?php echo $image['popup']; ?>" />
                </li>
                <?php } ?>
          </div>
      </div>
      <div class="product-page__info" id="product">
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
                    <?php if (!$cosyone_product_yousave) { ?>
                    <span class="price-old"><?php echo $price; ?></span> <span class="price-new" itemprop="price"><?php echo $special; ?></span>
                    <?php } ?>
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
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>" /></label>
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
                <a class="" onclick="wishlist.add('<?php echo $product_id; ?>');" ><i class="fa fa-heart-o"></i><?php echo $text_add_favorite; ?></a>
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
                    <?php echo $razmer; ?>
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



  
<?php if (false): ?>

  
  <div class="product-info">
    <?php if ($thumb || $images) { ?>
    <div class="left">
      <?php if ($thumb) { ?>
      <div class="image">
      
      <?php if ($cosyone_product_zoom) { ?>
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" style="cursor:move" rel="position:'inside', showTitle: false" id='zoom1'><img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
      <!-- zoom link-->
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id="zoom-btn" class="colorbox" rel="colorbox"><i class="fa fa-search-plus"></i></a>
      <?php } else { ?>
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
      <?php } ?>
      
      <?php if ($cosyone_percentage_sale_badge == 'enabled') { ?>
      <?php if (!$special) { ?>
        <?php } else { ?>
         <div class="sale_badge">-<?php echo $sales_percantage_main; ?>%</div>
        <?php } ?>
        <?php } ?>
      </div>
      
      <?php } ?>
      
      <?php if ($images) { ?>

      <div class="image-additional" style="width:<?php echo $thumb_width; ?>px; height:<?php echo $additional_height; ?>px">      
      <ul class="image_carousel">
       <!-- Additional images -->
        <?php foreach ($images as $image) { ?>
        <li>
        <?php if ($cosyone_product_zoom) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>'">
        <?php } else { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>'">
        <?php } ?>
        <img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" width="<?php echo $additional_width; ?>" height="<?php echo $additional_height; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
        <?php } ?>
        
        <!-- Show even the main image among the additional if  -->
         <?php if ($cosyone_product_zoom) { ?>
       <li><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>'"><img src="<?php echo $small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" width="<?php echo $additional_width; ?>" height="<?php echo $additional_height; ?>"/></a></li>
        <?php } ?>
        </ul>
        
      </div>
      <?php } ?>
      <?php if($cosyone_product_share == 'image'){ ?>
     <!-- AddThis Button START -->
     <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
			<a class="addthis_button_preferred_1"></a>
			<a class="addthis_button_preferred_2"></a>
			<a class="addthis_button_preferred_3"></a>
			<a class="addthis_button_preferred_4"></a>
			<a class="addthis_button_compact"></a>
            <a class="addthis_counter addthis_bubble_style"></a>
			</div>
	<!-- AddThis Button END -->
		<?php } ?>
    </div>
    <?php } ?>
   <div class="right" style="margin-<?php if ($direction == 'rtl') { echo 'right'; } else { echo 'left'; } ?>:<?php echo $thumb_width; ?>px">
      
      <h1 itemprop="name"><?php echo $heading_title; ?></h1>
      
      <?php if ($review_status) { ?>
      <div class="review">
       <span class="rating r<?php echo $rating; ?>">
       <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
       </span>
        <a class="to_review" onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>
        <a class="to_review" onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a>
        </div>
        
        <?php if ($count_reviews > 0) { ?><!-- Rich snippet start -->
        <div itemprop="review" itemscope itemtype="http://data-vocabulary.org/Review-aggregate"> 
       	<span itemprop="rating" content="<?php echo $rating; ?>"></span><span itemprop="count" content="<?php echo $reviews; ?>"></span>
      	</div> 
        <?php } ?><!-- Rich snippet end -->
        
      <?php } ?>
      
        <div class="description">
        <?php if ($manufacturer) { ?>
        <span class="contrast_font"><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>    

        <span class="contrast_font"><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        
        <?php if ($reward) { ?>
        <span class="contrast_font"><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        
        <span class="contrast_font" itemprop="availability" content="<?php if ($data_qty > 0) {echo "in_stock"; } else {echo "out_of_stock"; } ?>"><?php echo $text_stock; ?></span> <span class="stock_status <?php if ($data_qty > 0) {echo "in_stock"; } ?>"><?php echo $stock; ?></span>
        
        </div> <!-- .description ends -->
        
        <?php if ($price) { ?>
        <meta itemprop="currency" content="<?php echo $currency_code; ?>" />
        <span itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer"><!-- Rich snippets start -->
        <?php if (($special) && ($cosyone_product_yousave)) { ?>
        
        <div class="extended_offer">
        
        <div class="price-new"><?php echo $text_special_price; ?><span class="amount contrast_font" itemprop="price"><?php echo $special; ?></span></div>
        <div class="price-old"><?php echo $text_old_price; ?><span class="amount contrast_font"><?php echo $price; ?></span></div>
        <div class="price-save"><?php echo $text_you_save; ?><span class="amount contrast_font"><?php echo $yousave; ?></span> </div>
        </div>

        <?php } ?>
        
        <?php if (($special_date_end > 0) && ($cosyone_product_countdown)) { ?>
        <div class="contrast_font"><div class="offer"></div></div> 
		
        <?php if ($cosyone_product_hurry) { ?>
        <div class="hurry">
        <span class="items_left contrast_color"><?php echo $text_stock_quantity; ?></span>
        <span class="items_sold"><?php echo $text_items_sold; ?></span>
        </div>
        <?php } ?>
        <?php } ?>
        <?php } ?>
       <div id="product">
       
       <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
      <?php } ?>
       
      <?php if ($options) { ?>
      <div class="options contrast_font">
      <h2><?php echo $text_option; ?></h2>
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
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>" /></label>
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
      
      <div class="cart">
         
      <?php if ($price) { ?> 
      <div class="price">
        
        <?php if (!$special) { ?>
        <span itemprop="price"><?php echo $price; ?></span>
        <?php } else { ?>
        <?php if (!$cosyone_product_yousave) { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new" itemprop="price"><?php echo $special; ?></span>
        <?php } ?>
        <?php } ?>
          
      </div> 
     </span> <!-- rich snippet ends -->
      <?php } ?>
        
        	
          <a class="quantity_button minus icon">-</a><input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="quantity" /><a class="quantity_button plus icon">+</a>
         
          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

          <button type="submit" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="button contrast"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
          
          <button type="submit" id="one_click" data-loading-text="<?php echo $text_loading; ?>" class="button contrast"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
          
          <div class="icons_wrapper">
    <a class="sq_icon" onclick="wishlist.add('<?php echo $product_id; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
    <a class="sq_icon compare" onclick="compare.add('<?php echo $product_id; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left main_compare"></i></a>
        </div>
        
        
        
       </div> <!-- Cart ends -->
        
        <?php if ($options) { ?>
      <div class="options contrast_font">
      <h2><?php echo $text_option; ?></h2>
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
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>" /></label>
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




        <?php if ($minimum > 1) { ?>
        <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
        <?php if ($price) { ?>
      	<?php if ($points) { ?>
        <div class="reward"><?php echo $text_points; ?> <?php echo $points; ?></div>
        <?php } ?>
       <?php if ($discounts) { ?>
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <span><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php } ?>
     </div>
         
     <div class="share">
     <?php if($cosyone_product_share == 'content'){ ?>
     <!-- AddThis Button START -->
     <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
			<a class="addthis_button_preferred_1"></a>
			<a class="addthis_button_preferred_2"></a>
			<a class="addthis_button_preferred_3"></a>
			<a class="addthis_button_preferred_4"></a>
			<a class="addthis_button_compact"></a>
            <a class="addthis_counter addthis_bubble_style"></a>
			</div>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script>
<!-- AddThis Button END -->
		<?php } ?>
        <?php if ($price) { ?>
       <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
        <?php } ?>
        <?php } ?>
       </div> <!-- .share ends -->
       
    </div> <!-- product-info-right END -->

    
    </div> <!-- product-info END -->


<?php endif ?>
   
   <?php if(false): ?>
  
  <ul class="nav nav-tabs product-page">
  
	<li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
                
    <?php if ($attribute_groups) { ?>
    <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
    <?php } ?>
   
    <?php if ($review_status) { ?>
    <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
    <?php } ?>
    
    
    <?php if ($product_tabs_5) { ?>
	<?php foreach($product_tabs_5 as $product_tab_5) { ?>
	<li><a href="#tab-product-tab<?php echo $product_tab_5['tab_id'];?>" data-toggle="tab"><?php echo $product_tab_5['name']; ?></a></li>
	<?php } ?>
	<?php } ?>
    

  </ul>
  
  <div class="tab-content">
  
  <div class="tab-pane active" id="tab-description"><?php echo $description; ?>
      <?php echo $sku; ?>
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
  
  <?php if ($review_status) { ?>
  <div class="tab-pane" id="tab-review">
    <form id="form-review" class="form-horizontal">
    <div id="review"></div>
    <div class="write_review contrast_font">
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    
    
    <?php if ($review_guest) { ?>
   
   <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
    
    <div class="form-group required">
    <div class="col-sm-12">
    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
    <textarea name="text" id="input-review" rows="8" style="width: 100%;"></textarea>
    <small><?php echo $text_note; ?></small>
    </div>
    </div>
    
    <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <span class="main_font"><?php echo $entry_bad; ?></span>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<span class="main_font"><?php echo $entry_good; ?></span>
                    </div>
                </div>
         		
                <?php if ((float)VERSION >= 2.1) { ?>
        			<div class="vertical-captcha"><?php echo $captcha; ?></div>
                	<div class="col-sm-12 text-right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
                    <div class="clearfix"></div>
        		<?php } else { ?>
                    <div class="form-group">
                    <div class="col-sm-6">
                    <?php if ($site_key) { ?>
                    <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                    <?php } ?>
                    </div>
                    <div class="col-sm-6"><a id="button-review" class="button pull-right"><?php echo $button_continue; ?></a></div>
                    </div>
                <?php } ?>
                
                </div>
                
                <?php } else { ?>
                <div class="alert alert-info main_font"><?php echo $text_login; ?></div>
                </div>
                <?php } ?>
                </form>
                </div>
                
                <?php } ?>

  <?php if ($product_tabs_5) { ?>
	<?php foreach($product_tabs_5 as $product_tab_5) { ?>
    <div class="tab-pane" id="tab-product-tab<?php echo $product_tab_5['tab_id'];?>">
	<?php echo $product_tab_5['text']; ?>
    </div>
	<?php } ?>
  <?php } ?>
  
  </div>

<?php endif; ?>
  
   
      
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
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
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
    <a class="sq_icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a><a class="sq_icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>
    <?php if ($cosyone_text_ql) { ?>
    <a href="<?php echo $product['quickview']; ?>" rel="nofollow" class="sq_icon qlook quickview" data-tooltip="<?php echo $cosyone_text_ql; ?>"><i class="fa fa-eye"></i></a>
    <?php } ?>
    <a class="sq_icon contrast add_to_cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" data-tooltip="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a>
    <a class="plain_link wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
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
		url: 'index.php?route=product/product/getRecurringDescription',
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
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
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
        
        $('#cart').load('index.php?route=common/cart/info #cart > *'); //Added
        $("#cart-panel .mm-panels > *").load('index.php?route=common/cart/info #cart > *');

				if($(window).innerWidth() > 991) {
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
              src: '<div class="white-popup _new"><div class="product"><h3 class="white-popup__title"><?php echo $text_add_cart; ?></h3><span>' + json['success'] + '</span></div><div class="bottom"><a class="button" href="' + json['link_cart'] + '">' + json['text_cart'] + '</a> ' + '<a class="button" href="' + json['link_checkout'] + '">' + json['text_checkout'] + '</a></div></div>',
              type: 'inline'
            }
          });

          $('#cart').load('index.php?route=common/cart/info #cart > *'); //Added
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
				url: 'index.php?route=tool/upload',
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

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
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
$('#one_click').on('click', function(e) {
        e.preventDefault();
	$.ajax({
		url: 'index.php?route=product/product/oneclickbye&product_id=<?php echo $product_id; ?>',
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
});


if($(window).innerWidth() >= 991) {

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
                  selector: '.product-slider .lslide'
              });
          },
          responsive : [
            {
                breakpoint:800,
                settings: {
                    item:1,
                    vertical: false,
                    pager: false
                  }
            },
            {
                breakpoint:480,
                settings: {
                    item:1,
                    vertical: false,
                    pager: false
                  }
            }
        ] 
          });  


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