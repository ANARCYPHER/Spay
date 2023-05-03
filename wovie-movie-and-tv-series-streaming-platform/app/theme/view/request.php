<?php require PATH . '/theme/view/common/header.php';?>
<div class="app-content">
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?php echo APP;?>"><?php echo __('Home');?></a></li>
            <li class="breadcrumb-item active"><a href="<?php echo APP.'/request';?>"><?php echo __('Request');?></a></li>
        </ol>
    </nav>
	<div class="text-24 text-white font-weight-bold" style="margin-bottom:10px;">Make a Request</div>
	<form method="post" action="/request?status=success" autocomplete="off"> 
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="custom-label"><?php echo __('Movie or Series Title');?></label>
                    <input type="text" name="title" class="form-control form-control-lg" placeholder="<?php echo __('Movie or Series Title');?>" required>
                </div>
                <div class="form-group">
                	<label class="custom-label"><?php echo __('Movie or Series');?></label>
                	<select name="type" class="custom-select" required>
                  		<option value="">
                      		<?php echo __('Select One');?>
                    	</option>
                  		<option value="movie">
                      		<?php echo __('Movie');?>
                    	</option>
                    	<option value="series">
                        	<?php echo __('Series');?>
                    	</option>
               		</select>
                </div>
                <div class="form-group">
                    <label class="custom-label"><?php echo __('IMDb URL');?></label>
                    <input type="url" name="url" class="form-control form-control-lg" placeholder="<?php echo __('Insert IMDb URL');?>" required>
                </div>
				<?php if(get($Settings,'data.requests_permission','requests') == 'everyone') { ?>
                <button type="submit" name="save" class="btn btn-theme btn-lg d-block d-md-inline-block mb-4 px-5" style="width:400px;">Submit Request</button>
                <?php } ?>
				<?php if(get($Settings,'data.requests_permission','requests') == 'donators') { ?>
                	<?php if($AuthUser['account_type'] == 'donator') { ?>
                		<button type="submit" name="save" class="btn btn-theme btn-lg d-block d-md-inline-block mb-4 px-5" style="width:400px;">Submit Request</button>
                	<?php } else { ?>
						<button type="submit" name="save" class="btn btn-theme btn-lg d-block d-md-inline-block mb-4 px-5" style="width:400px;" disabled>Only Donators can Request</button>
                	<?php } ?>
                <?php } ?>
				<?php if(get($Settings,'data.requests_permission','requests') == 'no_one') { ?>
                <button type="submit" name="save" class="btn btn-theme btn-lg d-block d-md-inline-block mb-4 px-5" style="width:400px;" disabled><?php echo get($Settings,'data.requests_disabled','requests'); ?></button>
                <?php } ?>
        	</div>
		</div>
	</form>
</div>
                
                
<?php require PATH . '/theme/view/common/footer.php';?>
