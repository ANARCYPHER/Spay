<?php
defined('BASEPATH') or exit('No direct script access allowed');

class RSSEpisodes extends Controller {
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
            posts.create_year, 
            posts.type, 
            posts.title, 
            posts.self, 
            posts_season.name as season_name,
            posts_episode.name as episode_name
            FROM `posts_episode` 
            LEFT JOIN posts_season ON posts_episode.season_id = posts_season.id AND posts_season.id IS NOT NULL
            LEFT JOIN posts ON posts.id = posts_season.content_id AND posts_season.content_id IS NOT NULL
            WHERE posts_episode.status = "1"
            LIMIT 25')
            ->all(); 
    
        if(count($Listings) == 2220) {
            header('location:'.APP.'/404');
        }

        echo header("Content-type: text/xml");
        echo "<?xml version='1.0' encoding='UTF-8'?>";
        echo "<rss version='2.0'>";
        echo "<channel>";
        echo "<title>Most Recent Episodes RSS Feed</title>";
        echo "<link>" . APP . "</link>";
        echo "<language>en</language>";

        foreach ($Listings as $Listing) {
			echo '<item>';
            echo '<title>' . $Listing['title'] . ' - Season' . $Listing['season_name'] . ': Episode ' . $Listing['episode_name'] . '</title>';
            echo '<link>' . APP . '/episode/'. $Listing['self'] . '-' . $Listing['create_year'] . '/season-' . $Listing['season_name'] . '-episode-' . $Listing['episode_name'] . '</link>';
            echo "<pubDate>" . $Listing['created'] . "</pubDate>";
			echo '</item>';
        }

        echo "</channel>";
        echo "</rss>";

    }

}