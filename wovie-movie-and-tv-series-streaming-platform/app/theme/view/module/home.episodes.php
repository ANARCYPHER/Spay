<div class="app-section">
    <div class="app-heading">
        <div class="text">
            <?php echo $HomeModule['name'];?>
        </div>
    </div>
    <div class="row 
    <?php if($ModuleData['listing'] == 'v2') { echo 'row-cols-1 row-cols-md-4 '; } else { echo ' row-cols-2 row-cols-md-5';}?>
    <?php if($ModuleData['responsive'] == 'horizontal') echo 'list-scrollable';?>">
        <?php  
        if(!$ModuleData['sorting']) {
            $OrderBy = 'id DESC';
        }else{
            $OrderBy = $ModuleData['sorting'];
        }
        $Newests = $this->db->from(null,'
            SELECT 
            posts_episode.name as episode_name, 
            posts_episode.image as episode_image, 
            posts_season.name as season_name, 
            posts.id, 
            posts.title, 
            posts.self, 
            posts.image, 
            posts.cover, 
            posts.create_year,
            posts.imdb,
            posts_episode.created,
            posts_episode.featured
            FROM `posts_episode` 
            LEFT JOIN posts ON posts_episode.content_id = posts.id  
            LEFT JOIN posts_season ON posts_season.id = posts_episode.season_id  
            WHERE posts.type = "serie" AND posts.status = "1" 
            ORDER BY posts_episode.'.$ModuleData['sorting'].'
            LIMIT 0,'.$HomeModule['data_limit'])
            ->all();
        foreach ($Newests as $Newest) {
        ?>
        <div class="col"> 
            <a href="<?php echo APP . '/episode/'. $Newest['self'] .'-'. $Newest['create_year'] . '/season-' . $Newest['season_name'] . '-episode-' . $Newest['episode_name'];?>" class="list-movie 
            <?php if($Newest['featured'] == '1') echo 'list-featured';?>
            <?php if($ModuleData['listing'] == 'v2') echo 'list-episode';?>">
                <div class="list-media">
                    <?php if($Newest['episode_image']) { ?>
                    <div class="media media-episode" style="background-image:url('<?php echo $Newest['episode_image'];?>');"></div>
                    <?php } else { ?>
                    <div class="media media-episode" style="background-image:url('<?php echo $Newest['cover'];?>');"></div>
                    <?php } ?>
                </div>
                <div class="list-caption">
                    <div class="list-title"><?php echo $Newest['title'];?></div>
                    <div class="list-category"><?php echo ''.__('Season'). ' ' . $Newest['season_name'] . ': '  .__('Episode') . ' ' . $Newest['episode_name'];?></div>
                </div>
            </a>
        </div>
        <?php } ?>
    </div>
</div>