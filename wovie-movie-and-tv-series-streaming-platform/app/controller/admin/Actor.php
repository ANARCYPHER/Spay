<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Actor extends Controller
{
    public function process()
    {
        $AuthUser = $this->getVariable("AuthUser");
        $Route = $this->getVariable("Route");
        $Config['nav']                  = 'actors';
 
        if(Input::cleaner($Route->params->id)) {
            $Listing        = $this->db->from('actors')->where('id',$Route->params->id,'=')->first();
            $Data           = json_decode($Listing['data'], true);

            // Videos 
            $Videos = $this->db->from(
                null,
                '
                SELECT 
                posts_actor.id, 
                posts_actor.character_name, 
                posts_actor.sortable, 
                a.id as movie_id,
                a.title,  
                a.type,  
                a.self,   
                a.image
                FROM `posts_actor` 
                LEFT JOIN posts AS a ON posts_actor.content_id = a.id     
                WHERE posts_actor.actor_id = "' . $Listing['id'] . '"
                ORDER BY posts_actor.sortable ASC'
            )->all();
        }

        $this->setVariable("Data", $Data);
        $this->setVariable("Config",$Config);    
        $this->setVariable("Videos",$Videos);      
        $this->setVariable('Listing',$Listing); 
        if(Input::cleaner($_POST['_ACTION']) == 'save' AND !$Listing['id']) {
            $this->save();
        } elseif(Input::cleaner($_POST['_ACTION']) == 'save' AND $Listing['id']) {
            $this->update();
        }

        $this->view('actor', 'admin');
    }

    public function save() {       
        if (empty($Notify)) {  
            
            foreach ($_POST['data'] as $key => $value) {
                if ($value) {
                    $Settings['data'][$key] = $value;
                }
            }
            $dataarray          = array(
                "name"          => Input::cleaner($_POST['name']),
                "self"          => Input::seo($_POST['name']),
                "image"         => Input::cleaner($_POST['image']),
                "biography"     => Input::cleaner($_POST['biography']),
                "gender"        => Input::cleaner($_POST['gender']),
                "featured"      => Input::cleaner($_POST['featured'],2),
                'data'          => json_encode($Settings['data'], JSON_UNESCAPED_UNICODE),
            );   
            $this->db->insert('actors')->set($dataarray); 

            $LastId = $this->db->lastId();

            // Movies and Series    
            foreach ($_POST['video'] as $Video) {
                if (!$Video['id']) {
                    $dataarray = array(
                        "content_id"        => Input::cleaner($Video['content_id']),
                        "character_name"    => Input::cleaner($Video['character_name']),
                        "actor_id"          => $LastId
                    );
                    $this->db->insert('posts_actor')->set($dataarray);
                }
            }
            $Notify['type']     = 'success';
            $Notify['text']     = __('Changes Saved'); 
            $this->notify($Notify);
            header("location: ".APP.'/admin/actors');
        }else{ 
            $this->notify($Notify);
        }
        return $this;
    }
    public function update() {
        $Listing        = $this->getVariable("Listing");       
        if (empty($Notify)) {
            foreach ($_POST['data'] as $key => $value) {
                if ($value) {
                    $Settings['data'][$key] = $value;
                }
            }
            $dataarray          = array(
                "name"          => Input::cleaner($_POST['name']),
                "self"          => Input::seo($_POST['name']),
                "image"         => Input::cleaner($_POST['image']),
                "biography"     => Input::cleaner($_POST['biography']),
                "gender"        => Input::cleaner($_POST['gender']),
                "featured"      => Input::cleaner($_POST['featured'],2),
                'data'          => json_encode($Settings['data'], JSON_UNESCAPED_UNICODE),
            );   
            $this->db->update('actors')->where('id',$Listing['id'])->set($dataarray);
            

            // Movies and Series    
            foreach ($_POST['video'] as $Video) {
                $Check = $this->db->from('posts_actor')->where('content_id',$Video['content_id'])->where('actor_id',$Listing['id'])->first();
                if (!$Video['id'] AND !$Check['id']) {
                    $dataarray = array(
                        "content_id"        => Input::cleaner($Video['content_id']),
                        "character_name"    => Input::cleaner($Video['character_name']),
                        "actor_id"          => $Listing['id']
                    );
                    $this->db->insert('posts_actor')->set($dataarray);
                } elseif ($Video['id']) {
                    $dataarray = array(
                        "character_name"    => Input::cleaner($Video['character_name'])
                    );
                    $this->db->update('posts_actor')->where('id',$Video['id'])->set($dataarray);
                }
            }
            $Notify['type']     = 'success';
            $Notify['text']     = __('Changes Saved'); 
            $this->notify($Notify);
            header("location: ".APP.'/admin/actors');
        }else{ 
            $this->notify($Notify);
        } 
        return $this;
    }
}
