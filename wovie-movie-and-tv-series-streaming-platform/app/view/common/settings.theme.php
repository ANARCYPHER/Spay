<div class="form-group">
    <label class="custom-label"><?php echo __('General Color');?></label>
    <input type="text" name="data[<?php echo $key;?>][general]" class="form-control colorpicker" data-control="hue" value="<?php echo get($Settings, 'data.general', $key );?>">
</div>
<div class="form-group">
    <label class="custom-label"><?php echo __('Button Colors');?></label>
    <input type="text" name="data[<?php echo $key;?>][button]" class="form-control colorpicker" data-control="hue" value="<?php echo get($Settings, 'data.button', $key );?>">
</div>
<div class="form-group">
    <label class="custom-label"><?php echo __('Dashboard Colors');?></label>
    <input type="text" name="data[<?php echo $key;?>][dashboard]" class="form-control colorpicker" data-control="hue" value="<?php echo get($Settings,'data.dashboard', $key );?>">
</div>