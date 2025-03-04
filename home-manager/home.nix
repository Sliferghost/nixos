{ pkgs, inputs, ... }: {
  home = {
    username = "jaap";
    homeDirectory = "/home/jaap";
    stateVersion = "24.11";

    pointerCursor = {
      package = pkgs.catppuccin-cursors.mochaSky;
      name = "catppuccin-mocha-sky-cursors";
      size = 24;
    };
  };

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
    ./eza.nix
    ./firefox.nix
    ./fzf.nix
    ./git.nix
    ./hyprland.nix
    ./kitty.nix
    ./lazygit.nix
    ./neovim.nix
    ./ssh.nix
    ./starship.nix
    ./wofi.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
