# .nixflake/modules/bundles/gaming/default.nix

{ self, moduleWithSystem, ... }: {

  flake.nixosModules.gaming = moduleWithSystem (
    { pkgs, unfreePkgs, ... }: let

      modules = with self.nixosModules; [
        steam
      ];
      packages = with pkgs; [
        prismlauncher
        (retroarch.withCores (cores: with cores; [
          mgba
        ]))
        azahar
        melonds
      ];
    in {
      imports = modules;
      environment.systemPackages = packages ++ [ unfreePkgs.vintagestory ];
    }
  );
}

