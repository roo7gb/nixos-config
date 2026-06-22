# wezterm.nix

{
  lib,
  ...
}:
{
  programs.wezterm = {
    enable = true;

    settings = {
      color_scheme = "Catppuccin Mocha";
      font_size = 12.0;
      hide_tab_bar_if_only_one_tab = true;
    };
  };
}
