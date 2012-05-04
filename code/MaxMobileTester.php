<?php
/**
 * This controller is showing your page in many screen resolutions 	
 * @package maxmobiletester - check your site in many standard resolutions - usefull for creating responsive designs
 * @link https://gist.github.com/1685127
 * @link maxskitter https://github.com/Silvermax/maxmobiletester/
 * @author Pali Ondras
 */

class MaxMobileTester extends Controller {
	
	static $allowed_actions = array("index","showpage");
	
	function index($data) {
		return $this->showpage($data);
	}
	
	function showpage($data) {
		if (Director::isDev()) {
			$currentData = $data->latestParams();
			if ($currentData["ID"] > 0) {
				$p = DataObject::get_by_id("Page", (int)$currentData["ID"]);
			} else {
				$p = DataObject::get_one("Page","URLSegment = 'home'");
			}
			if ($p) {
				$mobileviewavailable = false;	
				$mobileview = false;
				$currentlink = $p->Link();
				if (class_exists("MobileSiteControllerExtension")) {
					$mobileviewavailable = true;
					$config = SiteConfig::current_site_config();
					if (isset($_GET["mobileview"])) {
						$mobileview = true;
						if (!empty($config->MobileDomain)) {
							$currentlink = $config->MobileDomain.$p->Link(); 
						} else {
							$fullSiteCookie = Cookie::get('fullSite');
							if($fullSiteCookie !== "0") {
								Cookie::set("fullSite", 0);
								header("Location: #");
							}
						}
					} 
				}
				$pages = DataObject::get("Page","Status = 'Published'");
				return $this->customise(array(
					"CurrentLink" => $currentlink,
					"MobileViewAvailable" => $mobileviewavailable,
					"MobileView" => $mobileview,
					"Pages" => 	$pages
				))->renderWith("MaxMobileTester");	
			} else {
				return "Page doesn't exist.";
			}
		} else {
			return "You must be in DEV mode to use this module ;)";
		}
	}
}
