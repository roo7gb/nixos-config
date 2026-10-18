# .nixflake/modules/system/drivers/nvidia.nix

{ self, inputs, ... }: {

  flake.nixosModules.nvidiaDrivers = { config, pkgs, lib, ... }: {

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };

      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
        powerManagement.enable = false;
      };
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}

