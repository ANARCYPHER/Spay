<?php require PATH . '/theme/view/common/header.php';?>
<div class="app-content pt-md-3"> 
    <?php echo ads($Ads,3,'mb-3');?>
    <?php  
    
    foreach ($HomeModules as $HomeModule) {
        $ModuleData       = json_decode($HomeModule['data'], true);
        require PATH . '/theme/view/module/'.$HomeModule['module_file'].'.php';
    } 
?>
</div>
<?php
if (isset($_GET['success'])) {
            $Notify['type']     = 'success';
            $Notify['text']     = __('Your account has been upgraded'); 
            $this->notify($Notify);
} else {
    // Fallback behaviour goes here
}
?>
<?php require PATH . '/theme/view/common/footer.php';?>