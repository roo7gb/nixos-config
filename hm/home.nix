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
      vesktop
      waybar
      wezterm
      wlogout
      wofi
      yazi
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

  imports = [
    ./programs/hyprland.nix
    ./programs/hyprlock.nix
    ./programs/nushell.nix
    ./programs/fastfetch.nix
    ./programs/waybar.nix
  ];
}
