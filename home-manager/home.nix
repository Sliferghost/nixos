{ pkgs, inputs, ... }:
{
  home = {
    username = "jaap";
    homeDirectory = "/home/jaap";
    stateVersion = "24.11";

    packages = with pkgs; [
      wl-clipboard
      clipse
      pavucontrol
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    pointerCursor = {
      package = pkgs.catppuccin-cursors.mochaMauve;
      name = "catppuccin-mocha-mauve-cursors";
      size = 24;
    };
  };

  fonts.fontconfig.enable = true;

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  imports = [
    ./catppuccin.nix
    ./bat.nix
    ./dunst.nix
    ./eza.nix
    ./jetbrains.nix
    ./java.nix
    ./maven.nix
    ./firefox.nix
    ./fzf.nix
    ./git.nix
    ./hyprland.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./kitty.nix
    ./lazygit.nix
    ./neovim.nix
    ./ssh.nix
    ./starship.nix
    ./waybar.nix
    ./wofi.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
    ./zen-browser
  ];
}
