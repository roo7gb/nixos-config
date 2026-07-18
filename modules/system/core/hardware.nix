# .nixflake/modules/system/core/hardware.nix

{ self, inputs, ... }: {

  flake.nixosModules.hardware = { pkgs, lib, ... }: {

    hardware = {
      bluetooth.enable = true;
      # xpadneo.enable = true;
    };
  };
}

