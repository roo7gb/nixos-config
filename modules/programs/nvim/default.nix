# .nixflake/modules/programs/nvim/default.nix

{ moduleWithSystem, ... }: {

  flake.nixosModules.nvim = moduleWithSystem (
    { self', ... }: {

      environment.systemPackages = with self'.packages; [
        nvim
      ];
    }
  );
  perSystem = { inputs', ... }: {

    packages.nvim = inputs'.nvim.packages.default;
  };
}

