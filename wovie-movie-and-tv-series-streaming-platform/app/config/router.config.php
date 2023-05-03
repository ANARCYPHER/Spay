<?php 
// General
App::addRoute("GET|POST", "/",																								"Main");
App::addRoute("GET|POST", "/ajax/[*:ajax]/[*:action]?/?",																	"Ajax");
App::addRoute("GET|POST", "/anime/[*:type]?/?",																				"Anime");
App::addRoute("GET|POST", "/api/[*:api]/[*:action]?/?",																		"Api");
App::addRoute("GET|POST", "/cron/[*:action]?/?",																			"Cron");
App::addRoute("GET|POST", "/modal/[*:modal]?/?",																			"Modal");
App::addRoute("GET|POST", "/comments?/?",																					"Comments");
App::addRoute("GET|POST", "/search/[*:q]?/?",																				"Search");
App::addRoute("GET|POST", "/login?/?",																						"Login");
App::addRoute("GET|POST", "/register?/?",																					"Register");
App::addRoute("GET|POST", "/forgot-password?/?",																			"Recovery");
App::addRoute("GET|POST", "/recovery/[*:hash]?/?",																			"PasswordChange");
App::addRoute("GET|POST", "/logout?/?",																						"Logout");
App::addRoute("GET|POST", "/discovery/[*:type]?/?",																			"Discovery");
App::addRoute("GET|POST", "/trends?/?",																						"Trends");
App::addRoute("GET|POST", "/movie/[*:self]-[*:create_year]?/?",																"Movie");
App::addRoute("GET|POST", "/movie/[*:self]-[*:create_year]/[i:video]?/?",													"Movie");
App::addRoute("GET|POST", "/movies/[*:category]?/?",																		"Movies");
App::addRoute("GET|POST", "/movies?/?",																						"Movies");
App::addRoute("GET|POST", "/show/[*:self]-[*:create_year]?/?",																"Serie");
App::addRoute("GET|POST", "/episode/[*:self]-[*:create_year]/season-[*:season]-episode-[i:episode]/[i:video]?/?",        	"Episode");
App::addRoute("GET|POST", "/episode/[*:self]-[*:create_year]/season-[*:season]-episode-[i:episode]?/?",        				"Episode");
App::addRoute("GET|POST", "/shows/[*:category]?/?",																			"Series");
App::addRoute("GET|POST", "/shows?/?",																						"Series");
App::addRoute("GET|POST", "/actor/[*:self]-[i:id]?/?",																		"Actor");
App::addRoute("GET|POST", "/actors?/?",																						"Actors");
App::addRoute("GET|POST", "/tv-channel/[*:self]-[i:id]?/?",																	"Channel");
App::addRoute("GET|POST", "/tv-channels?/?",																				"Channels");
App::addRoute("GET|POST", "/collection/[*:self]-[i:id]?/?",																	"Collection");
App::addRoute("GET|POST", "/collections?/?",																				"Collections");
App::addRoute("GET|POST", "/playlists?/?",																					"Playlists");
App::addRoute("GET|POST", "/services?/?",																					"Services");
App::addRoute("GET|POST", "/category/[*:self]?/?",																			"Category");
App::addRoute("GET|POST", "/categories?/?",																					"Categories");
App::addRoute("GET|POST", "/country/[*:self]?/?",																			"Country");
App::addRoute("GET|POST", "/countries?/?",																					"Countries");
App::addRoute("GET|POST", "/page/[*:self]?/?",																				"Page");
App::addRoute("GET|POST", "/profile/[*:username]?/?",																		"Profile");
App::addRoute("GET|POST", "/notifications?/?",																				"Notifications");
App::addRoute("GET|POST", "/settings?/?",																					"Settings");
App::addRoute("GET|POST", "/store?/?",																						"Store");
App::addRoute("GET|POST", "/request?/?",																					"Request");
App::addRoute("GET|POST", "/requests?/?",																					"Requests");
App::addRoute("GET|POST", "/zat6lfinVoTMYmNJkKqpbE687tKEDUSJcNTrsyuD2?/?",													"zat6lfinVoTMYmNJkKqpbE687tKEDUSJcNTrsyuD2");
App::addRoute("GET|POST", "/zBzyhA14mOKUGa6FUUksWqoPv72nNCGpuDwt6O9IM?/?",													"zBzyhA14mOKUGa6FUUksWqoPv72nNCGpuDwt6O9IM");
App::addRoute("GET|POST", "/zRoPe4elYlwIl25veADfKqjztN0S1R1P3MY5I1L8K?/?",													"zRoPe4elYlwIl25veADfKqjztN0S1R1P3MY5I1L8K");
App::addRoute("GET|POST", "/zVoPe4elYlwIl85veAAfKqjztN0S1R1P3M8gQ1L8K?/?",													"zVoPe4elYlwIl85veAAfKqjztN0S1R1P3M8gQ1L8K");

