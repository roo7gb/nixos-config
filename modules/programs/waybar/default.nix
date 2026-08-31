# .nixflake/modules/programs/waybar/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.waybar = moduleWithSystem (
    { self', ... }: {
      programs.waybar = {
        enable = true;
        package = self'.packages.waybar;
      };
    }
  );

  perSystem = { pkgs, ... }: {
    packages.waybar = inputs.wrappers.wrappers.waybar.wrap {
      inherit pkgs;
      configFile.path = ./config.json;
      "style.css".path = ./style.css;
    };
  };
}

