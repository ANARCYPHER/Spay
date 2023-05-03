<?php
defined('BASEPATH') or exit('No direct script access allowed');

class RSSMovies extends Controller {
    public function process() {
        $AuthUser   = $this->getVariable("AuthUser");
        $Route      = $this->getVariable("Route");
        if($Route->params->page == 1) {
            $PageStart = 0;
        } elseif($Route->params->page > 1) {
            $PageStart = ceil(($Route->params->page-1) * SITEMAP_PAGE);
        }
        $Listings = $this->db->from(null,'
            SELECT 
            posts.id, 
            posts.type, 
            posts.create_year, 
            posts.created,
            posts.self
            FROM `posts`
            WHERE posts.status = "1" AND posts.type = "movie"
            LIMIT 25')
            ->all(); 
        if(count($Listings) == 0) {
            header('location:'.APP.'/404');
        }
        echo header("Content-type: text/xml");
        echo "<?xml version='1.0' encoding='UTF-8'?>";
        echo "<rss version='2.0'>";
        echo "<channel>";
        echo "<title>Most Recent Movies RSS Feed</title>";
        echo "<link>" . APP . "</link>";
        echo "<language>en</language>";

        foreach ($Listings as $Listing) {
            echo "<item>";
            echo "<title>" . $Listing['title'] . "</title>";
            echo "<link>" . APP . "/movie/" . $Listing['self'] . "-" . $Listing['create_year'] . "</link>";
            echo "<pubDate>" . $Listing['created'] . "</pubDate>";
            echo "</item>";
        }
        echo "</channel>";
        echo "</rss>";
       

    }

}