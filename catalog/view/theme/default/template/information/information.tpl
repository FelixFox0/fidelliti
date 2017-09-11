<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
    <?php if(false){ ?>
  <div class="row">
      <?php echo $left_menu; ?>
      
      
      <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php // echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
    
    <?php } ?>
    
<div class="static-pages">
  <div class="static-pages__title">
    <?php echo $heading_title; ?>
  </div>
  <div class="clearfix static-pages__container">
    <?php echo $left_menu; ?>
    <div class="col-md-9">
      <div class="static-pages__content">
          
        <div class="panel-group" id="accordion">
            <?php echo $description; ?>
            <?php if(false){ ?>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                Collapsible Group 1</a>
              </h4>
            </div>
            <div id="collapse1" class="panel-collapse collapse">
              <div class="panel-body">
                <h3>qweqwe</h3>
                <h4>qweeqw</h4>
                <h5>qweqweqweqweqweqwe</h5>
                <ul>
                  <li>qeqweqweqw eqw </li>
                  <li>qeqweqweqw eqw </li>
                  <li>qeqweqweqw eqw </li>
                  <li>qeqweqweqw eqw </li>
                  <li>qeqweqweqw eqw </li>
                </ul>

                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, laborum cumque itaque ut vel aliquid laboriosam reprehenderit quas nam <b>quibusdam sapiente</b> veniam quam impedit commodi est, temporibus maiores! Totam, doloribus!</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, laborum cumque itaque ut vel <i>aliquid laboriosam reprehenderit quas nam quibusdam sapiente veniam quam impedit</i> commodi est, temporibus maiores! Totam, doloribus!</p>
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                Collapsible Group 2</a>
              </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
              <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
              minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
              commodo consequat.</div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                Collapsible Group 3</a>
              </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
              <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
              minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
              commodo consequat.</div>
            </div>
          </div>
            <?php } ?>
        </div>
      </div>
    </div>
  </div>
</div>
    
    
    
</div>















<?php echo $footer; ?>