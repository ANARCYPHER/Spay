<style>
@media only screen and (max-width: 956px) {
.app-aside {
    overflow-y: scroll;
}
}
</style>
<?php require PATH . '/theme/view/common/assets.php'; ?>
<?php if($AuthUser['account_type'] == 'admin') { } else { ?>
<?php if(get($Settings,'data.maintainence','general') == 1) { ?>
<div class="maintainence">
   <a href="<?php echo APP.'/admin';?>">
      <div class="maintainence-admin-button">
         <center>
            <?php echo __('Admin');?>
         </center>
      </div>
   </a>
   <div class="maintenance-message">
      <center>
         <h1>
            <?php echo __("We'll be back!");?>
         </h1>
         <?php echo __("View our Socials below:");?>
<br>
						<?php if(get($Settings,'data.facebook','social') == ! '') { ;?>
                        <a href="<?php echo get($Settings,'data.facebook','social');?>" target="_blank">
								<i class="fab fa-facebook-f" style="font-size:30px;padding:15px;"></i>
                    	</a>
                        <?php } ?>
						<?php if(get($Settings,'data.twitter','social') == ! '') { ;?>
                        <a href="<?php echo get($Settings,'data.twitter','social');?>" target="_blank">
								<i class="fab fa-twitter" style="font-size:30px;padding:15px;"></i>
                    	</a>
                        <?php } ?>
						<?php if(get($Settings,'data.instagram','social') == ! '') { ;?>
                        <a href="<?php echo get($Settings,'data.instagram','social');?>" target="_blank">
								<i class="fab fa-instagram" style="font-size:30px;padding:15px;"></i>
                    	</a>
                        <?php } ?>
						<?php if(get($Settings,'data.youtube','social') == ! '') { ;?>
                        <a href="<?php echo get($Settings,'data.youtube','social');?>" target="_blank">
								<i class="fab fa-youtube" style="font-size:30px;padding:15px;"></i>
                    	</a>
                        <?php } ?>
						<?php if(get($Settings,'data.discord','social') == ! '') { ;?>
                        <a href="<?php echo get($Settings,'data.discord','social');?>" target="_blank">
								<i class="fab fa-discord" style="font-size:30px;padding:15px;"></i>
                    	</a>
                        <?php } ?>
						<?php if(get($Settings,'data.reddit','social') == ! '') { ;?>
                        <a href="<?php echo get($Settings,'data.reddit','social');?>" target="_blank">
								<i class="fab fa-reddit-alien" style="font-size:30px;padding:15px;"></i>
                    	</a>
                        <?php } ?>
						<?php if(get($Settings,'data.tiktok','social') == ! '') { ;?>
                        <a href="<?php echo get($Settings,'data.tiktok','social');?>" target="_blank">
								<i class="fab fa-tiktok" style="font-size:30px;padding:15px;"></i>
                    	</a>
                        <?php } ?>
         </div>
      </center>
   </div>
</div>
<?php } ?>
<?php } ?>
<?php echo ads($Ads,5,'ads-skin');?> 
<div class="container">
    <div class="app">
        <div class="app-header">
            <div class="navbar navbar-expand-lg">
                <div class="menu d-md-none d-block" data-toggle="modal" data-target="#aside">
                    <svg class="icon">
                        <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#bars';?>" />
                    </svg>
                </div>
                <div class="app-navbar" id="app-navbar">
 					<?php if(get($Settings,'data.slidingmenu','navigation') == 0) { ?>
                    <a href="<?php echo APP;?>" class="navbar-brand">
                        <img src="<?php echo LOCAL.'/'.get($Settings,'data.logo','general').'?v='.VERSION;?>" alt="<?php echo get($Settings,'data.title','general');?>" style="height:50px;width:auto;">
                    </a>
                	<?php } ?>
 					<?php if(get($Settings,'data.slidingmenu','navigation') == 1) { ?>
                    	<div class="navbar-brand">
							<script>
								if( window.innerWidth > 960 ) {
                        			document.getElementById("app-navbar").innerHTML='<i class="fa fa-bars" aria-hidden="true" style="font-size:35px;color: var(--theme-color)"></i>';
                                } else {
                        			document.getElementById("app-navbar").innerHTML='<a href="<?php echo APP;?>" class="navbar-brand"><img src="<?php echo LOCAL.'/'.get($Settings,'data.logo','general').'?v='.VERSION;?>" alt="<?php echo get($Settings,'data.title','general');?>" style="height:50px;width:auto;"></a>';
                				}
                			</script>
                		</div>
                	<?php } ?>
					
                </div>
                <div class="search-btn d-md-none d-block">
                    <svg class="icon">
                        <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#search';?>" />
                    </svg>
                </div>
                <form class="header-search input-group d-md-block d-none" method="post" action="<?php echo APP.'/search';?>" id="navbarToggler">
                    <input type="hidden" name="_ACTION" value="search">
                    <input type="hidden" name="_TOKEN" value="<?php echo $Token;?>">
                    <div class="typeahead__container app-search">
                        <div class="typeahead__field">
                            <div class="typeahead__query">
                                <label for="search-input" class="btn px-0 mb-0" aria-label="<?php echo __('Search');?>">
                                    <svg class="icon">
                                        <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#search';?>" />
                                    </svg>
                                </label>
                                <input class="video-search form-control" name="q" type="text" id="search-input" placeholder="<?php echo __('Search');?> .." autocomplete="off">
                                <button type="button" class="btn close-btn d-md-none d-block px-0" aria-label="<?php echo __('Close');?>">
                                    <svg class="icon">
                                        <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#close';?>" />
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
                <ul class="navbar-nav navbar-user ml-auto align-items-center text-nowrap">
                    <?php if ($AuthUser['id']) { ?>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo APP.'/profile/'.$AuthUser['username'].'#collections';?>" aria-label="<?php echo __('Collections');?>">
                            <svg class="icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#bookmark';?>" />
                            </svg>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle notification-btn" href="#" role="button" id="dropdown-notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="<?php echo __('Notifications');?>">
                            <svg class="icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#bell';?>" />
                            </svg>
                        </a>
                        <div class="dropdown-menu dropdown-notification dropdown-menu-right" aria-labelledby="dropdown-notification">
                            <div class="notifications">
                                <div class="text-center">
                                    <?php echo __('Empty Notifications');?>
                                </div>
                            </div>
                            <a href="<?php echo APP.'/notifications';?>" class="all text-center">
                                <?php echo __('All');?></a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-profile dropdown-toggle pr-md-0" href="#" role="button" id="dropdown-profile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="Profile">
                            <div>
                                <?php echo gravatar($AuthUser['id'],$AuthUser['avatar'],$AuthUser['name'],'avatar avatar-sm');?>
                            </div>
                            <div class="profile-text">
                                <div class="profile-head">
                                    <?php echo __('Hello');?>,</div>
                                <div class="text-nowrap">
                                    <?php echo $AuthUser['name'];?>
                                </div>
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-profile" aria-labelledby="Dropdown Profile">
                            <?php if($AuthUser['account_type'] == 'admin' || $AuthUser['account_type'] == 'dmca manager') { ?>
                            <a class="dropdown-item" href="<?php echo APP.'/admin';?>">
                                <?php echo __('Admin panel');?></a>
                            <div class="dropdown-divider"></div>
                            <?php } ?>
                            <a class="dropdown-item" href="<?php echo APP.'/profile/'.$AuthUser['username'];?>">
                                <?php echo __('Profile');?></a>
                            <a class="dropdown-item d-flex" href="<?php echo APP.'/profile/'.$AuthUser['username'].'#collections';?>">
                                <?php echo __('Collections');?></a>
                            <a class="dropdown-item" href="<?php echo APP.'/notifications';?>">
                                <?php echo __('Notifications');?></a>
                            <a class="dropdown-item" href="<?php echo APP.'/settings';?>">
                                <?php echo __('Settings');?></a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="<?php echo APP.'/logout';?>">
                                <?php echo __('Logout');?></a>
                        </div>
                    </li>
                    <?php } else { ?>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo APP.'/register';?>" aria-label="<?php echo __('Register');?>">
                            <?php echo __('Register');?>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo APP.'/login';?>" aria-label="<?php echo __('Login');?>">
                            <?php echo __('Login');?>
                        </a>
                    </li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="app-wrapper">
 			<?php if(get($Settings,'data.slidingmenu','navigation') == 1) { ?>
			<div class="hide-me">
			<?php } ?>
            <div class="app-aside nav-aside" id="aside">
				<br /><br />
                <button class="modal-close d-md-none d-block" data-dismiss="modal">
                    <svg class="icon">
                        <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#close';?>" />
                    </svg>
                </button>
                <ul class="nav mb-3 nav-user d-md-none d-block">
                    <?php if ($AuthUser['id']) { ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-profile dropdown-toggle" href="#" role="button" id="dropdown-profile-mobile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-labelledby="Profile Mobile">
                            <?php echo gravatar($AuthUser['id'],$AuthUser['avatar'],$AuthUser['name'],'avatar avatar-sm');?>
                            <div class="profile-text">
                                <div class="profile-head">
                                    <?php echo __('Hello');?>,</div>
                                <div class="text-nowrap">
                                    <?php echo $AuthUser['name'];?>
                                </div>
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-profile" aria-labelledby="Dropdown Profile Mobile">
                            <?php if($AuthUser['account_type'] == 'admin') { ?>
                            <a class="dropdown-item" href="<?php echo APP.'/admin';?>">
                                <?php echo __('Admin panel');?></a>
                            <div class="dropdown-divider"></div>
                            <?php } ?>
                            <a class="dropdown-item" href="<?php echo APP.'/profile/'.$AuthUser['username'];?>">
                                <?php echo __('Profile');?></a>
                            <a class="dropdown-item d-flex" href="<?php echo APP.'/profile/'.$AuthUser['username'].'#collections';?>">
                                <?php echo __('Collections');?></a>
                            <a class="dropdown-item" href="<?php echo APP.'/notifications';?>">
                                <?php echo __('Notifications');?></a>
                            <a class="dropdown-item" href="<?php echo APP.'/settings';?>">
                                <?php echo __('Settings');?></a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="<?php echo APP.'/logout';?>">
                                <?php echo __('Logout');?></a>
                        </div>
                    </li>
                    <?php } else { ?>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo APP.'/register';?>" aria-label="<?php echo __('Register');?>">
                            <?php echo __('Register');?>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo APP.'/login';?>" aria-label="<?php echo __('Login');?>">
                            <?php echo __('Login');?>
                        </a>
                    </li>
                    <?php } ?>
                </ul>
                <ul class="nav">
                    <li class="nav-header">
                        <?php echo __('Menu');?>
                    </li>
                    <li <?php if(empty($Config['nav'])) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#house';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Home');?></a>
                    </li>
                    <?php if(get($Settings,'data.movie','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] == 'movies' ) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/movies';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#film';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Movies');?></a>
                    </li>
                    <?php } ?>
                    <?php if(get($Settings,'data.serie','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] == 'series') echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/shows';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#tv';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Shows');?></a>
                    </li>
                    <?php } ?>
                    <?php if(get($Settings,'data.anime','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] == 'anime') echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/anime';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#tv';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Anime');?></a>
                    </li>
                    <?php } ?>
                    <?php if(get($Settings,'data.actors','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] =='actors' ) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/actors';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#actors';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Actors');?>
                        </a>
                    </li>
                    <?php } ?>
                    <?php if(get($Settings,'data.channels','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] == 'channels') echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/tv-channels';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#tv';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('TV Channels');?></a>
                    </li>
                    <?php } ?>
                    <?php $discovery = get($Settings,'data.discovery','navigation') + get($Settings,'data.categories','navigation') + get($Settings,'data.trending','navigation') + get($Settings,'data.chat','navigation') + get($Settings,'data.collections','navigation') + get($Settings,'data.playlists','navigation') + get($Settings,'data.request','navigation') + get($Settings,'data.requests','navigation') ?>         
                	<?php if($discovery > '0') { ?>
                    <li class="nav-header">
                        <?php echo __('Discovery');?>
                    </li>
                    <?php } ?>
                    <?php if(get($Settings,'data.discovery','navigation') == 1) { ?>
                    <li <?php if($Config['nav']=='discovery' ) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/discovery';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#discovery';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Discovery');?></a>
                    </li> 
                    <?php } ?>
                    <?php if(get($Settings,'data.categories','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] =='categories' ) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/categories';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#categories';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Categories');?></a>
                    </li>
                    <?php } ?>
					<?php if(get($Settings,'data.trending','navigation') == 1) { ?>
                    <li <?php if($Config['nav']=='trends' ) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/trends';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#discovery';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Trending');?></a>
                    </li>
                    <?php } ?>
                    <?php if(get($Settings,'data.collections','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] == 'services' ) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/collections';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#collections';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Collections');?></a>
                    </li>
                    <?php } ?> 
                    <?php if(get($Settings,'data.playlists','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] == 'playlists' ) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/playlists';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            <svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#collections';?>" />
                            </svg>
                            <?php } ?>
                            <?php echo __('Playlists');?></a>
                    </li>
                    <?php } ?>      
						<?php if(get($Settings,'data.request','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] == 'request' ) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/request';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
   								<i class="nav-icon fas fa-question"></i>
                            <?php } ?>
                            <?php echo __('Got A Request ?');?></a>
                    </li>
                    <?php } ?>       
						<?php if(get($Settings,'data.requests','navigation') == 1) { ?>
                    <li <?php if($Config['nav'] == 'requests' ) echo 'class="active"' ;?>>
                        <a href="<?php echo APP.'/requests';?>">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
   								<i class="nav-icon fas fa-question-circle"></i>
                            <?php } ?>
                            <?php echo __('View Requests');?></a>
                    </li>
                    <?php } ?>              
					<?php if(get($Settings,'data.showpages','navigation') == 1) { ?>
               		 		<br />
						<li class="nav-item nav-header mt-0 pb-2"><?php echo __('Pages');?></li>
    						<?php 
            					$Pages = $this->db->from('pages')->where('status',1)->all();
            					foreach ($Pages as $Page) { 
            				?>
    					<li class="nav-item">
        					<a class="nav-link" href="<?php echo APP.'/page/'.$Page['self'];?>">
                            	<?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
                            	<svg class="nav-icon">
                                	<use xlink:href="<?php echo ASSETS.'/img/sprite.svg#chevron-right';?>" />
                            	</svg>
        						<?php } ?>
            					<?php echo $Page['name'];?>
                        	</a>
    					</li>
    						<?php } ?>
					<?php } ?>            
					<?php if(get($Settings,'data.store','navigation') == 1) { ?>
                    <li class="nav-header">
                        <?php echo __('Store');?>
                    </li>
    					<li class="nav-item">
        					<a class="nav-link" href="<?php echo APP.'/store';?>">
                            	<?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
									<i class="nav-icon fas fa-store"></i>
        						<?php } ?>
            					Store
                        	</a>
    					</li>
					<?php } ?>
 					<?php $social = get($Settings,'data.facebook','navigation') + get($Settings,'data.twitter','navigation') + get($Settings,'data.instagram','navigation') + get($Settings,'data.youtube','navigation') + get($Settings,'data.discord','navigation') + get($Settings,'data.reddit','navigation') + get($Settings,'data.tiktok','navigation') ?>         
                	<?php if($social > '0') { ?>
                    <li class="nav-header">
                        <?php echo __('Social Media');?>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.facebook','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo get($Settings,'data.facebook','social');?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
								<i class="nav-icon fab fa-facebook-f"></i>
                        	<?php } ?>
							<?php echo __('Facebook');?>
                    	</a>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.twitter','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo get($Settings,'data.twitter','social');?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
								<i class="nav-icon fab fa-twitter"></i>
                        	<?php } ?>
							<?php echo __('Twitter');?>
                    	</a>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.instagram','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo get($Settings,'data.instagram','social');?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
								<i class="nav-icon fab fa-instagram"></i>
                        	<?php } ?>
							<?php echo __('Instagram');?>
                    	</a>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.youtube','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo get($Settings,'data.youtube','social');?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
								<i class="nav-icon fab fa-youtube"></i>
                        	<?php } ?>
							<?php echo __('YouTube');?>
                    	</a>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.discord','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo get($Settings,'data.discord','social');?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
								<i class="nav-icon fab fa-discord"></i>
                        	<?php } ?>
							<?php echo __('Discord');?>
                    	</a>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.reddit','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo get($Settings,'data.reddit','social');?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
								<i class="nav-icon fab fa-reddit-alien"></i>
                        	<?php } ?>
							<?php echo __('Reddit');?>
                    	</a>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.tiktok','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo get($Settings,'data.tiktok','social');?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
								<i class="nav-icon fab fa-tiktok"></i>
                        	<?php } ?>
							<?php echo __('TikTok');?>
                    	</a>
                    </li>
                    <?php } ?>             
 					<?php $feeds = get($Settings,'data.movies_feed','navigation') + get($Settings,'data.series_feed','navigation') + get($Settings,'data.episodes_feed','navigation') ?>         
                	<?php if($feeds > '0') { ?>
                    <li class="nav-header">
                        <?php echo __('Social Media');?>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.movies_feed','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo APP.'/feeds/movies';?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
							<svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#rss';?>" />
                            </svg>
                        	<?php } ?>
							<?php echo __('Movies');?>
                    	</a>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.series_feed','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo APP.'/feeds/shows';?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
							<svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#rss';?>" />
                            </svg>
				<?php } ?>
							<?php echo __('TV Shows');?>
                    	</a>
                    </li>
                    <?php } ?>
 					<?php if(get($Settings,'data.episode_feed','navigation') == 1) { ?> 
                    <li>
                        <a href="<?php echo APP.'/feeds/episodes';?>" target="_blank">
                            <?php if(get($Settings,'data.menuicon','navigation') == 1) { ?>
							<svg class="nav-icon">
                                <use xlink:href="<?php echo ASSETS.'/img/sprite.svg#rss';?>" />
                            </svg>
			<?php } ?>
							<?php echo __('Episodes');?>
                    	</a>
                    </li>
					<?php } ?>
                </ul>
            </div>
 			<?php if(get($Settings,'data.slidingmenu','navigation') == 1) { ?>
        	</div>
			<?php } ?>
            <div class="app-container flex-fill">
                <div class="container">
