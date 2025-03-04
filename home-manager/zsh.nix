{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = 
    let
      flakePath = "~/nix";
    in {
      ns = "sudo nixos-rebuild switch --flake ${flakePath}/#gaming-pc";
      ngc = "sudo nix-collect-garbage -d";
      hms = "home-manager switch --flake ${flakePath}/#jaap";

      n = "nvim";

      ls = "eza";
      l = "eza -alh";
      tree = "eza --tree";
      cat = "bat";
      cd = "z";

      lg = "lazygit";
    };
  };
}
