# home.nix

{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "roo7gb";
  home.homeDirectory = "/home/roo7gb";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
      awww
      btop
      brightnessctl
      fastfetch
      git
      gh
      gimp
      hyprlock
      hyprpolkitagent
      hyprshot
      imagemagick
      mako
      neovim
      nerd-fonts.agave
      pay-respects
      pavucontrol
      playerctl
      rofi
      vesktop
      waybar
      wezterm
      wlogout
      yazi
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  home.pointerCursor = {
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  imports = [
    ./programs/catppuccinHM.nix
    ./programs/hyprland.nix
    ./programs/hyprlock.nix
    ./programs/nushell.nix
    ./programs/fastfetch.nix
    ./programs/waybar.nix
    ./programs/wlogout.nix
  ];
}
