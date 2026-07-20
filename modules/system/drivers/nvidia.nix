# .nixflake/modules/system/drivers/nvidia.nix

{ self, inputs, ... }: {

  flake.nixosModules.nvidiaDrivers = { config, pkgs, lib, ... }: {

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };

      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.latest;
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
      };
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}

