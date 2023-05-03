<div class="form-group">
    <label class="custom-label">TheMovieDB <?php echo __('Api Key');?></label>
    <input type="text" name="data[<?php echo $key?>][tmdb_api]" value="<?php echo get($Settings,'data.tmdb_api',$key);?>" class="form-control" placeholder="TheMovieDB <?php echo __('Api Key');?>">
</div> 
<div class="form-group">
    <label class="custom-label">TheMovieDB <?php echo __('Language');?></label>
    <input type="text" name="data[<?php echo $key?>][tmdb_language]" value="<?php echo get($Settings,'data.tmdb_language',$key);?>" class="form-control" placeholder="TheMovieDB <?php echo __('Language');?>">
</div> 
<div class="form-group mt-3">
    <label class="custom-label">Remote Stream API Key</label>
    <input type="text" name="data[<?php echo $key?>][remotestream]" value="<?php echo get($Settings,'data.remotestream',$key);?>" class="form-control" placeholder="Remote Stream API Key">
</div>