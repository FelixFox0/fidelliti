<?php echo $header; ?>
<div class="our-prod">
  <div class="our-prod__paralax parallax-window">
    <h1><?php echo $heading_title; ?></h1>
    <p>СВЕЖИЙ ВЗГЛЯД ВЗГЛЯД НА ПРОИЗВОДСТВО СУМОК</p>
  </div>
  <div class="our-prod__new-fabric">
    <div class="our-prod__new-fabric-inner">
      <img src="/image/6ae3a7b044.jpg" alt="">
      <h3>СОВРЕМЕННАЯ ФАБРИКА</h3>
      <img src="/image/e1b9856a9b.jpg" alt="">
      <p>На каждой ступени изготовления, наши изделия проходят жесткий
      контроль качества. Отлаженная модель производства.
      Своевременный выпуск готовых изделий. Современное 
      оборудование. Вот условия нужные для передового производства.</p>
    </div>
  </div>
  <div class="our-prod__row">
    <div class="our-prod__row-text">
      <h3>РАСКРОЙНЫЙ</h3>
      <p>ЦЕХ №1 <br>
      Для производства используем только лучшую лицевую кожу.
      Используем различные методики раскроя для достижения наилучшего 
      результата.</p>
    </div>
    <div class="our-prod__row-img">
      <img src="/image/1-proizvostvo.jpg" alt="">
    </div>
  </div>
  <div class="our-prod__row">
    <div class="our-prod__row-img">
      <img src="/image/ceh_2.jpg" alt="">
    </div>
    <div class="our-prod__row-text">
      <h3>ЗАГОТОИТЕЛЬНЫЙ</h3>
      <p>ЦЕХ №2 <br>
      Тщательно подготавливаем каждую деталь кроя. Точность и щепетильность — главное правило.</p>
    </div>
  </div>
  <div class="our-prod__row">
    <div class="our-prod__row-text">
      <h3>ШВЕЙНЫЙ</h3>
      <p>ЦЕХ №3 <br>
      Контролируем каждый стежок строчки. Нитки и фурнитуру покупаем
      исключительно в Италии.</p>
    </div>
    <div class="our-prod__row-img">
      <img src="/image/4-1.jpg" alt="">
    </div>
  </div>
  <div class="our-prod__row">
    <div class="our-prod__row-img">
      <img src="/image/4-proizvostvo.jpg" alt="">
    </div>
    <div class="our-prod__row-text">
      <h3>ОТДЕЛОЧНЫЙ</h3>
      <p>ЦЕХ №4 <br>
      Цех, где происходят чудеса. Наши изделия обрабатываются
      исключительно итальянскими красками.</p>
    </div>
  </div>
</div>

<div class="clearfix">
  <pre>
  ***********************************************
      ТУТ НАЧИНАЕТСЯ ВТОРАЯ СТРАНИЦА
  ***********************************************
</pre>
</div>

<div class="about-company">
  <div class="about-company__banner">
    <h1 class="about-company__title">FIDELITTI — УНИКАЛЬНЫЙ МОДНЫЙ БРЕНД — ПРОИЗВОДИТЕЛЬ СУМОК И АКСЕССУАРОВ,<br> 
СОЗДАННЫЙ В ОДЕССЕ В 2015-ОМ ГОДУ.</h1>
    <div class="about-company__text"> 
      О КОМПАНИИ
    </div>
  </div>
  <div class="about-company__bot">
    Всего за один год у нас получилось заявить о себе, как о производителе продукции наивысшего качества. А все благодаря тому, что с самого начала нашей целью было стать самым успешным проектом на рынке кожгалантереи.
  </div>
  <div class="about-company__images">
    <div class="about-company__img">
      <img src="/image/IMG_8947-708x700.jpg" alt="">
    </div>
    <div class="about-company__img">
      <img src="/image//fashion_day_odessa_fidelitti-1-708x700.jpg" alt="">
    </div>
    <div class="about-company__img">
      <img src="/image/gesheft_fidelitti-708x700.jpg" alt="">
    </div>
  </div>
  
</div>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1></h1>
      <?php echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
<?php echo $footer; ?>