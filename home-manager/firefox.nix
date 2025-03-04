{ pkgs, ... }:
let
  firefoxExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
    lastpass-password-manager
    ublock-origin
  ];
in {
  programs.firefox = {
    enable = true;
    profiles = {
      jaap = {
        id = 0;
	name = "jaap";
	isDefault = true;
	extensions = firefoxExtensions;
	settings = {
	  "privacy.donottrackheader.enabled" = true;
	  "browser.startup.page" = 3;
	};
      };
    };
  };
}
