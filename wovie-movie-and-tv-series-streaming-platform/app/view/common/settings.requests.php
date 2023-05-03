<div class="form-group">
    <label class="custom-label"><?php echo __('Who Can Request');?></label>
    <select name="data[<?php echo $key?>][requests_permission]" class="custom-select">
        <option value="everyone" <?php if(get($Settings,'data.requests_permission',$key) == 'everyone') echo 'selected';?>>Everyone</option>
        <option value="donators" <?php if(get($Settings,'data.requests_permission',$key) == 'donators') echo 'selected';?>>Only Donators</option>
        <option value="no_one" <?php if(get($Settings,'data.requests_permission',$key) == 'no_one') echo 'selected';?>>No One</option>
    </select>
</div>
<div class="form-group">
    <label class="custom-label"><?php echo __('Disabled Request Message');?></label>
    <input type="text" name="data[<?php echo $key?>][requests_disabled]" value="<?php echo get($Settings,'data.requests_disabled', $key);?>" class="form-control" placeholder="<?php echo __('Disabled Request Message');?>" maxlength="255">
</div>