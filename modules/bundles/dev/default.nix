# .nixflake/modules/bundles/dev/default.nix

{ self, moduleWithSystem, ... }: {

  flake.nixosModules.development = moduleWithSystem (
    { pkgs, ... }: let
    
      modules = with self.nixosModules; [
        git
        nvim
      ];
    in {
      imports = modules;
      environment.systemPackages = with pkgs; [
        devenv
        gnumake
        opencode
      ];
    }
  );
}

