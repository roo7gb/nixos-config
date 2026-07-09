# stylix.nix

{ ... }: {

  # - CONFIG ------------------ #
  stylix = {
    targets = {
      btop.enable = true;
      cava.enable = true;
      nvf = {
        enable = true;
        transparentBackground = {
          main = true;
          numberLine = true;
          signColumn = true;
        };
      };
      nushell.enable = true;
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

