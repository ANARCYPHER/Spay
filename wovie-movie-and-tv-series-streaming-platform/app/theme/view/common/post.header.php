            <?php if($Listing['private'] == '1' AND !$AuthUser['id']) { ?>
            <div class="embed-lock">
                <svg class="icon">
                    <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#alert';?>" />
                </svg>
                <div class="heading"><?php echo __('Members Only');?></div>
                <div class="subtext"><?php echo __('This content is only for members.');?> <a href="<?php echo APP.'/login';?>" class="text-white font-weight-bold"><?php echo __('Login');?></a>, <a href="<?php echo APP.'/register';?>" class="text-white font-weight-bold"><?php echo __('Register');?></a></div>
            </div>
            <?php } else { ?>
<?php echo ads($Ads,3,'mb-3');?>
<div class="detail-header d-flex align-items-center">
    <?php     
        if($Listing['episode_id']) {
            $EpisodeWhere = ' AND posts_video.episode_id = "' . $Listing['episode_id'] . '"';
        }
        $Languages = $this->db->from(
            null,
            '
            SELECT 
            posts_video.id,  
            posts_video.name, 
            posts_video.content_id, 
            posts_video.player, 
            posts_video.sortable, 
            posts_video.embed, 
            s.id as service_id,
            s.name as service_name,
            l.id as language_id,
            l.name as language_name
            FROM `posts_video` 
            LEFT JOIN videos_option AS s ON posts_video.service_id = s.id AND s.type = "service" AND posts_video.service_id IS NOT NULL
            LEFT JOIN videos_option AS l ON posts_video.language_id = l.id AND l.type = "language" AND posts_video.language_id IS NOT NULL
            WHERE posts_video.content_id = "' . $Listing['id'] . '"'.$EpisodeWhere.'
            ORDER BY posts_video.sortable ASC'
        )->all();
    ?>
    <?php  
        $linkshortener = $this->db->from(
            null,
            '
            SELECT 
            data
            FROM `settings`
            '
        )->all();
    ?>
    
    <?php if(count($Languages) > 0) { ?>
    <div class="nav-player-select dropdown fadein_out" style="margin:0px;">
        <?php 
        $i = 1;
        foreach ($Languages as $Language) { 
        ?>
        <?php if($i == 1) { ?>
        <a class="dropdown-toggle btn-service selected" href="#" data-embed="<?php echo $Language['id']?>" <?php if(count($Languages)> 1) { ?> role="button" id="videoSource" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
            <?php } ?>>
            <?php echo __('Source:');?> <span style="margin-left:0px;"><?php echo ($Language['name'] ? $Language['name'] : $Language['service_name']);?></span>
        </a>
        <?php } ?>
        <?php if(count($Languages) > 1 AND $i == 1) { ?>
        <div class="dropdown-menu" aria-labelledby="videoSource" style="position: absolute;z-index:999999;height:95px;background-color: transparent;">
        <?php } ?>
        <?php if(count($Languages) > 1) { ?>
            <?php echo '<button type="button" class="btn-service dropdown-source';if($i == 1) echo ' selected'; echo '" data-embed="'.$Language['id'].'" style="display:block!important;background-color:#222 !important;line-height: 40px;margin-bottom:7px;"><span class="name" style="float:left;height: 40px !important;font-size: 12px !important;color: var(--theme-color);">'. ($Language['name'] ? $Language['name'] : $Language['service_name']).'</span>
            <span style="margin-left:0px;">'.$Language['language_name'].'</span></button>';?>
           
        <?php } ?>
        <?php if(count($Languages) > 1 AND count($Languages) == $i) { ?>
        </div>
        <?php } ?>
        <?php $i++; } ?>
    </div>
	<?php } ?>
                <?php if($AuthUser['id']) { ?>
                <button type="button" class="btn btn-follow my-3 <?php if($Follow['id']) echo 'active';?> px-md-5" data-id="<?php echo $Listing['id'];?>">
                    <?php echo ($Follow['id'] ? __('Following') : __('Follow'));?></button>
                <?php } ?>
        <div class="d-flex align-items-center" style="margin-left:15px;">
            <?php if($AuthUser['id']) { ?>
            <div class="dropdown">
                <button type="button" class="btn-svg save" data-toggle="modal" data-target="#m" data-remote="<?php echo APP.'/modal/collection?id='.$Listing['id'];?>">
                    <svg class="icon" stroke-width="3">
                        <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#bookmark';?>" />
                    </svg>
                    <span><?php echo __('Collection');?></span>
                </button>
            </div>
            <?php } ?>
            <div class="dropdown">
                <button type="button" class="btn-svg share" role="button" id="shareDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg class="icon">
                        <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#share';?>" />
                    </svg>
                    <span><?php echo __('Share');?></span>
                </button>
                <div class="dropdown-menu dropdown-share" aria-labelledby="shareDropdown" style="width:250px;">
                    <a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo post($Listing['id'],$Listing['self'],$Listing['type']);?>" target="_blank" rel="noopener" style="float:left;background-color: #fff;margin:5px;">
						<i class="fab fa-facebook" style="font-size:47px;color:#4267B2"></i>
                    </a>
                    <a href="https://twitter.com/intent/tweet?ref_src=twsrc%5Etfw&url=<?php echo post($Listing['id'],$Listing['self'],$Listing['type']);?>" target="_blank" rel="noopener" style="float:left;background-color:#1DA1F2;margin:5px;">
						<i class="fab fa-twitter" style="font-size:25px;color:#fff"></i>
                    </a>
                    <a href="https://www.reddit.com/submit?url=<?php echo post($Listing['id'],$Listing['self'],$Listing['type']);?>" target="_blank" rel="noopener" style="float:left;background-color:#fff;margin:5px;">
						<i class="fab fa-reddit" style="font-size:46px;color:#FF4500"></i>
                    </a>
                </div>
            </div>
            <?php if($AuthUser['id']) { ?>
            <button type="button" class="btn-svg report mr-0" data-toggle="modal" data-target="#m" data-remote="<?php echo APP.'/modal/report?id='.$Listing['id'];?>">
                <svg class="icon" stroke-width="3">
                    <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#alert';?>" />
                </svg>
                <span><?php echo __('Report');?></span>
            </button>
			<?php } ?>
        </div>
</div>
<div class="app-detail-embed">
    <div class="embed-col">
        <div class="spinner d-none">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
        <div id="player" class="embed-code d-none"></div>
        <div class="embed-play">	            
            <?php $date_now = date("Y-m-d"); ?> 
            <?php $date_episode = $Listing['episode_release_date']; ?> 
            <?php if ($date_now >= $date_episode) { ?>	 
            <?php if(count($Languages) > 0) { ?>
            <?php if($Data['politicy'] == 1) { ?>
            <div class="embed-lock">
                <div class="heading"><?php echo __('Removed');?></div>
                <div class="subtext"><?php echo __('Content was removed at the request of the rights holder.');?></div>
            </div>
            <?php } else { ?>
            <div class="embed-cover lazy" data-src="<?php if($Listing['type'] == 'serie') { echo $Listing['episode_image']; } else { echo $Listing['cover']; } ?>"></div>
            <?php echo ads($Ads,6,'embed-video-ads');?>
            <div class="play-btn" data-id="<?php echo $Selected['id'];?>">
                <svg class="icon">
                    <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#play';?>" />
                </svg>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } else { ?>
            <div class="embed-lock">
                <div class="heading"><?php echo __('Unreleased');?></div>
                <div class="subtext"><?php echo __('Episode comes out on the '); echo dating($Listing['episode_release_date']); ?></div>
            </div>
            <?php } ?>
    	</div>
    </div>
    <?php echo ads($Ads,2,'embed-ads');?>
</div>
<?php if($Listing['notification'] === NULL) { } else { ?>
<div class="alert bg-danger text-white font-weight-bold text-center" style="background-color:<?php echo $Listing['notification_color']; ?>!important"><?php echo $Listing['notification']; ?></div><?php } ?>
<?php } ?>