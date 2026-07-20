# .nixflake/modules/programs/quickshell/default.nix

{ moduleWithSystem, inputs, ... }: {
  flake.nixosModules.quickshell = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = with self'.packages; [
        quickshell
        lm_sensors
      ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.quickshell = inputs.wrappers.wrappers.quickshell.wrap {
      inherit pkgs;
      configDir = ./quickshell;
      configFile = ./quickshell/shell.qml;
    };
  };
}

