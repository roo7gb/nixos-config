# stylix.nix

{
  lib,
  ...
}:
{
  stylix = {
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
      wezterm = {
        enable = true;
	fonts.enable = false;
      };
      yazi.enable = true;
      zen-browser.enable = true;
    };
  };
}

