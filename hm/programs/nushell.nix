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
      $env_config = {
        show_banner = false,
	completions: {
	  case_sensitive = false
	  quick = true
	  partial = true
	  algorithm = "fuzzy"
	  external: {
            max_results: 100
	  }
	}
      }
      fastfetch
    '';
  };
}
