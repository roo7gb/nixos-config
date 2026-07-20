# .nixflake/modules/programs/hyprland/default.nix

{ moduleWithSystem, self, inputs, ... }: {
  flake.nixosMosules.hyprland = moduleWithSystem (
    { self', pkgs, inputs', ... }: { config, ... }: let
      modules = with self.nixosModules; [
        audio
        systemTheme
      ];
      runtimePkgs = self'.packages.hyprland.passthru.runtimePackages;
      lib = pkgs.lib;

      runtimeTarget = name: pkg:
        if config.security.wrappers ? ${name}
        then "/run/wrappers/bin/${name}"
        else lib.getExe pkg;
    in {
      imports = modules;
      programs.hyprland = {
        enable = true;
        package = self'.packages.hyprland;
      };
      services.xserver.enable = true;
      security.polkit.enable = true;
      system.activationScripts.hyprRuntimeEnv = lib.stringAfter [ "specialfs" ] ''
        mkdir -p /run/hypr-runtime-env/bin
        ${lib.concatStringsSep "\n" (lib.mapAttrsToList (name: pkg: ''
            ln -sfn ${runtimeTarget name pkg} /run/hypr-runtime-env/bin/${name}
          '')
        runtimePkgs)}
      '';
      system.activationScripts.hyprConfig = lib.stringAfter [ "specialfs" ] ''
        mkdir -p /run/hypr/config
        ln -sfn ${inputs.hyprland-config}/* /run/hypr/config
      '';
    }
  );
  perSystem = { self', system, inputs', ... }: {
    packages = {
      hyprland = inputs'.hyprland.packages.default.override {
        flags."--config" = "/run/hypr/config/hyprland.lua";
        env."MODULES_ROOT" = "/run/hypr/config/modules";
        runtimePackages =
          inputs.hyprland.lib.defaultRuntimePkgs.${system}
          // {
            wezterm = self'.packages.wezterm;
            quickshell = self'.packages.quickshell;
            hyprlock = self'.packages.hyprlock;
          };
      };
    };
  };
}
              
