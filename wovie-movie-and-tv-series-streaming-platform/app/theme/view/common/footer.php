</div>
</div>
</div>
<?php
if(ads($Ads,7)) {
    echo '<div class="ads-sticky"><div class="ads-close" data-close="ads-sticky">'.__('Close').'</div>'.ads($Ads,7).'</div>';
}
?>
<div class="app-footer">
    <div class="row">
        <div class="col-md-12">
            <div class="footer-text my-3">
                <?php echo get($Settings,'data.footer_text','general');?>
            </div>
        </div>
        <div class="col-md-12 text-12">
            <div class="row">
                <div class="col-md-8">
                    <div class="footer-nav">
                        <?php   
                    $Pages         = $this->db->from("pages")->where('status',1)->limit(0,8)->all();
                    foreach ($Pages as $Page) {
                    ?>
                        <a href="<?php echo APP.'/page/'.$Page['self'];?>" class="mr-3">
                            <?php echo $Page['name'];?></a>
                        <?php } ?>
                    </div>
                    <div class="my-2"><?php echo __('Copyright');?> ©
                        <?php echo get($Settings,'data.company','general') . ' ' ; echo date('Y');?>
                    </div>
                    <a href="https://my.flaunt7.com/aff.php?aff=578" target="_blank"><div class="my-2"><?php echo __('Sponsored by Flaunt7 - Offshore Web Hosting!');?>
                    </div></a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<!-- report modal -->
<div class="modal" id="m" tabindex="-1" aria-labelledby="m" aria-hidden="true" data-backdrop="static">
    <button class="modal-close" data-dismiss="modal">
        <svg class="icon">
            <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#close';?>" />
        </svg>
    </button>
    <div class="modal-dialog modal-dialog-centered">
    </div>
</div>
<div class="modal" id="lg" tabindex="-1" aria-labelledby="m" aria-hidden="true" data-backdrop="static">
    <button class="modal-close" data-dismiss="modal">
        <svg class="icon">
            <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#close';?>" />
        </svg>
    </button>
    <div class="modal-dialog modal-dialog-centered modal-lg">
    </div>
</div>    
 <script>           
if( $(window).width() > 768 )
{
  $.ajax({
    url: '/app/theme/assets/js/bootstrap.bundle.desktop.js',
    dataType: "script",
    success: function() {
        //success
    }
  });
}
</script>   
 <script>           
if( $(window).width() < 768 )
{
  $.ajax({
    url: '/app/theme/assets/js/bootstrap.bundle.mobile.js',
    dataType: "script",
    success: function() {
        //success
    }
  });
}
</script>
<script src="<?php echo THEME.'/js/jquery.lazy.js?v='.VERSION;?>"></script>
<script src="<?php echo THEME.'/js/jquery.snackbar.js?v='.VERSION;?>"></script>
<script src="<?php echo THEME.'/js/jquery.typeahead.js?v='.VERSION;?>"></script>
<script src="<?php echo THEME.'/js/jquery.selectize.js?v='.VERSION;?>"></script>
<script src="<?php echo THEME.'/js/jquery.tmpl.js?v='.VERSION;?>"></script>
<?php if($Config['comments'] == true) { ?>
<script src="<?php echo THEME.'/js/jquery.comment.js?v='.VERSION;?>"></script>
<script src="<?php echo THEME.'/js/detail.js?v='.VERSION;?>"></script>
<?php } ?>
<script src="<?php echo THEME.'/js/app.js?v='.VERSION;?>"></script>
<?php if(get($Settings,'data.onesignal_id','api')) { ?>
<script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async="async" defer></script>
<?php } ?> 
<?php if ($_SESSION['notify']['display'] == 'hidden') {?>
<script type="text/javascript">
Snackbar.show({ text: '<?php echo $_SESSION["notify"]["text"] ?>', customClass: 'bg-<?php echo $_SESSION["notify"]["type"] ?>' });
</script>
<?php }?>
<script id="card-notification" type="text/x-jquery-tmpl">
    <div class="notification"> 
        <div class="notification-icon ${color}">
            <svg>
                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#';?>${icon}" />
            </svg>
        </div>
        <div class="flex-fill">
            <a href="${link}">${text}</a>
            <div class="date">${created}</div>
        </div>
    </div> 
</script>
</body>

</html>
