{ pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    package = inputs.firefox.packages."${pkgs.system}".firefox-nightly-bin;

    profiles."sliferghost" = {
      isDefault = true;
    };
  };
}
