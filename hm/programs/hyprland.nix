# hyprland.nix

{
  lib,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
