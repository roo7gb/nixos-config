# .nixflake/modules/programs/wezterm/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.mpv = moduleWithSystem (
    { self', ... }: {

      environment.systemPackages = with self'.packages; [
        mpv-unwrapped
      ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.mpv-unwrapped = inputs.wrappers.wrappers.mpv.wrap {
      inherit pkgs;
      script = {
        modernz = {
          path = pkgs.mpvScripts.modernz;
          opts = {
            window_top_bar = false;
          };
        };
      };
    };
  };
}

