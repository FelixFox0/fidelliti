<div id="login">
<div class="login-container">
  <div class="login-row">
	<label class="control-label" for="input-login-email"><?php echo $entry_email; ?></label>
	  <input type="text" name="email" value="" class="form-control" id="input-login-email" />
  </div>
  
  <div class="login-row">
	<label class="control-label" for="input-login-password"><?php echo $entry_password; ?></label>
	  <input type="password" name="password" value="" class="form-control" />
  </div>
  </div>
  <div class="text-right">
  <input type="button" value="<?php echo $button_login; ?>" id="button-login" class="button" />
  </div>
  
</div>

<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-login').click();
	}
});
//--></script>   