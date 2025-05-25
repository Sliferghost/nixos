{ pkgs, ... }:
{
  home = {
    username = "jaap";
    homeDirectory = "/home/jaap";
    stateVersion = "25.05";

    packages = with pkgs; [
      wl-clipboard
      clipse
      pavucontrol
      unzip
      vlc
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    pointerCursor = {
      package = pkgs.catppuccin-cursors.mochaMauve;
      name = "catppuccin-mocha-mauve-cursors";
      size = 24;
    };
  };

  fonts.fontconfig.enable = true;

  imports = [
    ./catppuccin.nix
    ./bat.nix
    ./dunst.nix
    ./eza.nix
    ./node.nix
    ./cursor.nix
    ./jetbrains.nix
    ./java.nix
    ./godot.nix
    ./gaming.nix
    ./maven.nix
    ./fzf.nix
    ./git.nix
    ./hyprland.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./kitty.nix
    ./lazygit.nix
    ./lastpass.nix
    ./neovim.nix
    ./ssh.nix
    ./starship.nix
    ./waybar.nix
    ./wofi.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
    ./zen-browser.nix
  ];
}
