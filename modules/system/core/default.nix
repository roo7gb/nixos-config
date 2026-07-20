# .nixflake/modules/system/core/default.nix

{ self, inputs, modulesPath, ... }: {

  flake.nixosModules.core = { pkgs, lib, ... }: let

    modules = with self.nixosModules; [
      user
      bootloader
      nix
      hardware
      locale
    ];
  in {
    imports = [ /etc/nixos/hardware-configuration.nix ] ++ modules;
    services = {
      openssh.enable = true;
      avahi.enable = true;
    };
    environment.systemPackages = with pkgs; [
      vim
      unzip
      p7zip-rar
      usbutils
      lsof
      libnotify
      curlWithGnuTls
      wget
    ];
    system.stateVersion = "26.05";
  };
}

