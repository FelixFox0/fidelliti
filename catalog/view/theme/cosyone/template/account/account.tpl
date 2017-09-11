<?php echo $header; ?>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
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
      
      <div class="acount-information">
        <div class="col-md-4 acount-information-col">
          <div class="cell-header">
            <h4>Предпочтения</h4>
          </div>
          <div class="empty-cell-description">
            <div class="acount-description">На любой странице товара щелкните «Добавить в Избранное», чтобы сохранить понравившиеся товары для последующего просмотра и покупки.
            </div>            
            <a class="acount-shop-button" href="/" title="Магазин">Магазин</a>
          </div>
        </div>
        <div class="col-md-4 acount-information-col">
          <div class="cell-header">
            <h4>Заказы</h4>
            <a href="<?php echo $order; ?>" class="account-header-link" title="Посмотреть все">Посмотреть все</a>
          </div>
          <div class="empty-cell-description">
            <div class="acount-description">Количество Ваших заказов сейчас: 0</div>
            <a class="acount-shop-button" href="/" title="Магазин">Магазин</a>
          </div>
        </div>
        <div class="col-md-4 acount-information-col">          
          <div class="cell-header">
            <h4>Данные Личного кабинета</h4>
            <a href="<?php echo $edit; ?>" class="account-header-link" title="Изменить">Изменить</a>
          </div>
          <ul class="detail-set">
            <li class="detail">
              <div class="detail-name l3">Фамилия: </div>
              <div class="detail-value l4 last-name">Вадим</div>
            </li>
            <li class="detail">
              <div class="detail-name l3">Имя: </div>
              <div class="detail-value l4 first-name">Вадим</div>
            </li>
            <li class="detail">
              <div class="detail-name l3">Страна: </div>
              <div class="detail-value l4 country">Российская Федерация</div>
            </li>
            <li class="detail">
              <div class="detail-name l3">Телефон: </div>
              <div class="detail-value l4 phone">38093123123123</div>
            </li>
            <li class="detail">
              <div class="detail-name l3">Электронная почта: </div>
              <div class="detail-value l4 email">padavan94@gmail.com</div>
            </li>
          </ul>
        </div>
      </div>


     <!-- <h3><?php echo $text_my_account; ?></h3>
      <ul class="list-unstyled margin-b">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      </ul>
      
      <?php if ($credit_cards) { ?>
      <h3><?php echo $text_credit_card; ?></h3>
      <ul class="list-unstyled margin-b">
        <?php foreach ($credit_cards as $credit_card) { ?>
        <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
        <?php } ?>
      </ul>
      <?php } ?>
      
      <h3><?php echo $text_my_orders; ?></h3>
      <ul class="list-unstyled margin-b">
        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
        <?php if ($reward) { ?>
        <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
        <?php } ?>
        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
        <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
      </ul>
      <h3><?php echo $text_my_newsletter; ?></h3>
      <ul class="list-unstyled margin-b">
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      </ul>-->
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>