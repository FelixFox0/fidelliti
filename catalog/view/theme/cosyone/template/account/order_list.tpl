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
      <!-- Ошибки в меню -->
         <ul class="account-top-menu">
            <li>
              <a href="<?php echo $account; ?>">Обзор</a>
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
      
      <div class="acount-information">
        <div class="col-md-8 acount-information-col acount-information-col-order">          
          <div class="cell-header">
            <h4><?php echo $heading_title; ?></h4>
          </div>
              <?php if ($orders) { ?>
      <?php foreach ($orders as $order) { ?>
      <table class="compare-info">
      <tbody>
         <tr>
         <td class="contrast_font history"><?php echo $column_order_id; ?></td>
         <td class="contrast_font">#<?php echo $order['order_id']; ?></td>
        </tr>
        <tr>
         <td class="contrast_font history"><?php echo $column_status; ?></td>
         <td class="contrast_font"><?php echo $order['status']; ?></td>
        </tr>
        <tr>
         <td class="contrast_font history"><?php echo $column_date_added; ?></td>
         <td class="contrast_font"><?php echo $order['date_added']; ?></td>
        </tr>
        <tr>
         <td class="contrast_font history"><?php echo $column_product; ?></td>
         <td class="contrast_font"><?php echo $order['products']; ?></td>
        </tr>
        <tr>
         <td class="contrast_font history"><?php echo $column_customer; ?></td>
         <td class="contrast_font"><?php echo $order['name']; ?></td>
        </tr>
        <tr>
         <td class="contrast_font history"><?php echo $column_total; ?></td>
         <td class="contrast_font"><span class="price"><?php echo $order['total']; ?></span></td>
        </tr>
        <tr>
         <td colspan="2" class="white_back">
         <a class="button contrast" href="<?php echo $order['href']; ?>"><?php echo $button_view; ?></a>
      </td>
        </tr>
      </tbody>
     </table>
     <?php } ?>
        <div class="text-right"><?php echo $pagination; ?></div>
        <?php } else { ?>
        <p><?php echo $text_empty; ?></p>
        <?php } ?>
        <!-- Тут добавить количество товаров  -->
        <p><?php echo $text_product_number; ?></p>
        </div>
<div class="col-md-4 acount-information-col acount-information-col-order">
          <div class="cell-header">
            <h4><?php echo $heading_title_chzv; ?></h4>
          </div>
          <div class="acount-description"><?php echo $contact_text; ?></div>

  </div>



      </div>


      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>