<?php if(false){ ?>
<?php if (count($countries) > 1) { ?>
   <div class="dropdown">
   <button onclick="myFunctionss()" class="dropbtn">
      <?php foreach ($countries as $country) { ?>
      <?php if ($country['code'] == $country_s) { ?>
      <?php echo $country['name']; ?>
      <?php } ?>
      <?php } ?>
   </button>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">


  <div id="myDropdown" class="dropdown-content">
    <?php foreach ($countries as $country) { ?>
      <li><button class="btn btn-link btn-block country-select header<?php echo $country['code']; ?>" type="button" name="<?php echo $country['code']; ?>"><?php echo $country['name']; ?></button></li>
      <?php } ?>
  </div>


    
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>

<?php } ?>
</div>
<?php } ?>



<?php if (count($countries) > 1) { ?>
<div class="language_current contrast_font">
    <a class="head">
        <?php echo $country_s; ?>
        <i class="fa fa-angle-down"></i>
    </a>
    <form action="" method="post" enctype="" id="country">
        <div class="top_header_drop_down">
            <?php foreach ($countries as $country) { ?>
            <a href="/<?php echo strtolower($country['iso_code_2']) . $href; ?>"><?php echo $country['name']; ?></a>
            <?php //var_dump($href); ?>
            <?php } ?>
        </div>
    </form>
</div>
<?php } ?>