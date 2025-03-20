{ pkgs, ... }:
{
  home.packages = with pkgs; [
    heroic
    mgba
  ];
}
