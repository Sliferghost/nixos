{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pw-dump
  ];
}
