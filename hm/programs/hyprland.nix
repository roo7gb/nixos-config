# hyprland.nix

{
  lib,
  catppuccin,
  ...
}:
{
  catppuccin.hyprland.enable = true;

  # ----- IMPORTS ----- #
  imports = [
    ./hyprland/startup.nix
    ./hyprland/monitors.nix
    ./hyprland/env.nix
    ./hyprland/layouts.nix
    ./hyprland/general.nix
    ./hyprland/input.nix
    ./hyprland/animation.nix
    ./hyprland/decoration.nix
    ./hyprland/misc.nix
    ./hyprland/binds.nix
    ./hyprland/layerrules.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

