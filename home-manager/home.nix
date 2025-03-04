{ inputs, ... }: {
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
    ./bat.nix
    ./bash.nix
    ./eza.nix
    ./firefox.nix
    ./git.nix
    ./ghostty.nix
    ./lazygit.nix
    ./neovim.nix
    ./ssh.nix
    ./zoxide.nix
  ];
}
