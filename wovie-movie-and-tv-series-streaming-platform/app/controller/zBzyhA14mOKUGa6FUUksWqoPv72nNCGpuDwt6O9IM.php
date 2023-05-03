<?php
defined('BASEPATH') or exit('No direct script access allowed');
if($_SERVER['HTTP_REFERER'] !== 'https://paypal.com') {
  die("Don't try and scam me please.");
}

class zBzyhA14mOKUGa6FUUksWqoPv72nNCGpuDwt6O9IM extends Controller {
	public function process() {
		$AuthUser 				= $this->getVariable("AuthUser");
		$Route 					= $this->getVariable("Route");
		$Settings 				= $this->getVariable("Settings"); 
		$Config['title'] 		= get($Settings, "data.title", "general");
		$Config['description'] 	= get($Settings, "data.description", "general");
		$Config['nav'] 		= get($Settings, "data.title", "zBzyhA14mOKUGa6FUUksWqoPv72nNCGpuDwt6O9IM");

		$this->setVariable("Config", $Config);
        $Config['url']          = APP; 
		$this->view('zBzyhA14mOKUGa6FUUksWqoPv72nNCGpuDwt6O9IM', 'app');
	}
}