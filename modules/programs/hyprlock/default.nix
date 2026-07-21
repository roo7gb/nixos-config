# .nixflake/modules/programs/hyprlock/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.hyprlock = moduleWithSystem (
    { self', pkgs, ... }: {
      environment.systemPackages = [
        self'.packages.hyprlock
        pkgs.nerd-fonts.jetbrains-mono
      ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.hyprlock = inputs.wrappers.wrappers.hyprlock.wrap {
      inherit pkgs;
      "hyprlock.conf".path = ./hyprlock.conf;
    };
  };
}

