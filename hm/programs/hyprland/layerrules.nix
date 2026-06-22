# layerrules.nix

{
  lib,
  ...
}:
{
  # ----- LAYER RULES ----- #
  wayland.windowManager.hyprland.settings.layer_rule = [
    (lib.generators.mkLuaInline ''{ match = { namespace = "waybar" }, blur = true }'')
    (lib.generators.mkLuaInline ''{ match = { namespace = "rofi" }, blur = true }'')
    (lib.generators.mkLuaInline ''{ match = { namespace = "mako" }, blur = true }'')

    (lib.generators.mkLuaInline ''{ match = { namespace = "waybar" }, blur_popups = true }'')
    (lib.generators.mkLuaInline ''{ match = { namespace = "rofi" }, blur_popups = true }'')
    (lib.generators.mkLuaInline ''{ match = { namespace = "mako" }, blur_popups = true }'')

    (lib.generators.mkLuaInline ''{ match = { namespace = "waybar" }, ignore_alpha = 0.1 }'')
    (lib.generators.mkLuaInline ''{ match = { namespace = "rofi" }, ignore_alpha = 0.1 }'')
    (lib.generators.mkLuaInline ''{ match = { namespace = "mako" }, ignore_alpha = 0.1 }'')

    (lib.generators.mkLuaInline ''{ match = { namespace = "rofi" }, animation = "fade" }'')
    (lib.generators.mkLuaInline ''{ match = { namespace = "awww" }, animation = "fade" }'')
  ];
}

