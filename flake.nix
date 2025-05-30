{
  description = "Jaap's NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nur,
      catppuccin,
      nixvim,
      zen-browser,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          nur.overlays.default
        ];
      };
    in
    {

      nixosConfigurations.gaming-pc = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/gaming-pc/configuration.nix
        ];
      };

      nixosConfigurations.mini-pc = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/mini-pc/configuration.nix
          {
            nixpkgs.config.allowUnfree = true;
          }
        ];
      };

      homeConfigurations.jaap = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
          catppuccin.homeModules.catppuccin
          nixvim.homeManagerModules.nixvim
        ];
        extraSpecialArgs = {
          inherit inputs;
          inherit unstable;
        };
      };
    };
}
