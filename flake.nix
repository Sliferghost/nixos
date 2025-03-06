{
  description = "Jaap's NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nur,
      catppuccin,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
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
        ];
      };

      homeConfigurations.jaap = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./home-manager/home.nix
          catppuccin.homeManagerModules.catppuccin
          nixvim.homeManagerModules.nixvim
        ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
