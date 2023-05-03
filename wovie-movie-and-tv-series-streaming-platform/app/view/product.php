<?php require PATH . '/view/common/header.php';?>
<form method="post" autocomplete="off" enctype="multipart/form-data" class="form-content">
    <div class="d-md-flex">
        <div class="flex-fill">
            <input type="hidden" name="_ACTION" value="save">
            <input type="hidden" name="_FORMTOKEN" value="<?php echo $Token; ?>">
            <div class="form-group">
                <label class="custom-label">
                    <?php echo __('Product Name');?></label>
                <input type="text" name="product" class="form-control form-control-lg" placeholder="<?php echo __('Product Name');?>" value="<?php echo $Listing['product'];?>" maxlength="255" autofocus="true">
            </div>   
            <div class="form-group">
                <label class="custom-label">
                    <?php echo __('Image URL');?></label>
                <input type="text" name="image" class="form-control form-control-lg" placeholder="<?php echo __('Image URL');?>" value="<?php echo $Listing['image'];?>" maxlength="255" autofocus="true">
            </div>
            <div class="form-group">
                <label class="custom-label">
                    <?php echo __('Description');?></label>
                <textarea name="description" class="form-control" placeholder="<?php echo __('Description');?>"><?php echo $Listing['description']; ?></textarea>
            </div>
            <div class="alert bg-warning-lt text-12 mt-3 mb-1" style="margin-bottom:10px;">
                HTML Code is accepted for the description.
            </div>
            <div class="form-group">
                <label class="custom-label">
                    <?php echo __('Price');?></label>
                <input type="text" name="price" class="form-control" placeholder="<?php echo __('Price');?>" value="<?php echo $Listing['price'];?>" maxlength="255" autofocus="true">
            </div>
            <div class="form-group">
                <label class="custom-label">
                    <?php echo __('Product');?></label>
                <select name="return_url" class="custom-select" required>
                  	<option value="">
                      	<?php echo __('Select One');?>
                    </option>
                  	<option value="<?php echo APP; ?>">
                      	<?php echo __('Nothing (Donation)');?>
                    </option>
                  	<option value="https://sandbox.watcha.movie/zat6lfinVoTMYmNJkKqpbE687tKEDUSJcNTrsyuD2.php">
                      	<?php echo __('1 Month Premium');?>
                    </option>
                  	<option value="https://sandbox.watcha.movie/zBzyhA14mOKUGa6FUUksWqoPv72nNCGpuDwt6O9IM.php">
                      	<?php echo __('6 Months Premium');?>
                    </option>
                    <option value="https://sandbox.watcha.movie/zRoPe4elYlwIl25veADfKqjztN0S1R1P3MY5I1L8K.php">
                        <?php echo __('12 Months Premium');?>
                    </option>
                    <option value="https://sandbox.watcha.movie/zVoPe4elYlwIl85veAAfKqjztN0S1R1P3M8gQ1L8K.php">
                        <?php echo __('Lifetime Premium');?>
                    </option>
               	</select>
            </div>
            <button type="submit" class="btn btn-theme" style="width:250px;">
                <?php echo __('Save Changes');?></button>
        </div>
    </div>
</form>
<?php require PATH . '/view/common/footer.php';?>