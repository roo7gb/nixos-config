# .nixflake/modules/programs/fuzzel/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.fuzzel = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = [
        self'.packages.fuzzel
      ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.fuzzel = inputs.wrappers.wrappers.fuzzel.wrap {
      inherit pkgs;
      settings = {
        colors = {
          background = "161616dd";
          text = "d6b471ff";
          prompt = "606060ff";
          placeholder = "484848ff";
          input = "d6b471ff";
          match = "6965a6ff";
          selection = "d6b471ff";
          selection-text = "161616dd";
          selection-match = "6965a6ff";
          counter = "484848ff";
          border = "161616dd";
        };
      };
    };
  };
}

