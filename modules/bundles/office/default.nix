# .nixflake/modules/bundles/office/default.nix

{ self, moduleWithSystem, ... }: {

  flake.nixosModules.office = moduleWithSystem (
    { pkgs, unfreePkgs, ... }: {

      environment.systemPackages = [
        pkgs.libreoffice-stable
        unfreePkgs.obsidian
      ];
    }
  );
}

