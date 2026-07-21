# .nixflake/modules/programs/wezterm/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.wezterm = moduleWithSystem (
    { self' }: {
      environment.systemPackages = with self'.packages; [
        wezterm
        nerd-fonts.mononoki
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

