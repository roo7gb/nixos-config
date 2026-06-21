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
      fastfetch
      git
      gh
      gimp
      hyprlock
      hyprshot
      kitty
      mako
      neovim
      nerd-fonts.agave
      thefuck
      vesktop
      waybar
      wezterm
      wofi
      yazi
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

  imports = [
    ./programs/hyprland.nix
    ./programs/nushell.nix
    ./programs/fastfetch.nix
  ];
}
