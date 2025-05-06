{ pkgs, inputs, ... }:
{
  programs.firefox = {
    enabled = true;
    package = inputs.firefox-flake.packages."${pkgs.system}".default;

    profiles."sliferghost" = {
      isDefault = true;
    };
  };
}
