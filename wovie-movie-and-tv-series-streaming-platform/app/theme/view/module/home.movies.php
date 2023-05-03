<div class="app-section">
    <div class="app-heading">
        <div class="text">
            Newest Shows
        </div>
        <a href="<?php echo APP.'/shows';?>" class="all">
            <?php echo __('All');?></a>
    </div>
<?php if($ModuleData['mobile_slider'] == '1') { ?>
		<style>
			@media only screen and (max-width: 981px) {
				.mobile_slide_series {
    				overflow-x: auto;
    				flex-wrap: nowrap;
				}
			}
		</style>
	<?php } ?>
	<?php if($ModuleData['desktop_slider'] == '1') { ?>
		<style>
			@media only screen and (min-width: 981px) {
				.mobile_slide_series {
    				overflow-x: auto;
    				flex-wrap: nowrap;
				}
			}
		</style>
	<?php } ?>
<div class="row row-cols-5 mobile_slide_series mobile_slide">
        <?php  
        if(!$ModuleData['sorting']) {
            $OrderBy = 'id DESC';
        }else{
            $OrderBy = $ModuleData['sorting'];
        }
    	if($AuthUser['account_type'] == 'admin' OR $AuthUser['account_type'] == 'donator') {
        	$datalimit = $HomeModule['data_limit'];
        } else {
        	$datalimit = $HomeModule['data_limit'];
        }
        $Newests = $this->db->from(null,'
            SELECT 
            posts.id, 
            posts.title, 
            posts.title_sub, 
            posts.self, 
            posts.type, 
            posts.anime, 
            posts.image, 
            posts.create_year,
            posts.quality,
            posts.imdb,
            posts.end_year,
            posts.mpaa,
            posts.description,
            posts.data,
            posts.created,
            categories.name,
            categories.self as category_self
            FROM `posts` 
            LEFT JOIN posts_category ON posts_category.content_id = posts.id  
            LEFT JOIN categories ON categories.id = posts_category.category_id  
            WHERE posts.type = "serie" AND posts.status = "1" AND posts.anime = "2"
            GROUP BY posts_category.content_id
            ORDER BY posts.'.$ModuleData['sorting'].'
            LIMIT 0,'.$datalimit)
            ->all();
        	foreach ($Newests as $Newest) {
        	?>
        <div class="col">
            <div class="list-movie">
                <a href="<?php if($Newest['type'] == 'serie') { echo APP. '/show/'; } else { echo '/movie/'; } echo $Newest['self'] . '-' . $Newest['create_year']?>" class="list-media">
                    <?php if($Newest['quality'] || $Newest['imdb']) { ?>
                    <div class="list-media-attr">
                        <?php if($Newest['quality']) { ?>
                        <div class="quality">
                            <?php echo $Newest['quality'];?>
                        </div>
                        <?php } ?>
                        <?php if($Newest['imdb']) { ?>
                        <div class="imdb">
                            <span>
                                <?php echo $Newest['imdb'];?></span>
                            <svg x="0px" y="0px" width="36px" height="36px" viewBox="0 0 36 36">
                                <circle fill="none" stroke-width="1" cx="18" cy="18" r="16" stroke-dasharray="<?php echo round($Newest['imdb'] / 10 * 100);?> 100" stroke-dashoffset="0" transform="rotate(-90 18 18)"></circle>
                            </svg>
                        </div>
                        <?php } ?>
                    </div>
                    <?php } ?>
                    <div class="play-btn">
                        <svg class="icon">
                            <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#play';?>" />
                        </svg>
                    </div>
                    <div class="media media-cover" style="background-image:url('<?php echo $Newest['image'];?>');">
<?php if($Newest['mpaa']) { ?><div class="media-cover mpaa"><?php echo $Newest['mpaa'];?></div><?php } ?>
		    </div>
                </a>
                <div class="list-caption">
                    <a href="<?php if($Newest['type'] == 'serie') { echo APP. '/show/'; } else { echo '/movie/'; } echo $Newest['self'] . '-' . $Newest['create_year']?>" class="list-title">
                        <?php echo $Newest['title'];?></a> 
<?php if(empty($Newest['end_year'])) { ?><div class="list-year"><?php echo $Newest['create_year'];?></div><?php } ?><?php if(!empty($Newest['end_year'])) { ?><div class="list-year"><?php echo $Newest['create_year'];?> - <?php echo $Newest['end_year'];?></div><?php } ?>
</div>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
