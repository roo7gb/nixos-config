# .nixflake/modules/system/desktop/default.nix

{ self, moduleWithSystem, ... }: {

  flake.nixosModules.desktop = moduleWithSystem (
    { ... }: let

      modules = with self.nixosModules; [
        core
        audio
        hyprland
        greetd
        network
      ];
    in {
      imports = modules;
    }
  );
}

