<label><?php if ($text_agree) { ?>
  <?php echo $text_agree; ?>
  <?php if ($agree) { ?>
  <input type="checkbox" name="agree" value="1" checked="checked" />
  <?php } else { ?>
  <input type="checkbox" name="agree" value="1" />
  <?php } ?>
<?php } ?></label>
<div class="confirm">
<a href="javascript:history.back(-1); return false;"><i class="fa fa-chevron-left"></i>Продолжить шопинг</a>
<a id="button-payment-method" class="button"><?php echo $button_continue; ?></a>

</div>