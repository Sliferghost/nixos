{ pkgs, ... }:
let
  firefoxExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
    lastpass-password-manager
    ublock-origin
  ];
in
{
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
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              iconURL = "https://unduck.link/favicon.icon";

              definedDefault = true;
            };
            "Google".metaData.hidden = true;
            "Bing".metaData.hidden = true;
          };
          default = "Unduck";

          order = [
            "Unduck"
          ];

          force = true;
        };
      };
    };
  };
}
