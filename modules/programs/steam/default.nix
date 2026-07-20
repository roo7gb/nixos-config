# .nixflake/modules/programs/steam/default.nix

{ moduleWithSystem, ... }: {

  flake.nixosModules.steam = moduleWithSystem (
    { pkgs, unfreePkgs, inputs', lib, ... }: {

      programs.steam = {
        enable = true;
        protontricks.enable = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
        package = unfreePkgs.steam;
      };
    }
  );
}

