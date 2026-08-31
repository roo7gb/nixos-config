# .nixflake/modules/programs/mako/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.mako = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = [
        self'.packages.mako
      ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.mako = inputs.wrappers.wrappers.mako.wrap {
      inherit pkgs;
      settings = {
        anchor = "top-right";
        font = "Mononoki Nerd Font 12";
        margin = 10;
        padding = 10;
        width = 200;
        height = 75;
        border-size = 2;
        border-radius = 5;
        default-timeout = 5000;
        background-color = "#161616";
        text-color = "#d6b471";
        border-color = "#6965a6";
      };
    };
  };
}

