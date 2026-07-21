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
          v = lib.getExe self'.packages.nvim;
          carapace = lib.getExe pkgs.carapace;
          ff = "fastfetch --logo-type kitty --logo-recache --logo-height 15 --logo ~/.nixflake/etc/ff_logos/yakumOS.png";
          yolo = ''${lib.getExe self'.packages.git} add . && ${lib.getExe self'.packages.git} commit -m "$(curl -fsSL https://whatthecommit.com/index.txt)" -m '(auto-msg whatthecommit.com)' -m "$(${lib.getExe self'.packages.git} status)" && ${lib.getExe self'.packages.git} push'';
          yeet = "rm -rf";
          nsh = "nix-shell -p";
        };
        zshrc.content = ''
          if (( ''${+terminfo[smkx]} )) && (( ''${+terminfo[rmkx]} )); then
            function zle-line-init() { echoti smkx }
            function zle-line-finish() { echoti rmkx }
            zle -N zle-line-init
            zle -N zle-line-finish
          fi
          autoload -Uz compinit && compinit
          export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
          zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
          source <(${lib.getExe pkgs.carapace} _carapace)
          zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper"]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

          autoload -U select-word-style
          select-word-style bash

          ZSH_HIGHLIGHT_STYLES[path]='none'

          autoload -U up-line-or-beginning-search down-line-or-beginning-search
          zle -N up-line-or-beginning-search
          zle -N down-line-or-beginning-search
          bindkey "^[OA" up-line-or-beginning-search
          bindkey "^[0B" down-line-or-beginning-search

          bindkey "^[[1;5C" forward-word
          bindkey "^[[1;5D" backward-word
          bindkey "^[[3;5~" kill-word
          bindkey "^H" backward-kill-word

          source <(${lib.getExe pkgs.fzf} --zsh)

          setopt NO_CASE_GLOB

          export EDITOR=nvim

          eval "$(${lib.getExe pkgs.devenv} hook zsh)"
          eval "$(${lib.getExe self'.packages.ohMyPosh} init zsh)"

          ${lib.getExe pkgs.any-nix-shell} zsh --info-right | source /dev/stdin
          fastfetch --logo-type kitty --logo-recache --logo-height 15 --logo ~/.nixflake/etc/ff_logos/yakumOS.png
        '';
      };
      ohMyPosh = inputs.wrappers.wrappers.oh-my-posh.wrap {
        inherit pkgs;
        configFile = ./config.json;
      };
    };
  };
}

