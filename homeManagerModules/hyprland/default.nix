# hyprland.nix

{ ... }: {

  # - IMPORTS ---------- #
  imports = [
    ./startup.nix
    ./monitors.nix
    ./env.nix
    ./layouts.nix
    ./general.nix
    ./input.nix
    ./animation.nix
    ./decoration.nix
    ./misc.nix
    ./binds.nix
    ./layerrules.nix
    ./windowrules.nix
    ./workspace.nix
  ];

  # - HYPRLAND --------- #
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

