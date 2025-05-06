{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    (inputs.zen-browser.packages."${system}".default.override {
      extraPolicies = {
        DisableAppUpdate = true;
        DisableTelemetry = true;
      };
      nativeMessagingHosts = [ pkgs.firefoxpwa ];
    })
  ];
}
