# stylix.nix

{ config, lib, ... }: {

  # - TOGGLE ------------------ #
  options = {
    stylixHM.enable =
      lib.mkEnableOption "enables stylixHM";
  };

  # - CONFIG ------------------ #
  stylix = lib.mkIf config.stylixHM.enable {
    targets = {
      btop.enable = true;
      cava.enable = true;
      mako = {
        enable = true;
	fonts.enable = false;
      };
      neovim = {
        enable = true;
	transparentBackground = {
	  main = true;
	  numberLine = true;
	  signColumn = true;
	};
      };
      nushell.enable = true;
      rofi = {
        enable = true;
	fonts.enable = false;
      };
      spotify-player.enable = true;
      vesktop = {
        enable = true;
	fonts.enable = false;
      };
      wezterm = {
        enable = true;
	fonts.enable = false;
      };
      yazi.enable = true;
      zen-browser.enable = true;
    };
  };
}

