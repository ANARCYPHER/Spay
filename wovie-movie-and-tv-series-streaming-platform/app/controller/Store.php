<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Store extends Controller {
	public function process() {
		$AuthUser 				= $this->getVariable("AuthUser");
		$Route 					= $this->getVariable("Route");
		$Settings 				= $this->getVariable("Settings"); 
		$Config['title'] 		= get($Settings, "data.title", "general") . ' - ' . __('Store');
		$Config['description'] 	= get($Settings, "data.description", "general");
		$Config['nav'] 			= 'store'; 
    
        $Config['url']          = APP.'/'.$Config['nav']; 
		$this->setVariable("Config", $Config);
		$this->setVariable("store", $Countries);
		$this->view('store', 'app');
	}
}

