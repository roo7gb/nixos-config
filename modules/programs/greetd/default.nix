# .nixflake/modules/programs/greetd/default.nix

{ self, inputs, ... }: {

  flake.nixosModules.greetd = { pkgs, lib, ... }: {

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/start_hyprland";
          user = "roo7gb";
        };
        default_session = initial_session;
      };
    };
  };
}

