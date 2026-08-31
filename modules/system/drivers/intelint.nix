# .nixflake/modules/system/drivers/intelint.nix

{ self, inputs, ... }: {

  flake.nixosModules.intelIntDrivers = { config, pkgs, lib, ... }: {

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
      ];
    };

    services.xserver.videoDrivers = [ "modesetting" ];
  };
}

