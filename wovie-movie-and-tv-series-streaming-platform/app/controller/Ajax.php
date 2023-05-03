<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ajax extends Controller
{
    public function process()
    {
        $AuthUser = $this->getVariable("AuthUser");
        $Route = $this->getVariable("Route");
        $Settings = $this->getVariable("Settings");
        $this->{$Route
            ->params->ajax}();
    }

    public function delete()
    {
        $Route = $this->getVariable("Route");
        $AuthUser = $this->getVariable("AuthUser");
        if ($Route
            ->params->action == 'avatar' and $AuthUser['id'] == $_POST['id'])
        {
            unlink(UPLOADPATH . '/user/' . $AuthUser['avatar']);
            $dataarray = array(
                "avatar" => null
            );
            $this
                ->db
                ->update('users')
                ->where('id', $AuthUser['id'])->set($dataarray);
        }
    }

    public function embed()
    {
        $AuthUser = $this->getVariable("AuthUser");
        $Settings = $this->getVariable("Settings");
    
    	        $Pisting = $this->db->from(null,'
	            SELECT 
	            posts.id, 
	            posts.title, 
	            posts.title_sub, 
                posts.description, 
				posts_episode.overview,
                posts.self, 
	            categories.name,
	            posts.image, 
                posts_episode.hit,
				posts.hit_weekly,
				posts.hit_monthly, 
				posts.notification,
				posts.notification_color,
                posts.trailer,
	            posts.status,
	            posts.imdb_id,
                posts.create_year,
				posts.end_year,
				posts.mpaa,
				posts.quality,
                posts.imdb,
                posts.type, 
	            posts.data,
                posts.comment,
	            posts.created,
                posts.duration,
                countries.name as country_name,
                posts_episode.id as episode_id,
                posts_episode.hit as episode_hit,
                posts_episode.season_id as season_id,
                posts_season.name as season_name,
                posts_episode.name as episode_name,
                posts_episode.description as episode_description,
                (SELECT 
                COUNT(reactions.content_id) 
                FROM reactions 
                WHERE reactions.reaction = "up" AND content_id = posts.id) AS likes, 
                (SELECT 
                COUNT(reactions.content_id) 
                FROM reactions 
                WHERE reactions.reaction = "down" AND content_id = posts.id) AS dislikes
	            FROM `posts` 
                LEFT JOIN posts_season ON posts.id = posts_season.content_id AND posts_season.content_id IS NOT NULL
                LEFT JOIN posts_episode ON posts_season.id = posts_episode.season_id AND posts_episode.content_id IS NOT NULL
	            LEFT JOIN posts_category ON posts_category.content_id = posts.id  
	            LEFT JOIN categories ON categories.id = posts_category.category_id  
                LEFT JOIN countries ON countries.id = posts.country  
	            WHERE posts.id = "'. $Route->params->id .'" AND posts.status = "1" AND posts_episode.name = "'.$Route->params->episode.'" AND posts_season.name = "'.$Route->params->season.'"
	            '.$OrderBy)
	            ->first();
    
        if ($_POST['id'])
        {
            $Player = $this
                ->db
                ->from(null, '
	                SELECT 
	                posts.hit,
	                posts.type,
	                posts.cover,
                    posts.imdb_id,
                    posts.hit_weekly,
                    posts.hit_monthly,
	                posts_episode.hit as episode_hit,
	                posts_video.id,  
	                posts_video.name, 
	                posts_video.content_id, 
	                posts_video.episode_id, 
	                posts_video.player, 
	                posts_video.sortable, 
	                posts_video.embed, 
	                posts.image,
	                posts.cover,
                    posts_episode.image as peimage
	                FROM `posts_video` 
                	LEFT JOIN posts ON posts_video.content_id = posts.id 
                	LEFT JOIN posts_episode ON posts_video.episode_id = posts_episode.id AND posts_video.episode_id IS NOT NULL 
	                WHERE posts_video.id = "' . $_POST['id'] . '"')->first();    
  
            if ($Player['player'] == 1) {
            	if(strtolower(end(explode(".",$Player['embed']))) =="m3u8") {
                    $html .= '<script>var player = new Playerjs({id:"player", file:[{"file":"' . $Player['embed'] . '", poster:"' . $Player['cover'] . '"}]});</script>'; 
            	}
            	if(strtolower(end(explode(".",$Player['embed']))) =="mp4") {
                    $html .= '<script>var player = new Playerjs({id:"player", file:[{"file":"' . $Player['embed'] . '", poster:"' . $Player['cover'] . '"}]});</script>'; 
            	}
            	if(strtolower(end(explode(".",$Player['embed']))) =="mkv") {
                    $html .= '<script>var player = new Playerjs({id:"player", file:[{"file":"' . $Player['embed'] . '", poster:"' . $Player['cover'] . '"}]});</script>'; 
            	}
            }
            if ($Player['player'] == 0)
            {
                $html .= '<iframe class="embed-responsive-item" src="' . $Player['embed'] . '" allowfullscreen></iframe>';
            }

	        if($Player['id']) {
            	$this->db->update('posts')->where('id',$Player['content_id'])->set(array('hit' => ($Player['hit']+1)));
            }
	        if($Player['id']) {
            	$this->db->update('posts')->where('id',$Player['content_id'])->set(array('hit_weekly' => ($Player['hit_weekly']+1)));
            }
	        if($Player['id']) {
            	$this->db->update('posts')->where('id',$Player['content_id'])->set(array('hit_monthly' => ($Player['hit_monthly']+1)));
            }
            if ($Player['episode_id'])
            {
                $this
                    ->db
                    ->update('posts_episode')
                    ->where('id', $Player['episode_id'])->set(array(
                    'hit' => ($Player['hit'] + 1)
                ));
            }
        }
        echo $html;
    }

    public function reaction()
    {
        $AuthUser = $this->getVariable("AuthUser");
        if ($AuthUser['id'])
        {
            $Vote = $this
                ->db
                ->from('reactions')
                ->where('user_id', $AuthUser['id'])->where('content_id', $_POST['id'])->first();
            if (Input::cleaner($_POST['type']) == '-up' || Input::cleaner($_POST['type']) == '-down')
            {
                $this
                    ->db
                    ->delete('reactions')
                    ->where('id', $Vote['id'], '=')->done();
            }
            elseif ($Vote['id'])
            {
                $dataarray = array(
                    "reaction" => Input::cleaner($_POST['type'])
                );
                $this
                    ->db
                    ->update('reactions')
                    ->where('id', $Vote['id'])->set($dataarray);
            }
            elseif (!$Vote['id'])
            {
                $dataarray = array(
                    "user_id" => $AuthUser['id'],
                    "content_id" => Input::cleaner($_POST['id']) ,
                    "reaction" => Input::cleaner($_POST['type'])
                );
                $this
                    ->db
                    ->insert('reactions')
                    ->set($dataarray);
            }
        }
        return true;
    }

    public function follow()
    {
        $AuthUser = $this->getVariable("AuthUser");
        if ($AuthUser['id'])
        {
            $Follow = $this
                ->db
                ->from('follows')
                ->where('user_id', $AuthUser['id'])->where('content_id', $_POST['content_id'])->first();
            if ($Follow['id'])
            {
                $this
                    ->db
                    ->delete('follows')
                    ->where('id', $Follow['id'], '=')->done();
            }
            elseif (!$Follow['id'])
            {
                $dataarray = array(
                    "user_id" => $AuthUser['id'],
                    "content_id" => Input::cleaner($_POST['content_id'])
                );
                $this
                    ->db
                    ->insert('follows')
                    ->set($dataarray);
            }
        }
        return true;
    }

    public function report()
    {
        $AuthUser = $this->getVariable("AuthUser");
        if (Input::cleaner($_POST['report_id']))
        {
            $dataarray = array(
                "report_id" => Input::cleaner($_POST['report_id']) ,
                "user" => Input::cleaner($_POST['user']) ,
                "body" => Input::cleaner($_POST['body']) ,
                "url" => Input::cleaner($_POST['url']) ,
                "content_id" => Input::seo($_POST['content_id']) ,
                "status" => 2,
                'created' => date('Y-m-d H:i:s')
            );
            $this
                ->db
                ->insert('reports')
                ->set($dataarray);

            $status = 'success';
            $text = __('Thanks for your feedback');
        }
        echo json_encode(array(
            "status" => $status,
            "text" => $text,
            "data" => $result
        ));

    }

    public function notifications()
    {
        $AuthUser = $this->getVariable("AuthUser");
        if ($AuthUser['id'])
        {
            $Listings = $this
                ->db
                ->from(null, '
	            SELECT *
	            FROM `notifications`   
	            WHERE notifications.user_id = "' . $AuthUser['id'] . '"
	            ORDER BY id DESC
	            LIMIT 0,6')->all();

            $TotalRecord = $this
                ->db
                ->from(null, '
            	SELECT 
            	count(notifications.id) as total 
            	FROM `notifications`
	            WHERE notifications.user_id = "' . $AuthUser['id'] . '" AND notifications.status = "2"')->total();

            foreach ($Listings as $Listing)
            {
                $Data = json_decode($Listing['data'], true);

                if ($Listing['type'] == 'episode')
                {
                    $Icon = 'popcorn';
                    $Color = 'bg-purple';
                }
                elseif ($Listing['type'] == 'comment')
                {
                    $Icon = 'comment';
                    $Color = 'bg-primary';
                }
                elseif ($Listing['type'] == 'discussion')
                {
                    $Icon = 'discussion';
                    $Color = 'bg-info';
                }
                $result[] = ['id' => $Listing['id'], 'type' => $Listing['type'], 'link' => $Data['link'], 'text' => $Data['text'], 'color' => $Color, 'icon' => $Icon, 'status' => $Listing['status'], 'created' => timeago($Listing['created']) ];
                if ($Listing['status'] != 1)
                {
                    $this
                        ->db
                        ->update('notifications')
                        ->where('id', $Listing['id'])->set(array(
                        "status" => 1
                    ));
                }
            }
        }
        echo json_encode(array(
            "status" => $status,
            "error" => null,
            "data" => $result,
            "total" => $TotalRecord
        ));
    }

    public function collection()
    {
        $AuthUser = $this->getVariable("AuthUser");
        if (!$AuthUser['id'])
        {
            $status = 'danger';
            $text = __('You must sign in');
        }
        elseif (Input::cleaner($_POST['name']))
        {
            $dataarray = array(
                "user_id" => Input::cleaner($AuthUser['id']) ,
                "name" => Input::cleaner($_POST['name']) ,
                "self" => Input::seo($_POST['name']) ,
                "color" => Input::cleaner($_POST['color']) ,
                "privacy" => (int)Input::cleaner($_POST['privacy'], 1) ,
                'created' => date('Y-m-d H:i:s')
            );
            $this
                ->db
                ->insert('collections')
                ->set($dataarray);

            $result = ['id' => $this
                ->db
                ->lastId() , 'name' => Input::cleaner($_POST['name']) , 'selected' => false];
            $status = 'success';
            $text = __('Changes Saved');
        }
        echo json_encode(array(
            "status" => $status,
            "text" => $text,
            "data" => $result
        ));

    }

    public function savecollection()
    {
        $AuthUser = $this->getVariable("AuthUser");
        if (!$AuthUser['id'])
        {
            $status = 'danger';
            $text = __('You must sign in');
        }
        elseif (Input::cleaner($_POST['collection_id']) and Input::cleaner($_POST['content_id']))
        {

            $Collection = $this
                ->db
                ->from('collections_post')
                ->where('content_id', Input::cleaner($_POST['content_id']))->where('user_id', Input::cleaner($AuthUser['id']))->first();
            if ($Collection['id'])
            {
                $dataarray = array(
                    "collection_id" => Input::cleaner($_POST['collection_id'])
                );
                $this
                    ->db
                    ->update('collections_post')
                    ->where('id', $Collection['id'])->set($dataarray);
            }
            elseif (!$Collection['id'])
            {
                $dataarray = array(
                    "collection_id" => Input::cleaner($_POST['collection_id']) ,
                    "content_id" => Input::cleaner($_POST['content_id']) ,
                    "user_id" => Input::cleaner($AuthUser['id'])
                );
                $this
                    ->db
                    ->insert('collections_post')
                    ->set($dataarray);
            }
            $status = 'success';
            $text = __('Content added to collection');
        }
        echo json_encode(array(
            "status" => $status,
            "text" => $text,
            "data" => $result
        ));

    }

    public function collections()
    {
        $AuthUser = $this->getVariable("AuthUser");
        if ($AuthUser['id'])
        {
            $Listings = $this
                ->db
                ->from(null, '
	            SELECT *
	            FROM `collections`   
	            WHERE collections.user_id = "' . $AuthUser['id'] . '"
	            ORDER BY name ASC')->all();

            $Collection = $this
                ->db
                ->from('collections_post')
                ->where('content_id', Input::cleaner($_POST['content_id']))->first();

            foreach ($Listings as $Listing)
            {
                $result[] = ['id' => $Listing['id'], 'name' => $Listing['name'], 'selected' => ($Listing['id'] == $Collection['collection_id'] ? true : null) ];
            }
        }
        echo json_encode(array(
            "status" => $status,
            "error" => null,
            "data" => $result
        ));
    }

    public function posts() {
        $Route      = $this->getVariable("Route");  
        if($_GET['q']) {
            $Listings = $this->db->from(null,'
                SELECT *
                FROM `posts`   
                WHERE title LIKE "%'.$_GET['q'].'%"
                ORDER BY id DESC
                LIMIT 0,4')
                ->all();
            foreach ($Listings as $Listing) {
            	if($Listing['type'] == 'serie') {
                	$posts[] = [
                    	'id'            => $Listing['id'],
                    	'name'          => $Listing['title'],
                    	'second_name'   => $Listing['title_sub'],
                    	'image'         => $Listing['image'],
                    	'url'           => '/serie/'. $Listing['self'] . '-' . $Listing['create_year'] . '-' . $Listing['id'],
                    	'type'          => ($Listing['type'] == 'movie' ? __('Movie') : __('Serie'))
                	];  
            	} 	
            	if($Listing['type'] == 'movie') {
                	$posts[] = [
                    	'id'            => $Listing['id'],
                    	'name'          => $Listing['title'],
                    	'second_name'   => $Listing['title_sub'],
                    	'image'         => $Listing['image'],
                    	'url'           => '/movie/'. $Listing['self'] . '-' . $Listing['create_year'] . '-' . $Listing['id'],
                    	'type'          => ($Listing['type'] == 'movie' ? __('Movie') : __('Serie'))
                	];  
            	} 	
            }
        }
        echo json_encode(array(
            "data"   => $posts
        ));
    }


 

}

