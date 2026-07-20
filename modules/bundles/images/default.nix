# .nixflake/modules/bundles/images/default.nix

{ self, moduleWithSystem, ... }: {

  flake.nixosModules.images = moduleWithSystem (
    { pkgs, ... }: {

      environment.systemPackages = with pkgs; [
        gimp
        imagemagick
      ];
    }
  );
}

