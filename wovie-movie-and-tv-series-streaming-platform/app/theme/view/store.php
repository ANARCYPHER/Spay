<style>
.app-search {
	margin-top: 15px;
}
.store-item {
	width: 33.33333%;
	height: 650px;
	float: left;
	padding: 10px;
    margin-bottom: 65px;
position: relative;
}
.store-item-inner {
	background-color: #101010;
	height: 100%;
	width: 100%;
	padding: 10px;
	border-radius: 5px;
}
.store-image {
	width: 100%;
	height: 200px;
	background-color: grey;
}
.store-header {
	font-weight: bold;
	font-size: 15px;
	margin-top: 15px;
	margin-bottom: 15px;
}
.store-content {
	font-size: 12px;
}
.store-buy {
    width: 100%;
    height: 60px;
    background-color: var(--theme-color);;
    position: relative;
    text-align: center;
    font-weight: bold;
	border-radius: 5px;
    color: #000;
	border-style: none;
}
@media (max-width: 768px) {
	.store-item {
		width: 50% !important;
	}
}
@media (max-width: 576px) {
	.store-item {
		width: 100% !important;
	}
}
</style>
<?php require PATH . '/theme/view/common/header.php';?>

<?php
        $Listings = $this->db->from(null,'
            SELECT
            *
            FROM store
            ORDER BY store.id DESC')
            ->all();

?>

<div class="flex-fill">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?php echo APP;?>"><?php echo __('Home');?></a></li>
            <li class="breadcrumb-item active" aria-current="page"><?php echo __('Store');?></li>
        </ol>
    </nav>
    <?php echo ads($Ads,3,'mb-3');?>
    <div class="d-flex">        
        <div class="app-content">
            <div class="app-section">
                <div class="mb-3">
                    <div class="text-24 text-white font-weight-bold"><?php echo __('Store');?></div>
                </div>
                    <?php foreach ($Listings as $Listing) { ?>
	       	    	<div style="height:auto">
				<div class="store-item">
					<div class="store-item-inner">
						<div class="store-image" style="background-color: #000;background-image: url(<?php echo $Listing['image']; ?>);background-size: cover;background-position: center center;">
                        			</div>
                       				<div class="store-header">
		          				<?php echo $Listing['product']; ?>
                       				</div>
                        			<div class="store-content">
							<?php echo $Listing['description']; ?>
						</div>
						<form style="position: absolute;bottom: 5px;width: 90%;" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
							<input type="hidden" name="cmd" value="_xclick">
							<input type="hidden" name="business" value="<?php echo get($Settings, 'data.paypal_email', 'store'); ?>">
							<input type="hidden" name="lc" value="US">
							<input type="hidden" name="item_name" value="<?php echo $Listing['product']; ?>">
							<input type="hidden" name="amount" value="<?php echo $Listing['price']; ?>">
                    		<input type="hidden" name="return" value="<?php echo $Listing['return_url']; ?>">
							<input type="hidden" name="currency_code" value="<?php echo get($Settings, 'data.currency', 'store'); ?>">
							<input type="hidden" name="button_subtype" value="services">
							<input type="hidden" name="no_note" value="0">
							<input type="hidden" name="shipping" value="0.0">
							<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
							<div class="store-buy">
								<button class="store-buy"  border="0" name="submit">Buy now - $<?php echo $Listing['price']; ?></button>
                        				</div>
						</form>					
					</div>
				</div>
			</div>
                    <?php } ?>
            	</div>
            </div>
        </div>
    </div>
</div>
<?php require PATH . '/theme/view/common/footer.php';?>
