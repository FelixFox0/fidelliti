<?php echo $header; ?>
<div class="container">
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
        <div class="col-md-4 edit-col-menu">          
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


        <div class="col-md-8 acount-information-col acount-information-col-edit acount-information-col-edit">          
          <div class="cell-header">
              <div class="edit-details"><?php echo $pass_discription; ?></div>
              <div class="pull-left"><h4><?php echo $heading_title_pass; ?></h4></div>
              <div class="pull-right"><?php echo $row_require; ?></div>
              
          </div>
          <div class="pass-container">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <fieldset>
                
                  <div class="row col-sm-6">
                        <div class="form-group required">
                            <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                            <?php if ($error_password) { ?>
                            <div class="text-danger"><?php echo $error_password; ?></div>
                            <?php } ?>
                        </div>
                        <div class="form-group required">
                            <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                            <?php if ($error_confirm) { ?>
                            <div class="text-danger"><?php echo $error_confirm; ?></div>
                            <?php } ?>
                        </div>
                  </div>
                
              </fieldset>
              <div class="buttons clearfix">
                <div class="pull-left"><input type="submit" value="<?php echo $button_save; ?>" class="btn btn-primary  login-form-button" /></div>
                <div class="pull-right">
                   <a href="<?php echo $back; ?>" class="btn btn-default login-form-button"><?php echo $button_nosave; ?></a>
                </div>
              </div>

            </form>
          </div>
       </div>
      </div>




      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
 $('document').ready(function() {
    $('.account-top-menu a').each(function() {
        if ('http://site.ru'+$(this).attr('href') == window.location.href)
        {
            $(this).addClass('active');
        }
    });
});
 </script>
<?php echo $footer; ?>  