# flake.nix

{
  description = "r7gb home manager configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        roo7gb = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hm/home.nix ];
        };
      };
    };
}

