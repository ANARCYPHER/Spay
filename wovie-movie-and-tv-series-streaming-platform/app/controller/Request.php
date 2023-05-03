<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Request extends Controller {
	public function process() {
		$AuthUser 				= $this->getVariable("AuthUser");
		$Route 					= $this->getVariable("Route");
		$Settings 				= $this->getVariable("Settings"); 
		$Config['title'] 		= get($Settings, "data.title", "general") . ' - ' . __('Request');
		$Config['description'] 	= get($Settings, "data.description", "general");
		$Config['nav'] 			= 'request'; 

		$mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

    	if(isset($AuthUser['id'])) {
    	if(isset($_POST['save'])){
			$sql = "INSERT INTO requests (title, type, url) VALUES (?,?,?)";
    		$stmt = $mysqli->prepare($sql);
    		$stmt->bind_param("sss", $_POST['title'], $_POST['type'], $_POST['url']);
			$stmt->execute();
    	}

    	if( $_GET['status'] == 'success'):
            $Notify['type']     = 'success';
            $Notify['text']     = __('Your request has been made'); 
            $this->notify($Notify);
		endif;
        
        } else {
            $Notify['type']     = 'danger';
            $Notify['text']     = __('You need to login to request'); 
            $this->notify($Notify); }
    
        $Config['url']          = APP.'/'.$Config['nav']; 
		$this->setVariable("Config", $Config);
		$this->setVariable("request", $Countries);
		$this->view('request', 'app');
	}
}