// Admin
App::addRoute("GET|POST", "/admin/modal/[*:modal]?/?",																		["admin","Modal"]);
App::addRoute("GET|POST", "/admin/ajax/[*:ajax]/[*:action]?/?",																["admin","Ajax"]);
App::addRoute("GET|POST", "/admin?/?",																						["admin","Main"]);
App::addRoute("GET|POST", "/admin/movie/[i:id]?/?",																			["admin","Movie"]);
App::addRoute("GET|POST", "/admin/movies?/?",																				["admin","Movies"]);
App::addRoute("GET|POST", "/admin/serie/[i:id]?/?",																			["admin","Serie"]);
App::addRoute("GET|POST", "/admin/series?/?",																				["admin","Series"]);
App::addRoute("GET|POST", "/admin/episode/[i:serie]/[i:id]?/?",																["admin","Episode"]);
App::addRoute("GET|POST", "/admin/episodes/[i:id]?/?",																		["admin","Episodes"]);
App::addRoute("GET|POST", "/admin/category/[i:id]?/?",																		["admin","Category"]);
App::addRoute("GET|POST", "/admin/categories?/?",																			["admin","Categories"]);
App::addRoute("GET|POST", "/admin/country/[i:id]?/?",																		["admin","Country"]);
App::addRoute("GET|POST", "/admin/countries?/?",																			["admin","Countries"]);
App::addRoute("GET|POST", "/admin/story/[i:id]?/?",																			["admin","Story"]);
App::addRoute("GET|POST", "/admin/stories?/?",																				["admin","Stories"]);
App::addRoute("GET|POST", "/admin/slide/[i:id]?/?",																			["admin","Slide"]);
App::addRoute("GET|POST", "/admin/slider?/?",																				["admin","Slider"]);
App::addRoute("GET|POST", "/admin/actor/[i:id]?/?",																			["admin","Actor"]);
App::addRoute("GET|POST", "/admin/actors?/?",																				["admin","Actors"]);
App::addRoute("GET|POST", "/admin/user/[i:id]?/?",																			["admin","User"]);
App::addRoute("GET|POST", "/admin/users?/?",																				["admin","Users"]);
App::addRoute("GET|POST", "/admin/collection/[i:id]?/?",																	["admin","Collection"]);
App::addRoute("GET|POST", "/admin/collections?/?",																			["admin","Collections"]);
App::addRoute("GET|POST", "/admin/comment/[i:id]?/?",																		["admin","Comment"]);
App::addRoute("GET|POST", "/admin/comments?/?",																				["admin","Comments"]);
App::addRoute("GET|POST", "/admin/tool/[i:id]?/?",																			["admin","Tool"]);
App::addRoute("GET|POST", "/admin/tools?/?",																				["admin","Tools"]);
App::addRoute("GET|POST", "/admin/settings?/?",																				["admin","Settings"]);
App::addRoute("GET|POST", "/admin/video/[i:id]?/?",																			["admin","Video"]);
App::addRoute("GET|POST", "/admin/videos?/?",																				["admin","Videos"]);
App::addRoute("GET|POST", "/admin/ads/[i:id]?/?",																			["admin","Ads"]);
App::addRoute("GET|POST", "/admin/report/[i:id]?/?",																		["admin","Report"]);
App::addRoute("GET|POST", "/admin/reports?/?",																				["admin","Reports"]);
App::addRoute("GET|POST", "/admin/request/[i:id]?/?",																		["admin","Request"]);
App::addRoute("GET|POST", "/admin/requests?/?",																				["admin","Requests"]);
App::addRoute("GET|POST", "/admin/page/[i:id]?/?",																			["admin","Page"]);
App::addRoute("GET|POST", "/admin/pages?/?",																				["admin","Pages"]);
App::addRoute("GET|POST", "/admin/channel/[i:id]?/?",																		["admin","Channel"]);
App::addRoute("GET|POST", "/admin/channels?/?",																				["admin","Channels"]);
App::addRoute("GET|POST", "/admin/language/[i:id]?/?",																		["admin","Language"]);
App::addRoute("GET|POST", "/admin/languages?/?",																			["admin","Languages"]);
App::addRoute("GET|POST", "/admin/country/[i:id]?/?",																		["admin","Country"]);
App::addRoute("GET|POST", "/admin/countries?/?",																			["admin","Countries"]);
App::addRoute("GET|POST", "/admin/tmdb?/?",																					["admin","Tmdb"]);
App::addRoute("GET|POST", "/admin/store?/?",																				["admin","Store"]);
App::addRoute("GET|POST", "/admin/product/[i:id]?",																			["admin","Product"]);
App::addRoute("GET|POST", "/admin/onesignal?/?",																			["admin","Onesignal"]);

// Sitemap
App::addRoute("GET|POST", "/sitemap?/?", 																					"SitemapMain");
App::addRoute("GET|POST", "/sitemap/posts_[i:page]?/?", 																	"SitemapPosts");
App::addRoute("GET|POST", "/sitemap/episodes_[i:page]?/?", 																	"SitemapEpisodes");
App::addRoute("GET|POST", "/sitemap/actors_[i:page]?/?", 																	"SitemapActors");
App::addRoute("GET|POST", "/sitemap/collections_[i:page]?/?",																"SitemapCollections");
App::addRoute("GET|POST", "/sitemap/categories_[i:page]?/?",																"SitemapCategories");
App::addRoute("GET|POST", "/sitemap/users_[i:page]?/?", 																	"SitemapUsers");

// RSS Feeds
App::addRoute("GET|POST", "/feeds/movies?/?", 																		"RSSMovies");
App::addRoute("GET|POST", "/feeds/shows?/?", 																		"RSSShows");
App::addRoute("GET|POST", "/feeds/episodes?/?", 																	"RSSEpisodes");