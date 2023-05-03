<div class="form-group">
    <label class="custom-label"><?php echo __('Product Name');?></label>
    <input type="text" name="product" class="form-control form-control-lg" placeholder="<?php echo __('Product');?>" required="true" value="<?php echo $Listing['product'];?>">
</div>
<div class="form-group">
    <label class="custom-label"><?php echo __('Image URL');?></label>
    <input type="text" name="image" class="form-control form-control-lg" placeholder="<?php echo __('Image URL');?>" required="true" value="<?php echo $Listing['image'];?>">
</div>
<div class="form-group">
    <label class="custom-label"><?php echo __('Description');?></label>
    <textarea name="description" class="form-control" placeholder="<?php echo __('Description');?>"><?php echo $Listing['description']; ?></textarea>
</div>
<div class="row">
    <div class="col-md-3">
        <div class="form-group">
            <label class="custom-label"><?php echo __('Price');?></label>
            <input type="text" name="price" class="form-control" placeholder="<?php echo __('Price');?>" value="<?php echo $Listing['price']; ?>">
        </div>
    </div>
</div>