# .nixflake/modules/programs/wezterm/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.wezterm = moduleWithSystem (
    { self', pkgs, ... }: {
      environment.systemPackages = [
        self'.packages.wezterm
        pkgs.nerd-fonts.mononoki
      ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.wezterm = inputs.wrappers.wrappers.wezterm.wrap {
      inherit pkgs;
      "wezterm.lua".path = ./wezterm.lua;
    };
  };
}

