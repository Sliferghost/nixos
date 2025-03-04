{ pkgs, inputs, ... }: {
  home = {
    username = "jaap";
    homeDirectory = "/home/jaap";
    stateVersion = "24.11";
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
