# .nixflake/modules/system/core/default.nix

{ self, inputs, ... }: {

  flake.nixosModules.core = { pkgs, lib, ... }: let

    modules = with self.nixosModules; [
      user
      bootloader
      nix
      hardware
      locale
    ];
  in {
    imports = modules;
    services = {
      openssh.enable = true;
      avahi.enable = true;
      power-profiles-daemon.enable = true;
      upower.enable = true;
    };
    environment.systemPackages = with pkgs; [
      vim
      lsd
      unzip
      p7zip-rar
      usbutils
      lsof
      libnotify
      curlWithGnuTls
      wget
      lm_sensors
    ];
    system.stateVersion = "26.05";
  };
}

