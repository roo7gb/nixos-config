# hyprland.nix

{ config, lib, pkgs, ... }: {

  # - TOGGLE ----------- #
  options = {
    hyprland.enable =
      lib.mkEnableOption "enables hyprland";
  };

  # - IMPORTS ---------- #
  imports = lib.mkIf config.hyprland.enable [
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
    ./hyprland/windowrules.nix
  ];

  # - HYPRLAND --------- #
  wayland.windowManager.hyprland = lib.mkIf config.hyprland.enable {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

