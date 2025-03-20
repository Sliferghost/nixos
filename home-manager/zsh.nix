{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakePath = "~/nix";
      in
      {
        ns = "sudo nixos-rebuild switch --flake ${flakePath}/#mini-pc";
        ngc = "sudo nix-collect-garbage -d";
        hms = "home-manager switch --flake ${flakePath}/#jaap";
        nu = "sudo nix flake update --flake ${flakePath} && ns && hms";

        copy-username = "lpass show --clip --username -F";
        copy-password = "lpass show --clip --password -F";

        n = "nvim";

        ls = "eza";
        l = "eza -alh";
        tree = "eza --tree";
        cat = "bat";
        cd = "z";

        lg = "lazygit";
      };

    initExtra = ''
      export PATH="${pkgs.jdk21}/bin:$PATH"
    '';
  };
}
