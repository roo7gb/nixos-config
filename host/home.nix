# home.nix

{ pkgs, ... }: {

  # - USER INFO --------------- #
  home.username = "roo7gb";
  home.homeDirectory = "/home/roo7gb";
  home.stateVersion = "26.05";

  # - CURSOR ------------------ #
  home.pointerCursor = {
    enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  }; # exists because it wasn't working entirely in hyprland config

  # - IMPORTS ----------------- #
  imports = [
    ../homeManagerModules
  ];
}
