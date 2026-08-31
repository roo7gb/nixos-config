# .nixflake/modules/programs/zsh/default.nix

{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.zsh = moduleWithSystem (
    { pkgs, self', ... }: {
      nixpkgs.overlays = [
        (final: prev: {
          zsh = self'.packages.zsh;
        })
      ];
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableBashCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        histSize = 10000;
      };
      users.defaultUserShell = pkgs.zsh;
    }
  );

  perSystem = { pkgs, lib, self', ... }: {
    packages = {
      zsh = inputs.wrappers.wrappers.zsh.wrap {
        inherit pkgs;
        runtimePkgs = [pkgs.carapace pkgs.fzf];
        zshAliases = {
          ls = lib.getExe pkgs.lsd;
          v = lib.getExe self'.packages.nvim;
          carapace = lib.getExe pkgs.carapace;
          ff = "fastfetch --disable-linewrap --logo-type kitty --logo-recache --logo-height 15 --logo ~/.ff_logo.png";
          devenv = lib.getExe pkgs.devenv;
          yolo = ''${lib.getExe self'.packages.git} add . && ${lib.getExe self'.packages.git} commit -m "$(curl -fsSL https://whatthecommit.com/index.txt)" -m '(auto-msg whatthecommit.com)' -m "$(${lib.getExe self'.packages.git} status)" && ${lib.getExe self'.packages.git} push'';
          yeet = "rm -rf";
          nsh = "nix-shell -p";
        };
        zshrc.content = ''
            autoload -U compinit && compinit
            export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
            zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
            source <(${lib.getExe pkgs.carapace} _carapace)
            zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

            autoload -U select-word-style
            select-word-style bash

            ZSH_HIGHLIGHT_STYLES[path]='none'
            source <(${lib.getExe pkgs.fzf} --zsh)

            export EDITOR=nvim

            eval "$(${lib.getExe pkgs.devenv} hook zsh)"
            eval "$(${lib.getExe self'.packages.ohMyPosh} init zsh)"

            ${lib.getExe pkgs.any-nix-shell} zsh --info-right | source /dev/stdin
            fastfetch --disable-linewrap --logo-type kitty --logo-recache --logo-height 15 --logo ~/.ff_logo.png
        '';
      };
      ohMyPosh = inputs.wrappers.wrappers.oh-my-posh.wrap {
        inherit pkgs;
        configFile = ./config.json;
      };
    };
  };
}

