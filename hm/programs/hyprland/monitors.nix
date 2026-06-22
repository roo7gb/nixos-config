# monitors.nix

{
  ...
}:
{
  # ----- MONITORS ----- #
  wayland.windowManager.hyprland.settings.monitor = [
    (lib.generators.mkLuaInline ''{ output = "DP-1", mode = "highres", position = "1080x840", scale = 1}'')
    (lib.generators.mkLuaInline ''{ output = "HDMI-A-1", mode = "highres", position = "0x0", scale = 1, transform = 3}'')
  ]; 
}

