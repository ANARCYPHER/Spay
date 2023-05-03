<div class="form-group">
    <label class="custom-label"><?php echo __('PayPal Email Address');?></label>
    <input type="text" name="data[<?php echo $key?>][paypal_email]" value="<?php echo get($Settings,'data.paypal_email', $key);?>" class="form-control" placeholder="<?php echo __('PayPal Email Address');?>" maxlength="255">
</div>
<div class="form-group">
    <label class="custom-label"><?php echo __('PayPal Currency');?></label>
    <select name="data[<?php echo $key?>][currency]" class="custom-select">
        <option value="USD" <?php if(get($Settings,'data.currency',$key) == 'USD') echo 'selected';?>>US Dollar</option>
        <option value="EUR" <?php if(get($Settings,'data.currency',$key) == 'EUR') echo 'selected';?>>Euro</option>
        <option value="GBP" <?php if(get($Settings,'data.currency',$key) == 'GBP') echo 'selected';?>>Pound Sterling</option>
    </select>
</div>