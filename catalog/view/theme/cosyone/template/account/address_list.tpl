<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
          <a href="<?php echo $logout; ?>" title="<?php echo $heading_logout; ?>" class="account-logout"><?php echo $heading_logout; ?></a>
        </div>
        <div class="account-heading_text"><?php echo $heading_text; ?></div>
      </div>

      <div class="account-menu">
         <ul class="account-top-menu">
            <li>
              <a href="<?php echo $account; ?>"><?php echo $menu_account; ?></a>
            </li>
            <li>
              <a href="<?php echo $wishlist; ?>"><?php echo $menu_wishlist; ?></a>
            </li>
            <li>
              <a href="<?php echo $order; ?>"><?php echo $menu_order; ?></a>
            </li>
            <li>
              <a href="<?php echo $edit; ?>"><?php echo $menu_edit; ?></a>
            </li>
          </ul>
      </div>
      
      <div class="acount-information acount-information-edit">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 edit-col-menu">          
          <ul class="section-edit">
            <li class="section">
              <a href="<?php echo $edit; ?>" class="cta3 add-smooth-underline">
                Сведения о Личном кабинете</a>
            </li>
            <li class="section">
              <a href="<?php echo $add; ?>" class="cta3 add-smooth-underline">
                Адресная Книга</a>
            </li>
            <li class="section">
              <a href="<?php echo $newsletter; ?>" class="cta3 add-smooth-underline">
                НАСТРОЙКИ ЭЛЕКТРОННОЙ ПОЧТЫ</a>
            </li>
          </ul>

      
      </div>
        
        
        
        
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 acount-information-col acount-information-col-edit acount-information-col-edit">  
      <h4><?php echo $text_address_book; ?></h4>
      <?php if ($addresses) { ?>
      <div class="cart-info margin-b">
     
        <?php foreach ($addresses as $result) { ?>
     
          <div class="text-left"><?php echo $result['address']; ?></div>
          <div class="text-right">
          <a href="<?php echo $result['update']; ?>" class="sq_icon" data-tooltip="<?php echo $button_edit; ?>"><i class="fa fa-pencil"></i></a><a href="<?php echo $result['delete']; ?>" class="sq_icon" data-tooltip="<?php echo $button_delete; ?>"><i class="fa fa-times"></i></a>
          </div>
       
        <?php } ?>
      </table
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="button contrast"><?php echo $button_back; ?></a></div>
        <div class="pull-right"><a href="<?php echo $add; ?>" class="button"><?php echo $button_new_address; ?></a></div>
      </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
    
    </div>
</div>
<?php echo $footer; ?>