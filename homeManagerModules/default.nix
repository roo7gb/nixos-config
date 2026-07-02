# default.nix

{ config, lib, pkgs, ... }: {
  import = [
    ./git.nix
    ./hyprlock.nix
    ./nushell.nix
    ./fastfetch.nix
    ./mako.nix
    ./nvim.nix
    ./rofi.nix
    ./spotify-player.nix
    ./stylix.nix
    ./vesktop.nix
    ./waybar.nix
    ./wezterm.nix
    ./wlogout.nix
    ./hyprland
  ];

  hyprland.enable = true;
  git.enable = true;
  hyprlock.enable = true;
  nushell.enable = true;
  fastfetch.enable = true;
  mako.enable = true;
  nvim.enable = true;
  rofi.enable = true;
  stylixHM.enable = true;
  wezterm.enable = true;
  wlogout.enable = true;
}

