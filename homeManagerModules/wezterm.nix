# wezterm.nix

{ config, lib, ... }: {

  # - TOGGLE ------------------ #
  options = {
    wezterm.enable =
      lib.mkEnableOption "enables wezterm";
  };

  # - CONFIG ------------------ #
  programs.wezterm = lib.mkIf config.wezterm.enable {
    enable = true;

    settings = {
      font_size = 12.0;
      hide_tab_bar_if_only_one_tab = true;
    };
  };
}

