<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>"> 
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/cosyone/stylesheet/stylesheet.css" />
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.7.0/css/perfect-scrollbar.css">

<link href="catalog/view/theme/default/css/main.css" rel="stylesheet">


<script type="text/javascript" src="catalog/view/theme/cosyone/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.7.0/js/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/cosyone/js/cosyone_common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/cosyone/stylesheet/ie8.css" />
<![endif]-->
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<script type="text/javascript">
    $(window).on('load', function () {
    var $preloader = $('#loader'),
        $spinner   = $preloader.find('.spinner');
    $spinner.fadeOut();
    $preloader.delay(350).fadeOut('slow');
});
</script> 
</head>
<body class="<?php echo $class; ?>">



<div id="loader">
  <img src="/image/cropped-fidelitti_icon.gif" alt="icon">
</div>

<div class="outer_container <?php echo $cosyone_default_product_style; ?> <?php if($cosyone_use_custom){ echo $cosyone_container_layout; } ?> <?php echo $cosyone_use_breadcrumb; ?>">
<div class="header_wrapper 
<?php echo $cosyone_menu_sticky; ?> 
<?php echo $cosyone_menu_border; ?> 
<?php echo $cosyone_header_style; ?>">


<div class="popup-countries mfp-hide">
  <div class="popup-countries__header">
    Пожалуйста выберите страну, что бы продолжить.
  </div>
  <ul class="popup-countries__items">
    <?php foreach ($countries_array as $country) { ?>
    <li class="popup-countries__item">
      <img src="/image/flags/<?php echo strtolower($country['iso_code_2']); ?>.png" alt="">
      <a href="/<?php echo strtolower($country['iso_code_2']) . $href; ?>" class="first-frame__list-item"><?php echo $country['name']; ?></a>
    </li>
    <?php } ?>
  </ul>
</div>

<header class="header">
  <div class="container">
    <div class="header__top">
      <div class="header__group">
        <div class="header__delivery">
          <i class="fa fa-globe" aria-hidden="true"></i>
          <span>Доставка в:</span>
          <a href=".popup-countries" class="open-popup"><?php echo strtoupper($country_s); ?></a>
        </div>
        <div class="header__lang">
          <?php echo $language; ?>
        </div>
      </div>
      <div class="header__promo">
        <?php echo $cosyone_top_promo_message; ?>
      </div>
      <div class="header__register">
        <?php //echo $header_login; ?>
        <?php if($logged){ ?>
        <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
        <?php }else{ ?>
        <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
        <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
        <?php } ?>
      </div>
    </div>
  </div>
</header>

<div class="container header-wrap">
<div class="header_main">
  <div class="header_right"> 
  <div class="service-block">
    <div class="service-block__item">
      <a href="#"><i class="icon-phone"></i></a>
    </div>
    <div class="service-block__item">
      <a href="#"><i class="icon-man"></i></a>
    </div>
    <div class="service-block__item">
      <?php if ($cosyone_header_cart) { echo $cart; } ?>
    </div>
    <div class="service-block__item">
      <a href="#" class="js-search"><i class="icon-search"></i></a>
    </div>
  </div>
  <?php if ($logo) { ?>
  <div class="logo">
  <span>ОНЛАЙН - БУТИК</span>
  <a href="<?php echo $home; ?>">
  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
  </div>
  <?php } ?>
 
 <div class="mobile_clear"></div>
  <!-- Position for header login, lang, curr, in the header main -->
	<?php if($cosyone_header_style == 'header1'){ ?>
    <?php echo $header_login; ?>
	<?php echo $language; ?>
        <?php echo $countries; ?>
  	<?php echo $currency; ?>
    <?php } ?>
  <?php if($cosyone_header_style == 'header2') { ?>
    	<?php } else { ?>
    <?php } ?>
  <?php if($cosyone_header_style == 'header3'){ ?>
    <?php } else { ?>
      </div> <!-- header_right ends -->
	</div> <!-- header ends -->
    <?php } ?>

<div class="menu_wrapper">
<div class="search-block">
  <div class="container"> 
    <?php if($cosyone_header_search == 'enabled') { ?>
   <?php echo $search; ?>
   <?php } ?>
  </div>
 </div>

<div class="menu_holder">
<?php if ($logo) { ?>
  <div class="logo2">
  <a href="<?php echo $home; ?>">
  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
  </div>
  <?php } ?>
<div id="menu">
<?php if($cosyone_header_style == 'header2') { ?>
    	<?php } else { ?>
        <div class="shortcuts_wrapper">
        <?php if($cosyone_header_style == 'header3') { ?>
 <div class="search-holder">
 <?php echo $search; ?>
 </div>
 <?php } ?>
        <?php echo $header_wishlist_compare; ?>
        <?php if ($cosyone_header_cart) { echo $cart; } ?>
        </div>
 <?php } ?>
