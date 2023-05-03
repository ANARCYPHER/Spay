<div class="form-group">
    <label class="custom-label"><?php echo __('Sliding Menu');?></label>
    <div class="switch-container">
        <label class="switch"><input name="data[<?php echo $key?>][slidingmenu]" type="checkbox" value="1" <?php if(get($Settings,'data.slidingmenu',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Sliding Menu');?></label>
    </div>
</div> 
<div class="form-group">
    <label class="custom-label"><?php echo __('Show Menu Icon');?></label>
    <div class="switch-container">
        <label class="switch"><input name="data[<?php echo $key?>][menuicon]" type="checkbox" value="1" <?php if(get($Settings,'data.menuicon',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Show Menu Icon');?></label>
    </div>
</div>
<div class="form-group">
    <label class="custom-label">Menu:</label>
    <div class="switch-container">
        <label class="switch"><input name="data[<?php echo $key?>][movie]" type="checkbox" value="1" <?php if(get($Settings,'data.movie',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Movies');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][serie]" type="checkbox" value="1" <?php if(get($Settings,'data.serie',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Shows');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][anime]" type="checkbox" value="1" <?php if(get($Settings,'data.anime',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Anime');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][actors]" type="checkbox" value="1" <?php if(get($Settings,'data.actors',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Actors');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][channels]" type="checkbox" value="1" <?php if(get($Settings,'data.channels',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('TV Channels');?></label>
	</div>
</div>
<div class="form-group">        
	<label class="custom-label">Discovery:</label>
    <div class="switch-container">
        <label class="switch"><input name="data[<?php echo $key?>][discovery]" type="checkbox" value="1" <?php if(get($Settings,'data.discovery',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Discovery');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][categories]" type="checkbox" value="1" <?php if(get($Settings,'data.categories',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Categories');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][trending]" type="checkbox" value="1" <?php if(get($Settings,'data.trending',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Trending');?></label>
       	<label class="switch ml-4"><input name="data[<?php echo $key?>][collections]" type="checkbox" value="1" <?php if(get($Settings,'data.collections',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Collections');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][playlists]" type="checkbox" value="1" <?php if(get($Settings,'data.playlists',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Playlists');?></label>
    	<label class="switch ml-4"><input name="data[<?php echo $key?>][request]" type="checkbox" value="1" <?php if(get($Settings,'data.request',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Request');?></label>
    	<label class="switch ml-4"><input name="data[<?php echo $key?>][requests]" type="checkbox" value="1" <?php if(get($Settings,'data.requests',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Requests');?></label>
    </div>
</div>      
<div class="form-group">        
	<label class="custom-label">Store:</label>
    <div class="switch-container">
        <label class="switch"><input name="data[<?php echo $key?>][store]" type="checkbox" value="1" <?php if(get($Settings,'data.store',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Store');?></label>
    </div>
</div>       
<div class="form-group">
    <label class="custom-label"><?php echo __('Pages:');?></label>
    <div class="switch-container">
        <label class="switch"><input name="data[<?php echo $key?>][showpages]" type="checkbox" value="1" <?php if(get($Settings,'data.showpages',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Show Pages');?></label>
    </div>
</div>
<div class="form-group">        
	<label class="custom-label">Social:</label>
    <div class="switch-container">
        <label class="switch"><input name="data[<?php echo $key?>][facebook]" type="checkbox" value="1" <?php if(get($Settings,'data.facebook',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Facebook');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][twitter]" type="checkbox" value="1" <?php if(get($Settings,'data.twitter',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Twitter');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][instagram]" type="checkbox" value="1" <?php if(get($Settings,'data.instagram',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Instagram');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][youtube]" type="checkbox" value="1" <?php if(get($Settings,'data.youtube',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('YouTube');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][discord]" type="checkbox" value="1" <?php if(get($Settings,'data.discord',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Discord');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][reddit]" type="checkbox" value="1" <?php if(get($Settings,'data.reddit',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Reddit');?></label>
    	<label class="switch ml-4"><input name="data[<?php echo $key?>][tiktok]" type="checkbox" value="1" <?php if(get($Settings,'data.tiktok',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('TikTok');?></label>
	</div>
</div> 
<div class="form-group">        
	<label class="custom-label">RSS Feeds:</label>
    <div class="switch-container">
        <label class="switch"><input name="data[<?php echo $key?>][movies_feed]" type="checkbox" value="1" <?php if(get($Settings,'data.movies_feed',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Movies RSS Feed');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][series_feed]" type="checkbox" value="1" <?php if(get($Settings,'data.series_feed',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Shows RSS Feed');?></label>
        <label class="switch ml-4"><input name="data[<?php echo $key?>][episode_feed]" type="checkbox" value="1" <?php if(get($Settings,'data.episode_feed',$key)=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Episodes RSS Feed');?></label>
	</div>
</div>   