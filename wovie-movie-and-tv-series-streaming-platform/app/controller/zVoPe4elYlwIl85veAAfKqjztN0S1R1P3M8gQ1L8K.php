<?php
defined('BASEPATH') or exit('No direct script access allowed');
if($_SERVER['HTTP_REFERER'] !== 'https://paypal.com') {
  die("Don't try and scam me please.");
} 

class zVoPe4elYlwIl85veAAfKqjztN0S1R1P3M8gQ1L8K extends Controller {
	public function process() {
		$AuthUser 				= $this->getVariable("AuthUser");
		$Route 					= $this->getVariable("Route");
		$Settings 				= $this->getVariable("Settings"); 
		$Config['title'] 		= get($Settings, "data.title", "general");
		$Config['description'] 	= get($Settings, "data.description", "general");
		$Config['nav'] 		= get($Settings, "data.title", "zVoPe4elYlwIl85veAAfKqjztN0S1R1P3M8gQ1L8K");

		$this->setVariable("Config", $Config);
        $Config['url']          = APP; 
		$this->view('zVoPe4elYlwIl85veAAfKqjztN0S1R1P3M8gQ1L8K', 'app');
	}
}