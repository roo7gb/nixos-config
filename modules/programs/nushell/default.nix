# .nixflake/modules/programs/zsh/default.nix

{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.nushell = moduleWithSystem (
    { pkgs, self', ... }: {
      nixpkgs.overlays = [
        (final: prev: {
          nushell = self'.packages.nushell;
        })
      ];
      programs.nushell = {
        enable = true;
      };
      users.defaultUserShell = pkgs.nushell;
    }
  );

  perSystem = { pkgs, lib, self', ... }: {
    packages = {
      nushell = inputs.wrappers.wrappers.nushell.wrap {
        inherit pkgs;
        runtimePkgs = with pkgs; [ carapace ];
        "env.nu".content = ''
          $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' #optional
          mkdir ($nu.cache-dir | path join "carapace")
          carapace _carapace nushell | save --force ($nu.cache-dir | path join "carapace/init.nu")
        '';
        "config.nu".content = ''
          source ($nu.cache-dir | path join "carapace/init.nu")
          let carapace_completer = {|spans|CARAPACE_LENIENT=1 carapace $spans | from json}
          $env.config = {
            completions: {
              external: {
                enable: true
                completer: $carapace_completer
              }
            }
          }
          ${lib.getExe self'.packages.ohMyPosh} init nu --strict
        '';
      }; 
      #ohMyPosh = inputs.wrappers.wrappers.oh-my-posh.wrap {
      #  inherit pkgs;
      #  configFile = ./config.json;
      #};
    };
  };
}