<a class="mobile_menu_trigger up_to_tablet"><i class="fa fa-bars"></i> <?php echo $cosyone_text_mobile_menu; ?></a>
  <ul class="only_desktop">
	<li class="home only_desktop <?php echo $cosyone_show_home_icon; ?>"><a href="<?php echo $home; ?>" class="hvr-underline-from-center"><?php echo $text_home; ?></a></li>
       <?php if ($categories) { ?>
       <?php foreach ($categories as $category_1) { ?>
        <?php if ($category_1['category_1_id'] == $category_1_id) { ?>
		<li class="col<?php echo $category_1['column']; ?> current"><a href="<?php echo $category_1['href']; ?>" class="hvr-underline-from-center"><?php echo $category_1['name']; ?></a>
         <?php } else { ?>
         <li class="col<?php echo $category_1['column']; ?>"><a href="<?php echo $category_1['href']; ?>" class="hvr-underline-from-center"><?php echo $category_1['name']; ?></a>
         <?php } ?>
          <?php if ($category_1['children']) { ?>
          

          
          <div class="menu_drop_down" >
          <div class="wrapper">
                        
          <ul><?php foreach ($category_1['children'] as $category_2) { ?>
          <li class="column level2">
            <a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
            <?php if($cosyone_menu_mega_second_thumb == 'enabled' && $category_2['thumb']) { ?>
          <a href="<?php echo $category_2['href']; ?>" class="sub_thumb"><img src="<?php echo $category_2['thumb']; ?>" alt="<?php echo $category_2['name']; ?>"/></a>
          <?php } ?>
              <?php if ($category_2['children']) { ?>
              <div class="third">
              <ul>
               <?php foreach ($category_2['children'] as $category_3) { ?>
               <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
               <?php } ?>
              </ul>
              </div>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <div class="wrapper-image">
            <img src="<?php echo $category_1['thumb']; ?>" />
          </div>
          
          </div><!-- wrapper ends -->
          </div>
          <?php } ?>
        </li>
        <?php } ?>
        <?php } ?>
        <?php if($cosyone_custom_menu_block == 'enabled'){ ?>
		<li class="withsubs custom_block"><a><?php echo $cosyone_custom_menu_block_title; ?></a>
        <div class="menu_drop_down">
        <?php echo $cosyone_menu_custom_block_content; ?>
        </div></li>
		<?php } ?>
        <?php if($cosyone_custom_menu_title1){ ?>
		<li class="col1 withsubs">
                    <a href="<?php echo $cosyone_custom_menu_url1 ?>" class="hvr-underline-from-center"><?php echo $cosyone_custom_menu_title1; ?></a>
                    <div class="menu_drop_down">
                      <div class="wrapper">
                        <ul>
                          <li class="column level2"><a href="#">qweqwe</a></li>
                        </ul>
                        <div class="wrapper-image">
                          <img src="<?php echo $category_1['thumb']; ?>" />
                        </div>
                      </div>
                  </div>
                </li>
             
        <?php } ?>
        <?php if($cosyone_custom_menu_title2){ ?>      
                <li class="col1 withsubs">
                    <a href="<?php echo $cosyone_custom_menu_url2 ?>"  class="hvr-underline-from-center"><?php echo $cosyone_custom_menu_title2; ?></a>
                    
                
                
                <?php if ($informations) { ?>
                <div class="menu_drop_down">
                <div class="wrapper">
                    <!-- тут пихани статикой картинку -->
                
                <ul>
                <?php foreach ($informations as $information) { ?>
                
                <li class="column level2"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                
                <?php } ?>
                </ul>
                <div class="wrapper-image">
                  <img src="<?php echo $category_1['thumb']; ?>" />
                </div>
                
                </ul>
                </div>
                <div class="service-block _no-fixed">
                    <div class="service-block__item">
                      <a href="#"><i class="icon-phone"></i></a>
                    </div>
                    <div class="service-block__item">
                      <a href="#"><i class="icon-man"></i></a>
                    </div>
                    <div class="service-block__item">
                      <?php if ($cosyone_header_cart) { echo $cart; } ?>
                    </div>
                    <div class="service-block__item">
                      <a href="#" class="js-search"><i class="icon-search"></i></a>
                    </div>
                  </div>
                </div>
                <?php } ?>
                </li>
                
                
                

                
                
                
                
        <?php } ?>
        <?php if($cosyone_custom_menu_title3){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url3; ?>"><?php echo $cosyone_custom_menu_title3; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title4){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url4; ?>"><?php echo $cosyone_custom_menu_title4; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title5){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url5; ?>"><?php echo $cosyone_custom_menu_title5; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title6){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url6; ?>"><?php echo $cosyone_custom_menu_title6; ?></a></li>
        <?php } ?>
      </ul>
    </div> <!-- menu_holder ends -->
</div> <!-- menu ends -->
</div> <!-- menu_wrapper ends -->

<?php if($cosyone_header_style == 'header3'){ ?>
      </div> <!-- header_right ends -->
	</div> <!-- header ends -->
    <?php } else { ?><?php } ?>
<div class="clearfix"></div>
<div class="mobile_menu_wrapper">

<div class="mobile_menu">

	<ul>
    <?php if ($categories) { ?>
       <?php foreach ($categories as $category_1) { ?>
         <li><a href="<?php echo $category_1['href']; ?>" ><?php echo $category_1['name']; ?></a>
          <?php if ($category_1['children']) { ?>
          <span class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
          <ul>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <li>
            <a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
              <?php if ($category_2['children']) { ?>
              <span class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
              <ul>
                <?php foreach ($category_2['children'] as $category_3) { ?>
                <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
        <?php } ?>
        <?php if($cosyone_custom_menu_title1){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url1; ?>"><?php echo $cosyone_custom_menu_title1; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title2){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url2; ?>"><?php echo $cosyone_custom_menu_title2; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title3){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url3; ?>"><?php echo $cosyone_custom_menu_title3; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title4){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url4; ?>"><?php echo $cosyone_custom_menu_title4; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title5){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url5; ?>"><?php echo $cosyone_custom_menu_title5; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title6){ ?>
		<li><a href="<?php echo $cosyone_custom_menu_url6; ?>"><?php echo $cosyone_custom_menu_title6; ?></a></li>
        <?php } ?>
      </ul>

</div>

</div>

</div> <!-- header_wrapper ends -->
</div> <!-- inner conainer ends -->

<?php 
if($countries){
    echo $countries; 
}
?>


<div class="breadcrumb_wrapper"></div>
<div id="notification" class="container"></div>