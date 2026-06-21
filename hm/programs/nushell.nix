# nushell.nix

{
  lib,
  pkgs,
  ...
}:
{
  programs.nushell = {
    enable = true;
    shellAliases = {
      v = "nvim";
    };
    extraConfig = ''
      $env.config = {
        show_banner: false,
	completions: {
	  case_sensitive: false
	  quick: true
	  partial: true
	  algorithm: "fuzzy"
	  external: {
            max_results: 100
	  }
	}
      }
      fastfetch --logo-type kitty --logo-recache --logo-height 25 --logo "~/.nixflake/etc/cirnos.png"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        error_symbol = "X ";
      };
    };
  };
}
