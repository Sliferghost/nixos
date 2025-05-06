{
  pkgs,
  unstable,
  inputs,
  ...
}:
{
  home.packages = [
    unstable.air-formatter
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
