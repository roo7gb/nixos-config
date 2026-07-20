# .nixflake/modules/bundles/office/default.nix

{ self, moduleWithSystem, ... }: {

  flake.nixosModules.office = moduleWithSystem (
    { pkgs, ... }: {

      environment.systemPackages = with pkgs; [
        libreoffice-fresh
        obsidian
      ];
    }
  );
}

