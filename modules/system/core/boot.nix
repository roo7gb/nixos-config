# .nixflake/modules/system/core/boot.nix

{ self, inputs, ... }: {

  flake.nixosModules.bootloader = { pkgs, lib, ... }: {
  
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}

