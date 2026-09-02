# .nixflake/modules/bundles/gaming/default.nix

{ self, moduleWithSystem, ... }: {

  flake.nixosModules.gaming = moduleWithSystem (
    { pkgs, unfreePkgs, ... }: let

      modules = with self.nixosModules; [
        steam
      ];
    in {
      imports = modules;

      environment.systemPackages = [
        pkgs.prismlauncher
        unfreePkgs.vintagestory
      ];
    }
  );
}

