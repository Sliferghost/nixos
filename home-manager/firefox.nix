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
		search = {
			engines = {
				"Unduck" = {
					urls = [
					{
						template = "https://unduck.link";
						params = [
						{ name = "q"; value = "{searchTerms}"; }
						];
					}
					];
					iconURL = "https://media.licdn.com/dms/image/v2/D5603AQG23cObe6YgcQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1723116164570?e=2147483647&v=beta&t=EYRl81Ra-xFzEZ2GyTrNuVjzlYF-ikZ9rc4vWqKzHyk";

					definedDefault = true;
				};
			};
		  default = "Unduck";
		};
      };
    };
  };
}
