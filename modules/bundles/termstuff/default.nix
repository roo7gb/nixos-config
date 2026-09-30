# .nixflake/modules/bundles/termstuff/default.nix

{ self, moduleWithSystem, ... }: {

  flake.nixosModules.termstuff = moduleWithSystem (
    { pkgs, ... }: {

      environment.systemPackages = with pkgs; [
        cava
        terminal-toys
        pipes
        aalib
        peaclock
        weathr
      ];
    }
  );
}

