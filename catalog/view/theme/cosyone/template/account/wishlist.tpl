<?php echo $header; ?>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="page-banner-asset-cell" id="banner-asset">
         <div class="cell-placeholder-1-5 js-asset-item asset-loaded asset-visible">
            <div class="cell-asset-bg js-asset-container" data-type="image">
              <h1 class="page-banner-asset-title h1"><?php echo $text_my_account_sp; ?></h1>
            </div>
        </div>
      </div>

      <div class="account-header  my-container sp-container">
        <div class="account-welcome">
          <span class="h2"><?php echo $heading_hello; ?></span>
          <a href="#" title="<?php echo $heading_logout; ?>" class="account-logout"><?php echo $heading_logout; ?></a>
        </div>
        <div class="account-heading_text"><?php echo $heading_text; ?></div>
      </div>

      <div class="account-menu">
         <ul>
            <li>
              <a href="http://fidelliti/au/ukr/edit-account">Обзор</a>
            </li>
            <li>
              <a href="<?php echo $wishlist; ?>">Предпочтения</a>
            </li>
            <li>
              <a href="<?php echo $order; ?>">Заказы</a>
            </li>
            <li>
              <a href="<?php echo $edit; ?>">Данные личного кабинета</a>
            </li>
          </ul>
      </div>
      
      <div class="acount-information acount-information-wishlist">
        <div class="col-md-4 acount-information-col acount-information-col-wish">          
          <div class="cell-header">
            <h4><?php echo $text_account_start; ?></h4>
          </div>

      <?php if ($products) { ?>
      <div class="cart-info margin-b">
    <table class="contrast_font">
      <thead>
        <tr>
          <td class="image mobile_hide"><?php echo $column_image; ?></td>
          <td class="name"><?php echo $column_name; ?></td>
          <td class="model mobile_hide"><?php echo $column_model; ?></td>
          <td class="stock mobile_hide"><?php echo $column_stock; ?></td>
          <td class="price mobile_hide"><?php echo $column_price; ?></td>
          <td class="action"><?php echo $column_action; ?></td>
        </tr>
      </thead>
      <tbody>
      <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image mobile_hide"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="name">
          <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <div class="desktop_hide">
          <div class="up_to_mobile">
          <small><?php echo $column_model; ?>: <?php echo $product['model']; ?></small>
          <small><?php echo $column_stock; ?>: <?php echo $product['stock']; ?></small>
          <?php if ($product['price']) { ?>
              <?php if (!$product['special']) { ?>
              <small><?php echo $column_price; ?>: <?php echo $product['price']; ?></small><br />
              <?php } else { ?>
              <small><?php echo $column_price; ?>: <s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b></small><br />
              <?php } ?>
            <?php } ?>
            </div>
          </div>
          </td>
          <td class="model mobile_hide"><?php echo $product['model']; ?></td>
          <td class="stock mobile_hide"><?php echo $product['stock']; ?></td>
          <td class="price mobile_hide"><?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['special']; ?></span> <span class="price"><?php echo $product['price']; ?></span> 
              <?php } ?>
            </div>
            <?php } ?></td>
          <td class="action">
          <a onclick="cart.add('<?php echo $product['product_id']; ?>')" class="button contrast"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></a>
          <a href="<?php echo $product['remove']; ?>" class="button remove"><i class="fa fa-times"></i> <?php echo $button_remove; ?></a>
        </tr>
      </tbody>
      <?php } ?>
    </table>
  </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-center">
          <a href="<?php echo $continue; ?>" class="btn btn-primary login-form-button"><?php echo $button_continue_wish; ?></a>
        </div>
      </div>

        </div>
      </div>




      <!--<h1><?php echo $heading_title; ?></h1>-->

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 