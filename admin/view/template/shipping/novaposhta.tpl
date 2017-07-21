<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form_novaposhata" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form_novaposhata"  class="form-horizontal">               
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="novaposhta_api_key"><?php echo $entry_api_key; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="novaposhta_api_key" value="<?php echo $novaposhta_api_key; ?>" placeholder="<?php echo $entry_api_key; ?>" id="novaposhta_api_key" class="form-control" />
                    </div>
                </div>                     

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="novaposhta_sender_organization"><?php echo $entry_sender_organization; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="novaposhta_sender_organization" value="<?php echo $novaposhta_sender_organization; ?>" placeholder="<?php echo $entry_sender_organization; ?>" id="novaposhta_sender_organization" class="form-control" />
                    </div>
                </div>                    

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="novaposhta_sender_person"><?php echo $entry_sender_person; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="novaposhta_sender_person" value="<?php echo $novaposhta_sender_person; ?>" placeholder="<?php echo $entry_sender_person; ?>" id="novaposhta_sender_person" class="form-control" />
                    </div>
                </div>                    

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="novaposhta_sender_phone"><?php echo $entry_sender_phone; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="novaposhta_sender_phone" value="<?php echo $novaposhta_sender_phone; ?>" placeholder="<?php echo $entry_sender_phone; ?>" id="novaposhta_sender_phone" class="form-control" />
                    </div>
                </div>  

                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <?php echo $entry_sender_city; ?>
                    </label>  
                    <div class="col-sm-10">
                        <div id="novaposhta_sender_city">Loading...</div>
                        <div id="novaposhta_sender_city_name"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <?php echo $entry_sender_warehouse; ?>
                    </label>  
                    <div class="col-sm-10">
                        <div id="novaposhta_sender_warehouse">Loading...</div>
                    </div>
                </div> 
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="novaposhta_geo_zone_id"><?php echo $entry_geo_zone; ?></label>
                  <div class="col-sm-10">
                        <select name="novaposhta_geo_zone_id" id="novaposhta_geo_zone_id" class="form-control">
                            <option value="0"><?php echo $text_all_zones; ?></option>
                            <?php foreach ($geo_zones as $geo_zone) { ?>
                            <?php if ($geo_zone['geo_zone_id'] == $novaposhta_geo_zone_id) { ?>
                            <option value="<?php echo $geo_zone['geo_zone_id']; ?>"
                                    selected="selected"><?php echo $geo_zone['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                  </div>
                </div>                    
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="novaposhta_send_order_status"><?php echo $entry_send_order_status; ?></label>
                  <div class="col-sm-10">
                        <select name="novaposhta_send_order_status" id="novaposhta_send_order_status" class="form-control">
                            <option value="0"><?php echo $text_select; ?></option>
                            <?php foreach ($order_statuses as $order_status) { ?>
                            <?php if ($order_status['order_status_id'] == $novaposhta_send_order_status) { ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>"
                                    selected="selected"><?php echo $order_status['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                  </div>
                </div>                      
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="novaposhta_status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                        <select name="novaposhta_status" id="novaposhta_status" class="form-control">
                            <?php if ($novaposhta_status) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                        </select>
                  </div>
                </div>                      
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="novaposhta_sort_order"><?php echo $entry_sort_order; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="novaposhta_sort_order" value="<?php echo $novaposhta_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="novaposhta_sort_order" class="form-control" />
                    </div>
                </div>                      

            </form>
      </div>
    </div>
  </div>
</div>
<?php
    $senderSity = "";
    if (isset($novaposhta_sender_city_name) && $novaposhta_sender_city_name != "") {
        $senderSity = $novaposhta_sender_city_name;
    } else {
        $senderSity = $novaposhta_sender_city;
    }
    ?>
<script type="text/javascript"><!--

    function getCities() {

        $.ajax({
            url: 'index.php?route=shipping/novaposhta/getCities&token=<?php echo $token; ?>&filter=' + encodeURIComponent('<?php echo $novaposhta_sender_city; ?>'),
            dataType: 'json',
            success: function (json) {
                var inputHTMl;
                html = '<select name="novaposhta_sender_city" class="form-control">';
                html += '<option value=""><?php echo $text_select; ?></option>';
                for (i = 0; i < json.length; i++) {
                    if (json[i]['city'] == '<?php echo $novaposhta_sender_city_name; ?>') {
                        html += '<option selected="selected" value="' + json[i]['ref'] + '">' + json[i]['city'] + '</option>';
                    } else {
                        html += '<option value="' + json[i]['ref'] + '">' + json[i]['city'] + '</option>';
                    }
                    inputHTMl = '<input name="novaposhta_sender_city_name" type="hidden" value="' + json[i]['city'] + '">';
                }
                html += '</select>';


                $('#novaposhta_sender_city').html(html);
                $('#novaposhta_sender_city_name').html(inputHTMl);
            }
        });
    }

    function getWarehouses() {
        var senderSelect = $('#novaposhta_sender_city select');
        var senderSelected = $('#novaposhta_sender_city option:selected');
        var senderCity = senderSelect.val();
        var senderSelectedText = senderSelected.text();
        var url = 'index.php?route=shipping/novaposhta/getWarehouses&token=<?php echo $token; ?>&filter=' + encodeURIComponent('<?php echo $novaposhta_sender_city; ?>');
        if (senderCity !== undefined) {
            url = 'index.php?route=shipping/novaposhta/getWarehouses&token=<?php echo $token; ?>&filter=' + senderCity;
            var inputHTMl = '<input name="novaposhta_sender_city_name" type="hidden" value="' + senderSelectedText + '">';
            $('#novaposhta_sender_city_name').html(inputHTMl);
        }
        console.log(url);
        $.ajax({
            url: url,
            dataType: 'json',
            success: function (json) {

                html = '<select name="novaposhta_sender_warehouse" class="form-control">';

                html += '<option value=""><?php echo $text_select; ?></option>';
                for (i = 0; i < json.length; i++) {
                    if (json[i]['warehouse'] == '<?php echo $novaposhta_sender_warehouse; ?>') {
                        html += '<option selected="selected" value="' + json[i]['warehouse'] + '">' + json[i]['warehouse'] + '</option>';
                    } else {
                        html += '<option value="' + json[i]['warehouse'] + '">' + json[i]['warehouse'] + '</option>';
                    }
                }
                html += '</select>';

                $('#novaposhta_sender_warehouse').html(html);
            }
        });
    }

    $(document).ready(function () {
        getCities();
        getWarehouses();
    });

    $('#novaposhta_sender_city').change(function () {
        $('#novaposhta_sender_warehouse').html('Loading...');
        getWarehouses();
    });

    //--></script>

<?php echo $footer; ?>
