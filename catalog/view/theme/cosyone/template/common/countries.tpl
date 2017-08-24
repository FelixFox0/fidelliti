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
<div class="first-frame">
  <div class="first-frame__image">
    <img src="image/CountrySelector.jpg" alt="image">
  </div>
  <div class="first-frame__countries">
    <div class="first-frame__title">
      Please select a country and language to continue.
    </div>
    <div class="first-frame__list">
      <select name="" id="">
      <?php foreach ($countries as $country) { ?>
      <option value="/<?php echo strtolower($country['iso_code_2']) . $href; ?>"><?php echo $country['name']; ?></option>
      <?php } ?>
        
      </select>
      
    </div>
      
<?php if (count($languages) > 1) { ?>
<select name="languages" class="form-control">
    <?php foreach ($languages as $language) { ?>
    <option value="<?php echo $language['name']; ?>"><?php echo $language['name']; ?></option>
    <?php } ?>
    
</select>
<?php } ?>
      
  </div>
</div>


<?php } ?>
