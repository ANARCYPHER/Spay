<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Episode extends Controller {
	public function process() {
		$AuthUser = $this->getVariable("AuthUser");
		$Route = $this->getVariable("Route");
		$Config['title'] = TITLE;
		$Config['description'] = DESC;
		$Config['nav']        = 'series';
		if(!$Route->params->serie) {
			header('location:'.APP.'/admin/series');
		}
        $Serie      = $this->db->from('posts')->where('id', $Route->params->serie)->first();
		if ($Route->params->id) {
            $Listing    = $this->db->from('posts_episode')->where('id', $Route->params->id)->first();
            $Data       = json_decode($Listing['data'], true);
            // Videos 
            $Videos = $this->db->from(
                null,
                '
                SELECT 
                posts_video.id,  
                posts_video.name, 
                posts_video.content_id, 
                posts_video.episode_id, 
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
                WHERE posts_video.content_id = "' . $Listing['content_id'] . '" AND posts_video.episode_id = "' . $Listing['id'] . '"
                ORDER BY posts_video.sortable ASC'
            )->all();
 
        }
        $Seasons = $this->db->from('posts_season')->where('content_id', $Route->params->serie)->all(); 

		$this->setVariable("Config", $Config);
		$this->setVariable("Seasons", $Seasons);
        $this->setVariable("Videos", $Videos);
        $this->setVariable("Serie", $Serie);
		$this->setVariable("Listing", $Listing);
        // Actions
        if ($Listing['id'] and $_POST['_ACTION'] == 'save') {
            $this->update();
        } elseif ($_POST['_ACTION'] == 'save') {
            $this->save();
        }

		$this->view('episode', 'admin');
	}
    public function save()
    {
        $AuthUser = $this->getVariable("AuthUser");
        $Serie = $this->getVariable("Serie");
        if (empty($Notify)) {
            $Check = $this->db->from('posts_season')->where('id',Input::cleaner($_POST['season_id']))->first();
            if($Check['id']) {
                $Season_id = $Check['id'];
                $SeasonName = Input::cleaner($Check['name']);
            }else{
                $Data = array(
                    'name'          => Input::cleaner($_POST['name']),
                    'content_id'    => Input::cleaner($Serie['id'])
                );
                $this->db->insert('posts_season')->set($Data);
                $SeasonName = Input::cleaner($_POST['name']);
                $Season_id  = $this->db->lastId();
            }

            $Data = array(
                'name'          => Input::cleaner($_POST['name']),
                'self'          => Input::seo($_POST['name']), 
                'description'   => Input::cleaner($_POST['description']),
                'overview'   => Input::cleaner($_POST['overview']),
                'download'   => Input::cleaner($_POST['download']),
                'season_id'     => $Season_id,
                'content_id'    => Input::cleaner($Serie['id']),
                'image'         => Input::cleaner($_POST['image']),
                'status'        => (int)Input::cleaner($_POST['status'], 2),
                'featured'      => (int)Input::cleaner($_POST['featured'], 2),
                'slider'        => (int)Input::cleaner($_POST['slider'], 2),
                'published'     => Input::cleaner($_POST['published']),
                'created'       => date('Y-m-d H:i:s')
            );
            $this->db->insert('posts_episode')->set($Data);

            $LastId = $this->db->lastId();

            // Videos    
            foreach ($_POST['video'] as $Video) {
                if (!$Video['id'] AND $Video['embed']) {
                    $dataarray = array(
                        "content_id"    => $Serie['id'],
                        "episode_id"    => $LastId,
                        "name"          => Input::cleaner($Video['name']),
                        "language_id"   => (int)Input::cleaner($Video['language']),
                        "service_id"    => (int)Input::cleaner($Video['service']),
                        "embed"         => Input::cleaner($Video['embed']),
                        "player"        => (int)Input::cleaner($Video['player']),
                        "sortable"      => (int)Input::cleaner($Video['sortable']),
                    );
                    $this->db->insert('posts_video')->set($dataarray);
                }
            } 
            $Follows    = $this->db->from('follows')->where('content_id',$Serie['id'])->all();
            foreach ($Follows as $Follow) {

                $Notification['data']['text']   = $Serie['title'].', '.Input::cleaner($_POST['name']).'.'.__('Episode').' '.__('published');
                $Notification['data']['link']   = episode($Serie['id'],$Serie['self'],$SeasonName,Input::cleaner($_POST['name']));
                $dataarray = array(
                    "user_id"       => $Follow['user_id'],
                    "type"          => 'episode',
                    'data'          => json_encode($Notification['data'], JSON_UNESCAPED_UNICODE),
                    'created'       => date('Y-m-d H:i:s'),
                    "status"        => '2',
                );
                $this->db->insert('notifications')->set($dataarray);
            }
            $Notify['type'] = 'success';
            $Notify['text']     = __('Changes Saved'); 
            $this->notify($Notify);
            header("location: " . APP . '/admin/episodes/'.$Serie['id']);
        } else {
            $this->notify($Notify);
        }
    }

    public function update()
    {
        $Listing    = $this->getVariable("Listing");
        $Serie      = $this->getVariable("Serie");
        if (empty($Notify)) {
            $Check = $this->db->from('posts_season')->where('id',Input::cleaner($_POST['season_id']))->first();
            if($Check['id']) {
                $Season_id = $Check['id'];
                $SeasonName = Input::cleaner($Check['name']);
            }else{
                $Data = array(
                    'name'          => Input::cleaner($_POST['name']),
                    'content_id'      => Input::cleaner($Serie['id'])
                );
                $this->db->insert('posts_season')->set($Data);
                $SeasonName = Input::cleaner($_POST['name']);
                $Season_id  = $this->db->lastId();
            }

            $Data = array(
                'name'          => Input::cleaner($_POST['name']),
                'self'          => Input::seo($_POST['name']), 
                'description'   => Input::cleaner($_POST['description']),
                'overview'   => Input::cleaner($_POST['overview']),
                'download'   => Input::cleaner($_POST['download']),
                'season_id'     => $Season_id,
                'content_id'    => Input::cleaner($Serie['id']),
                'image'         => Input::cleaner($_POST['image']),
                'status'        => (int)Input::cleaner($_POST['status'], 2),
                'featured'      => (int)Input::cleaner($_POST['featured'], 2),
                'slider'        => (int)Input::cleaner($_POST['slider'], 2),
                'published'     => Input::cleaner($_POST['published']),
                'created'       => date('Y-m-d H:i:s')
            );
            $this->db->update('posts_episode')->where('id',$Listing['id'])->set($Data);
 

            
            // Videos    
            foreach ($_POST['video'] as $Video) {
                if ($Video['id'] AND $Video['embed']) {
                    $dataarray = array(
                        "episode_id"    => $Listing['id'],
                        "content_id"      => $Listing['content_id'],
                        "name"          => Input::cleaner($Video['name']),
                        "language_id"   => (int)Input::cleaner($Video['language']),
                        "service_id"    => (int)Input::cleaner($Video['service']),
                        "embed"         => Input::cleaner($Video['embed']),
                        "player"        => (int)Input::cleaner($Video['player']),
                        "sortable"      => (int)Input::cleaner($Video['sortable']),
                    );
                    $this->db->update('posts_video')->where('id', Input::cleaner($Video['id']))->set($dataarray);
                } elseif (!$Video['id'] AND $Video['embed']) {
                    $dataarray = array(
                        "episode_id"    => $Listing['id'],
                        "content_id"      => $Listing['content_id'],
                        "name"          => Input::cleaner($Video['name']),
                        "language_id"   => (int)Input::cleaner($Video['language']),
                        "service_id"    => (int)Input::cleaner($Video['service']),
                        "embed"         => Input::cleaner($Video['embed']),
                        "player"        => (int)Input::cleaner($Video['player']),
                        "sortable"      => (int)Input::cleaner($Video['sortable']),
                    );
                    $this->db->insert('posts_video')->set($dataarray);
                }
            }
            $Notify['type'] = 'success';
            $Notify['text']     = __('Changes Saved'); 
            $this->notify($Notify);
            header("location: " . APP . '/admin/episodes/'.$Serie['id']);
        } else {
            $this->notify($Notify);
        }
    }
}
