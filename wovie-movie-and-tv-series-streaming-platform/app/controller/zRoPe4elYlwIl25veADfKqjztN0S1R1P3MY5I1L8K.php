<?php
defined('BASEPATH') or exit('No direct script access allowed');
if($_SERVER['HTTP_REFERER'] !== 'https://paypal.com') {
  die("Don't try and scam me please.");
} 

class zRoPe4elYlwIl25veADfKqjztN0S1R1P3MY5I1L8K extends Controller {
	public function process() {
		$AuthUser 				= $this->getVariable("AuthUser");
		$Route 					= $this->getVariable("Route");
		$Settings 				= $this->getVariable("Settings"); 
		$Config['title'] 		= get($Settings, "data.title", "general");
		$Config['description'] 	= get($Settings, "data.description", "general");
		$Config['nav'] 		= get($Settings, "data.title", "zRoPe4elYlwIl25veADfKqjztN0S1R1P3MY5I1L8K");

		$this->setVariable("Config", $Config);
        $Config['url']          = APP; 
		$this->view('zRoPe4elYlwIl25veADfKqjztN0S1R1P3MY5I1L8K', 'app');
	}
}