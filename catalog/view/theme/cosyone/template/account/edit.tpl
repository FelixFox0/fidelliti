<?php echo $header; ?>
<div class="container">
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
                <?php echo $text_about_account; ?></a>
            </li>
            <li class="section">
              <a href="<?php echo $address; ?>" class="cta3 add-smooth-underline">
                <?php echo $text_address; ?></a>
            </li>
            <li class="section">
              <a href="<?php echo $newsletter; ?>" class="cta3 add-smooth-underline">
                <?php echo $text_newsletter; ?></a>
            </li>
          </ul>

      
      </div>


        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 acount-information-col acount-information-col-edit">          
          <div class="cell-header">
            <div class="edit-details"><?php echo $text_your_details; ?></div>
          </div>
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
              <fieldset>
                <div class="form-group required">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-firstname"><?php echo $entry_firstname; ?> </label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                    <?php if ($error_firstname) { ?>
                    <div class="text-danger"><?php echo $error_firstname; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                    <?php if ($error_lastname) { ?>
                    <div class="text-danger"><?php echo $error_lastname; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-email"><?php echo $entry_email; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                    <?php if ($error_telephone) { ?>
                    <div class="text-danger"><?php echo $error_telephone; ?></div>
                    <?php } ?>
                  </div>
                </div>
                  <div class="form-group" style="display: none;">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                  </div>
                </div>
                <?php foreach ($custom_fields as $custom_field) { ?>
                <?php if ($custom_field['location'] == 'account') { ?>
                <?php if ($custom_field['type'] == 'select') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="ccol-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                      <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                      <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'radio') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label"><?php echo $custom_field['name']; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <div>
                      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                      <div class="radio">
                        <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                        <label>
                          <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                          <?php echo $custom_field_value['name']; ?></label>
                        <?php } else { ?>
                        <label>
                          <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                          <?php echo $custom_field_value['name']; ?></label>
                        <?php } ?>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'checkbox') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label"><?php echo $custom_field['name']; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <div>
                      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                      <div class="checkbox">
                        <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                        <label>
                          <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                          <?php echo $custom_field_value['name']; ?></label>
                        <?php } else { ?>
                        <label>
                          <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                          <?php echo $custom_field_value['name']; ?></label>
                        <?php } ?>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'text') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'textarea') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'file') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label"><?php echo $custom_field['name']; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                    <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'date') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <div class="input-group date">
                      <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span></div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'time') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <div class="input-group time">
                      <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span></div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'datetime') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-lg-1 col-md-1 col-sm-2 col-xs-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                    <div class="input-group datetime">
                      <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span></div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php } ?>
                <?php } ?>
              </fieldset>
              <div class="buttons clearfix">
                <div class="pull-left"><input type="submit" value="<?php echo $button_change; ?>" class="btn btn-primary login-form-button" /></div>
                <div class="pull-right">
                  <a href="<?php echo $password; ?>" class="btn btn-default login-form-button"><?php echo $button_change_pass; ?></a>
                </div>
              </div>
            </form>
      
      </div>

        </div>
      </div>


      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
		$('.form-group').eq($(this).attr('data-sort')).before(this);
	} 
	
	if ($(this).attr('data-sort') > $('.form-group').length) {
		$('.form-group:last').after(this);
	}
		
	if ($(this).attr('data-sort') < -$('.form-group').length) {
		$('.form-group:first').before(this);
	}
});
//--></script> 
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
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
					$(node).parent().find('.text-danger').remove();
					
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
//--></script> 
<?php echo $footer; ?>