<?php



defined('BASEPATH') or exit('No direct script access allowed');


class Api extends Controller
{
	public function process()
	{
		$AuthUser 	= $this->getVariable("AuthUser");
		$Route 		= $this->getVariable("Route");
		$this->{$Route->params->api}();
	}
	
	public function tmdb() { 
        $Route 		= $this->getVariable("Route"); 
        $Settings 		= $this->getVariable("Settings"); 
        if($Route->params->action == 'auto') { 
        
			$page 			= $_GET['page'];
        	$multiplier 	= $page * '100';

            $Posts = $this->db->from('posts')->where('type','serie')->limit($multiplier,'100')->all();
        	foreach ($Posts as $Post) { 
 
	            // Guzzle Get
	            $Client     = new \GuzzleHttp\Client();
	            $Response   = $Client->request(
	                'GET', 
	                'https://api.themoviedb.org/3/tv/'.$Post['imdb_id'].'?api_key=' . get($Settings,'data.tmdb_api','api') . '&language='.get($Settings,'data.tmdb_language','api')
	            );
	            $Listing    = json_decode($Response->getBody() , true);

	            // Season
                $iSeason = 1;
                foreach ($Listing['seasons'] as $Season) {
					if($Season['season_number'] == 0) { continue; }
            		$CheckSeason = $this->db->from('posts_season')->where('content_id',$Post['id'])->where('name',$Season['season_number'])->first();

                    if(empty($CheckSeason['id'])) {
                    	$dataarray = array(
                        	"content_id"        => $Post['id'],
                        	"name"              => $Season['season_number']
                        );
                        $this->db->insert('posts_season')->set($dataarray);

                        $SeasonId = $this->db->lastId();
                    } else {
                    	$SeasonId = $CheckSeason['id'];
                    }

                    $iSeason++;

                    $SeasonNumber = Input::cleaner(filter_var(trim($Season['season_number']), FILTER_SANITIZE_NUMBER_INT));
                  // echo "<h2>This is test - 78 !</h2>";die;
                    // Episode
                    $Episodes   = $Client->request(
                    
                    'GET', 
                    'https://api.themoviedb.org/3/tv/' . $Post['imdb_id'] . '/season/'.$Season['season_number'].'?api_key=' . get($Settings,'data.tmdb_api','api') . '&language='.get($Settings,'data.tmdb_language','api')
                    );
                    $Episodes   = json_decode($Episodes->getBody() , true);
                    foreach ($Episodes['episodes'] as $Episode) {
						if($Episode['episode_number'] == 0) { continue; }
            			$CheckEpisode = $this->db->from('posts_episode')->where('content_id',$Post['id'])->where('season_id',$SeasonId)->where('name',Input::cleaner($Episode['episode_number']))->first();
            			if(empty($CheckEpisode)) {
                        
                        	if($Episode['air_date'] == null) { continue; }
                        
                            $Image = 'https://image.tmdb.org/t/p/original/'.$Episode['still_path'];
                     
	                        $Data = array(
		                        'name'          	=> Input::cleaner($Episode['episode_number']),
		                        'self'          	=> Input::seo($Episode['episode_number']), 
		                        'description'   	=> Input::cleaner($Episode['name']),
		                        'season_id'     	=> $SeasonId,
		                        'content_id'    	=> $Post['id'],
                                'release_date'    	=> $Episode['air_date'],
		                        'image'         	=> $Image,
		                        'status'        	=> 1,
		                        'created'       	=> date('Y-m-d H:i:s')
	                        );
	                        $this->db->insert('posts_episode')->set($Data);
                        
                            $EpisodeId = $this->db->lastId(); 
                                
                            $SiteLink = base64_decode('aHR0cHM6Ly9yZW1vdGVzdHJlLmFtL2UvP3RtZGI9'); 
				   			$Apikey = base64_decode('JmFwaWtleT0=');  
				   			$SeasonNumber = base64_decode('JnM9');     
				   			$EpisodeNumber = base64_decode('JmU9');                               	

                    		$EpisodeVideo = array(
                        		'content_id'    => $Post['id'],
                        		'episode_id'    => $EpisodeId,
                        		'name'          => 'Watch Now',
                        		'service_id'    => '0',
                        		'language_id'   => '0',
                        		'player'   		=> '0',
                        		'embed'       	=> $SiteLink . "" . $Listing['id'] . "" . $SeasonNumber . "" . $Season['season_number'] . "" . $EpisodeNumber . "" . $Episode['episode_number'] . "" . $Apikey . "" . get($Settings,'data.remotestream','api') . "",
                        		'sortable'      => '0'
                    		);
                    		$this->db->insert('posts_video')->set($EpisodeVideo); 
                        
                			echo $Post['title'] . ' - Season ' . $Season['season_number'] . ': Episode ' . $Episode['episode_number'] . '<br>';
						}
                    }
                }
        	}
        }
	}
}