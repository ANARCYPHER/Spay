<?php require PATH . '/view/common/header.php';?>
<form method="post" autocomplete="off" enctype="multipart/form-data" class="form-content">
    <input type="hidden" name="_ACTION" value="save">
    <input type="hidden" name="_FORMTOKEN" value="<?php echo $Token; ?>">
    
    <div class="d-md-flex">
        <div class="flex-fill">
            <div class="form-group">
                <label class="custom-label"><?php echo __('Episode');?> <?php echo __('Number');?></label>
                <input type="number" name="name" class="form-control" placeholder="<?php echo __('Episode');?> <?php echo __('Number');?>" required="true" value="<?php echo $Listing['name'];?>">
            </div>
            <div class="form-group">
                <label class="custom-label"><?php echo __('Episode');?> <?php echo __('Title');?></label>
                <input type="text" name="description" class="form-control" placeholder="<?php echo __('Episode');?> <?php echo __('Title');?>" value="<?php echo $Listing['description'];?>">
            </div>

            <div class="form-group">
                <label class="custom-label"><?php echo __('Episode');?> <?php echo __('Description');?></label>
                <textarea name="overview" class="form-control" placeholder="<?php echo __('Episode');?> <?php echo __('Description');?>"><?php echo $Listing['overview']; ?></textarea>
            </div>
            <div class="form-group">
                <label class="custom-label"><?php echo __('Download URL');?></label>
                <input type="text" name="download" class="form-control" placeholder="<?php echo __('Download URL');?>" value="<?php echo $Listing['download'];?>">
            </div>

            <?php require PATH . '/view/common/episode.videos.php';?>
        </div>
        <div class="app-aside-right">

            <div class="form-group">
                <div class="media-select media media-episode" style="background-image: url(<?php echo $Listing['image']; ?>);"></div>
                <label class="custom-label" style="margin-top:10px;"><?php echo __('Cover Image URL');?></label>
                <input type="text" name="image" class="form-control" value="<?php echo $Listing['image']; ?>">
            </div> 
            <div class="form-group">
                <label class="custom-label" style="margin-top:10px;"><?php echo __('Air Date');?></label>
                <input type="text" name="release_date" class="form-control" value="<?php echo $Listing['release_date']; ?>">
            </div> 
            <div class="form-group">
                <label class="custom-label"><?php echo __('Season');?></label>
                <select name="season_id" class="custom-select" placeholder="Sezon" required="true">
                    <option value=""><?php echo __('Season');?></option>
                    <?php foreach ($Seasons as $Season) { ?>
                    <option value="<?php echo $Season['id'];?>" <?php if($Season['id']==$Listing['season_id']) echo 'selected=""' ;?>>
                        <?php echo $Season['name'];?>
                    </option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group">
                <div class="switch-container">
                    <label class="switch"><input name="status" type="checkbox" value="1" <?php if($Listing['status']=='1' || !$Listing['status']) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Active');?></label>
                </div>
                <div class="switch-container">
                    <label class="switch"><input name="featured" type="checkbox" value="1" <?php if($Listing['featured']=='1' ) echo 'checked="true"' ;?>><span class="switch-button"></span><?php echo __('Featured');?></label>
                </div>
            </div>
            <button type="submit" class="btn btn-theme btn-lg btn-block"><?php echo __('Save Changes');?></button>
        </div>
    </div>
</form> 
<?php require PATH . '/view/common/footer.php';?>