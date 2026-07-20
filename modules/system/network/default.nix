# .nixflake/modules/system/network/default.nix

{ self, inputs, ... }: {

  flake.nixosModules.network = { pkgs, lib, ... }: {

    networking = {
      networkmanager.enable = true;
      firewall.enable = true;
    };

    services.resolved.enable = true;
  };
}

