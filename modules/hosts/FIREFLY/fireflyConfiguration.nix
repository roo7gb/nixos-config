# .nixflake/modules/hosts/FIREFLY/fireflyConfiguration.nix

{ self, inputs, ... }: {

  flake.nixosModules.fireflyConfiguration = { ... }: {

    networking.hostName = "FIREFLY";
    imports = [ ./_hardware-configuration.nix ];
    services.logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "lock";
      HandleLidSwitchDocked = "ignore";
    };
  };
}

