# home.nix

{ config, lib, pkgs, inputs, ... }: {

  home.username = "roo7gb";
  home.homeDirectory = "/home/roo7gb";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
      awww
      btop
      brightnessctl
      cava
      gimp
      git-credential-oauth
      hyprpolkitagent
      hyprshot
      imagemagick
      nerd-fonts.agave
      pavucontrol
      playerctl
      prismlauncher
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
    ../homeManagerModules
  ];

  # - TOGGLES ----------------- #
  spotify.enable = true;
  vesktop.enable = true;
}
