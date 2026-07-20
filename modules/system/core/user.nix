# .nixflake/modules/system/core/user.nix

{ self, inputs, ... }: {

  flake.nixosModules.user = { pkgs, lib, ... }: let

    modules = with self.nixosModules; [
      zsh
    ];
  in {
    imports = modules;
    users.users."roo7gb" = {
      isNormalUser = true;
      initialPassword = "102030";
      shell = pkgs.zsh;
      description = "Root Goldberg";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}

