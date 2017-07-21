<?php if ($addresses) { ?>
<div class="radio">
  <label><input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="checked" />
  <?php echo $text_address_existing; ?></label>
</div>
<div id="payment-existing">
  <select name="address_id" class="form-control">
    <?php foreach ($addresses as $address) { ?>
    <?php if ($address['address_id'] == $address_id) { ?>
    <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['postcode']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
    <?php } else { ?>
    <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['postcode']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
    <?php } ?>
    <?php } ?>
  </select>
</div>
<div class="radio">
  <label><input type="radio" name="payment_address" value="new" id="payment-address-new" />
  <?php echo $text_address_new; ?></label>
</div>
<?php } else { ?>
  <input type="radio" name="payment_address" value="new" id="payment-address-new" class="hide" />
<?php } ?>
<div class="row" id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>; padding-top:10px">
<?php foreach ($fields as $field) { ?>
  <?php if ($field == 'country') { ?>
    <?php if (!empty(${'field_' . $field}['display'])) { ?>
	<div class="col-sm-6<?php echo !empty(${'field_' . $field}['required']) ? ' required' : ''; ?>">
	  <label class="control-label"><?php echo $entry_country; ?></label>
	  <select name="country_id" class="form-control" id="input-payment-country">
	  <?php foreach ($countries as $country) { ?>
		<?php if ($country['country_id'] == $country_id) { ?>
		<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
		<?php } else { ?>
		<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
		<?php } ?>
	  <?php } ?>
	  </select>
	</div>
	<?php } else { ?>
	<select name="country_id" class="hide">
	<?php foreach ($countries as $country) { ?>
	  <?php if ($country['country_id'] == $country_id) { ?>
	  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
	  <?php } else { ?>
	  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
	  <?php } ?>
	<?php } ?>
	</select>
	<?php } ?>
  <?php } elseif ($field == 'zone') { ?>
    <?php if (!empty(${'field_' . $field}['display'])) { ?>
	<div class="col-sm-6<?php echo !empty(${'field_' . $field}['required']) ? ' required' : ''; ?>">
	  <label class="control-label"><?php echo $entry_zone; ?></label>
	  <select name="zone_id" class="form-control" id="input-payment-zone"></select>
	</div>
	<?php } else { ?>
	  <select name="zone_id" class="hide"></select>
	<?php } ?>
  <?php } else { ?>
	<?php if (!empty(${'field_' . $field}['display'])) { ?>
	<div<?php echo $field == 'postcode' ? ' id="payment-postcode-required"' : ''; ?> class="col-sm-6<?php echo !empty(${'field_' . $field}['required']) ? ' required' : ''; ?>">
	  <label class="control-label"><?php echo ${'entry_' . $field}; ?></label>
	  <input type="text" name="<?php echo $field; ?>" value="<?php echo ${'field_' . $field}['default']; ?>" class="form-control"  id="input-payment-<?php echo str_replace('_', '-', $field); ?>" />
	</div>
	<?php } else { ?>
	<input type="text" name="<?php echo $field; ?>" value="<?php echo ${'field_' . $field}['default']; ?>" class="hide" />
	<?php } ?>
  <?php } ?>
<?php } ?>
<!-- CUSTOM FIELDS -->
<div id="custom-field-payment">
  <?php foreach ($custom_fields as $custom_field) { ?>
  <?php if ($custom_field['location'] == 'address') { ?>
	<div class="col-sm-6 custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>" id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
	  <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
	  <?php if ($custom_field['type'] == 'select') { ?>
		<select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
		  <option value=""><?php echo $text_select; ?></option>
		  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
		  <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
		  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
		  <?php } else { ?>
		  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
		  <?php } ?>
		  <?php } ?>
		</select>
	  <?php } ?>
	  <?php if ($custom_field['type'] == 'radio') { ?>
		<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
		  <div class="radio">
			<?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
			<label>
			  <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
			  <?php echo $custom_field_value['name']; ?></label>
			<?php } else { ?>
			<label>
			  <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
			  <?php echo $custom_field_value['name']; ?></label>
			<?php } ?>
		  </div>
		<?php } ?>
	  <?php } ?>
	  <?php if ($custom_field['type'] == 'checkbox') { ?>
		<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
		  <div class="checkbox">
			<?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $guest_custom_field[$custom_field['custom_field_id']])) { ?>
			<label>
			  <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
			  <?php echo $custom_field_value['name']; ?></label>
			<?php } else { ?>
			<label>
			  <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
			  <?php echo $custom_field_value['name']; ?></label>
			<?php } ?>
		  </div>
		<?php } ?>
	  <?php } ?>
	  <?php if ($custom_field['type'] == 'text') { ?>
		<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
	  <?php } ?>
	  <?php if ($custom_field['type'] == 'textarea') { ?>
		<textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
	  <?php } ?>
	  <?php if ($custom_field['type'] == 'file') { ?>
		<br />
		<button type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
		<input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
	  <?php } ?>
	  <?php if ($custom_field['type'] == 'date') { ?>
		<div class="input-group date">
		  <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
		  <span class="input-group-btn">
		  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
		  </span></div>
	  <?php } ?>
	  <?php if ($custom_field['type'] == 'time') { ?>
		<div class="input-group time">
		  <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
		  <span class="input-group-btn">
		  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
		  </span></div>
	  <?php } ?>
	  <?php if ($custom_field['type'] == 'datetime') { ?>
		<div class="input-group datetime">
		  <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
		  <span class="input-group-btn">
		  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
		  </span></div>
	  <?php } ?>
  </div>
  <?php } ?>
  <?php } ?>
</div>
</div>

<script type="text/javascript"><!--
// Payment address form function
$('#payment-address input[name=\'payment_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').slideUp();
		$('#payment-new').slideDown();

		reloadPaymentMethod();
	} else {
		$('#payment-existing').slideDown();
		$('#payment-new').slideUp();
		
		reloadPaymentMethodById($('#payment-address select[name=\'address_id\']').val());
	}
});

// Sort the custom fields
$('#custom-field-payment .custom-field[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#payment-new .col-sm-6').length) {
		$('#payment-new .col-sm-6').eq($(this).attr('data-sort')).before(this);
	} 
	
	if ($(this).attr('data-sort') > $('#payment-new .col-sm-6').length) {
		$('#payment-new .col-sm-6:last').after(this);
	}
		
	if ($(this).attr('data-sort') < -$('#payment-new .col-sm-6').length) {
		$('#payment-new .col-sm-6:first').before(this);
	}
});

$('#payment-address button[id^=\'button-payment-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

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
						$(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}
	
					if (json['success']) {
						alert(json['success']);
	
						$(node).parent().find('input[name^=\'custom_field\']').attr('value', json['file']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});

$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('#payment-address select[name=\'zone_id\']').on('change', function() {
	reloadPaymentMethod();
});

$('#payment-address select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=quickcheckout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#payment-address select[name=\'country_id\']').after('<i class="fa fa-spinner fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spinner').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').addClass('required');
			} else {
				$('#payment-postcode-required').removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#payment-address select[name=\'zone_id\']').html(html);

			<?php if ($country_reload) { ?>
				reloadPaymentMethod();
			<?php } ?>
		},
		<?php if ($debug) { ?>
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
		<?php } ?>
	});
});

$('#payment-address select[name=\'country_id\']').trigger('change');

$('#payment-address select[name=\'address_id\']').on('change', function() {
	reloadPaymentMethodById($('#payment-address select[name=\'address_id\']').val());
});

$('#payment-address input[name=\'payment_address\']:checked').trigger('change');
//--></script>