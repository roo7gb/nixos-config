# .nixflake/modules/programs/hyprlock/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.hyprlock = moduleWithSystem (
    { self' }: {
      environment.systemPackages = with self'.packages; [
        hyprlock
      ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.hyprlock = inputs.wrappers.wrappers.hyprlock.wrap {
      "hyprlock.conf".path = ./hyprlock.conf;
    };
  };
}

