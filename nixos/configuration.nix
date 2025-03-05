{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "gaming-pc";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks --remember --remember-session --sessions ${pkgs.hyprland}/share/wayland-sessions";
        user = "greeter";
      };
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.jaap = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "input"
    ];
  };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    hyprland
    home-manager
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.stateVersion = "24.11";

}
