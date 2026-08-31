# .nixflake/modules/hosts/TARDIS/tardisConfiguration.nix

{ self, inputs, ... }: {

  flake.nixosModules.tardisConfiguration = { ... }: {

    networking.hostName = "TARDIS";
    imports = [ ./_hardware-configuration.nix ];
  };
}

