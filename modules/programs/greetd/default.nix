# .nixflake/modules/programs/greetd/default.nix

{ moduleWithSystem, self, inputs, lib, ... }: {

  flake.nixosModules.greetd = moduleWithSystem (
    { self', pkgs, ... }: {

      services.greetd = {
        enable = true;
        settings = rec {
          initial_session = {
            command = "${self'.packages.hyprland}/bin/start-hyprland";
            user = "roo7gb";
          };
          default_session = initial_session;
        };
      };
    }
  );
}

