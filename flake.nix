# flake.nix

{
  description = "r7gb home manager configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    config-overlays = {
      url = "github:roo7gb/nix-wrapper-overlays";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, nvf, config-overlays, ... }: {
    nixosConfigurations.TARDIS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./host/configuration.nix
        {
         nixpkgs.overlays = with config-overlays; [
            overlays.conf-fastfetch
        #    overlays.conf-hyprland
        #    overlays.conf-hyprlock
        #    overlays.conf-nushell
            overlays.conf-wezterm
          ];
        }
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.roo7gb = {
              imports = [
                ./host/home.nix
                nvf.homeManagerModules.default
              ];
            };
            backupFileExtension = "backup";
            extraSpecialArgs = {
              inherit inputs;
            };
          };
        }
      ];
    };
  };
}
