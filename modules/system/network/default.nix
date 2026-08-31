# .nixflake/modules/system/network/default.nix

{ self, inputs, ... }: {

  flake.nixosModules.network = { pkgs, lib, ... }: {

    networking = {
      networkmanager.enable = true;
      firewall = {
        enable = true;
        allowedTCPPorts = [ 42420 ];
        allowedUDPPorts = [ 42420 ];
      };
    };

    services.resolved.enable = true;
  };
}

