{
  description = "Jaap's NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty.url = "github:ghostty-org/ghostty";
    nur.url = "github:nix-community/nur";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, ghostty, nur, catppuccin, ... }@inputs : 
    let
      system = "x86_64-linux";
    in {

    nixosConfigurations.gaming-pc = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
        ./nixos/configuration.nix 
      ];
    };

    homeConfigurations.jaap = home-manager.lib.homeManagerConfiguration {
	    pkgs = nixpkgs.legacyPackages.${system};
	    modules = [
		    ./home-manager/home.nix 
		    catppuccin.homeManagerModules.catppuccin
	    ];
	    extraSpecialArgs = { inherit inputs; };
    };
  };
}
