# wezterm.nix

{ ... }: {

  # - CONFIG ------------------ #
  programs.wezterm = {
    enable = true;

    settings = {
      font_size = 12.0;
      hide_tab_bar_if_only_one_tab = true;
    };
  };
}

