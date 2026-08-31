# .nixflake/modules/system/systemTheme/default.nix

{ self, inputs, ... }: {

  flake.nixosModules.systemTheme = { config, pkgs, lib, ... }: let

    modules = with self.nixosModules; [
      phCursors
      gtkTheme
    ];
  in {
    imports = modules;
  };
}

