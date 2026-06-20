# flake.nix

{
  description = "r7gb home manager configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, inputs, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };
    in {
      nixosConfigurations = {
        TARDIS = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };

          modules = [ ./nix/configuration.nix ];
        };
      };
      homeConfigurations = {
        roo7gb = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hm/home.nix
          ];
        };
      };
    };
}
