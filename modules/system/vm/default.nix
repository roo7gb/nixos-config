# .nixflake/modules/system/vm/default.nix

{ self, inputs, ... }: {

  flake.nixosModules.virtualization = { pkgs, lib, ... }: {

    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
      spiceUSBRedirection.enable = true;
    };

    users.groups.libvirtd.members = [ "roo7gb" ];
    users.groups.kvm.members = [ "roo7gb" ];

    environment.systemPackages = with pkgs; [
      gnome-boxes
      dnsmasq
      phodav
    ];
  };
}

