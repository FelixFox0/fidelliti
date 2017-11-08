<div class="checkout-heading box-heading"><?php echo $text_cart; ?></div>
<?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="checkout-cartt">
    <?php foreach ($products as $product) { ?>
        <div class="checkout-cartt__img">
          <?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
          <?php } ?>
        </div>
        <div class="checkout-cartt__info">
          <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <div>
            <?php foreach ($product['option'] as $option) { ?>
              <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?>
          </div>
          <div class="checkout-cartt__footer">
            <div class="checkout-cartt__price">
              <span><?php echo $product['price']; ?></span>
              <select name="cart_quantity" id="cart_quantity">
                <option value="<?php echo $product['quantity']; ?>" style="background-color: #ddd;"><?php echo $product['quantity']; ?></option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
              </select>
            </div>
            <div class="checkout-cartt__delete">
              <a href="<?php echo $product['cart_id']; ?>" data-tooltip="<?php echo $button_remove; ?>" class="" data-remove="<?php echo $product['cart_id']; ?>"><i></i></a> 
            </div>
          </div>

        </div>
    <?php } ?>
  </div>
  <div class="cart-tot visible-xs visible-sm">
    <?php foreach ($totals as $total) { ?>
          <div>
            <div><?php echo $total['title']; ?>:</div>
            <div><?php echo $total['text']; ?></div>
          </div>
    <?php } ?>
  </div>
 <table class="quickcheckout-cart contrast_font hidden-xs hidden-sm">
   <thead>
     <tr>
       <td class="image mobile_hide"><?php echo $text_name; ?></td>
       <td class="quantity"><?php echo $text_quantity; ?></td>
       <td class="unit-price mobile_hide"><?php echo $text_price; ?></td>
       <td class="total"><?php echo $text_total; ?></td>
     </tr>
   </thead>
   <?php if ($products || $vouchers) { ?>
   <tbody>
       <?php foreach ($products as $product) { ?>
       <tr>
         <td class="name">
           <div>
         <?php if ($product['thumb']) { ?>
           <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
           <?php } ?>
 
         <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
         <?php if (!$product['stock']) { ?>
                 <span class="text-danger">***</span>
                 <?php } ?>
           <div>
             <?php foreach ($product['option'] as $option) { ?>
             <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
             <?php } ?>
         
         <?php if ($product['recurring']) { ?>
         <small><?php echo $text_recurring_item; ?>: <?php echo $product['recurring']; ?></small>
         <?php } ?>
           </div>
           </div>
           </td>
         <td class="quantity"><?php if ($edit_cart) { ?>
           <div class="counter">
             <button class="minus">-</button>
             <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" style="max-width:35px;" value="<?php echo $product['quantity']; ?>" />
             <button class="plus">+</button>
           </div>
 
           <!-- <a data-tooltip="<?php echo $button_update; ?>" class="button-update sq_icon"><i class="fa fa-refresh"></i></a> -->
           <?php } else { ?>
       x&nbsp;<?php echo $product['quantity']; ?>
       <?php } ?></td>
       <td class="unit-price mobile_hide"><?php echo $product['price']; ?></td>
         <td class="total"><?php echo $product['total']; ?></td>
       </tr>
       <tr class='btns'>
         <td colspan="4">
           <a href="" class="sq_icon wishlist_add wishlistTrigger" onclick="wishlist.add(<?php echo $product['cart_id']; ?>)" data-tooltip="<?php echo $text_wishlist; ?>"><i class="fa fa-heart-o"  ></i> <?php echo $text_wishlist; ?></a>
           <a href="<?php echo $product['cart_id']; ?>" data-tooltip="<?php echo $button_remove; ?>" class="button-remove sq_icon" data-remove="<?php echo $product['cart_id']; ?>"><i class="fa "></i><?php echo $text_remove_but; ?></a>
         </td>
       </tr>
       <?php } ?>
       <?php foreach ($vouchers as $voucher) { ?>
       <tr>
         <td class="image mobile_hide"></td>
         <td class="name"><?php echo $voucher['description']; ?></td>
         <td class="quantity">x&nbsp;1</td>
       <td class="price mobile_hide"><?php echo $voucher['amount']; ?></td>
         <td class="total"><?php echo $voucher['amount']; ?></td>
       </tr>
       </tbody>
       <?php } ?>
       </table>
        <table class="quickcheckout-cart contrast_font hidden" style="margin-top:-1px">
        <tbody>
            <?php foreach ($totals as $total) { ?>
              <tr>
                <td style="text-align:right; font-size: 14px;" colspan="4"><?php echo $total['title']; ?>:</td>
                <td style="text-align:right; font-size: 14px;"><?php echo $total['text']; ?></td>
              </tr>
        <?php } ?>
          </tbody>
            </table>
    <?php } ?>
</table>


<div class="cart-total-info">
  <div class="cart-total-info__title">
    <?php echo $text_total_inf; ?>
  </div>
  <div class="cart-total-info__table">
    <table class="quickcheckout-cart contrast_font" style="margin-top:-1px">
        <tbody>
            <?php foreach ($totals as $total) { ?>
              <tr>
                <td style="text-align:left; font-size: 14px;" colspan="4"><?php echo $total['title']; ?>:</td>
                <td style="text-align:right; font-size: 14px;"><?php echo $total['text']; ?></td>
              </tr>
        <?php } ?>
          </tbody>
    </table>
  </div>
  <div class="cart-total-info__button">
    <button class='get-order button'><?php echo $text_continue; ?></button>
  </div>
  <div class="cart-total-info__footer">
    <p><?php echo $text_text; ?> <a href="#"> <?php echo $text_policy; ?></a></p>
    <a href="#"><?php echo $text_help; ?> +</a>
  </div>

</div>