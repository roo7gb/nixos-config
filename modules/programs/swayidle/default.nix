# .nixflake/modules/programs/swayidle/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.swayidle = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = [
        self'.packages.swayidle
      ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.swayidle = inputs.wrappers.wrappers.swayidle.wrap {
      inherit pkgs;
      events = {
        before-sleep = "hyprlock --immediate";
      };
      timeouts = [
        {
          timeout = 300;
          command = "hyprlock";
        }
        {
          timeout = 480;
          command = "systemctl suspend";
        }
      ];
    };
  };
}

