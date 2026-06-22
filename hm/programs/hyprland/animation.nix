# animation.nix

{
  ...
}:
{
  # ----- ANIMATIONS TOGGLE ----- #
  wayland.windowManager.hyprland.settings.config.animations = {
    enabled = true;
  };

  # ----- CURVE ----- #
  wayland.windowManager.hyprland.settings.curve = [
    ## default curve
    {
      _args = [
        "default"
        (lib.generators.mkLuaInline ''{ type = "bezier", points = { { 0, 1 }, { 0, 1 } } }'')
      ];
    }
    ## wind curve
    {
      _args = [
        "wind"
	(lib.generators.mkLuaInline ''{ type = "bezier", points = { { 0.05, 0.618 }, { 0.1, 1 } } }'')
      ];
    }
    ## winIn curve
    {
      _args = [
        "winIn"
        (lib.generators.mkLuaInline ''{ type = "bezier", points = { { 0.1, 1.1 }, {0.1, 1 } } }'')
      ];
    }
    ## winOut curve
    {
      _args = [
        "winOut"
        (lib.generators.mkLuaInline ''{ type = "bezier", points = { { 0.3, 1 }, { 0, 1 } } }'')
      ];
    }
    ## linear curve
    {
      _args = [
        "linear"
        (lib.generators.mkLuaInline ''{ type = "bezier", points = { { 1, 1 }, { 1, 1 } } }'')
      ];
    }
    ## ease curve
    {
      _args = [
        "ease"
        (lib.generators.mkLuaInline ''{ type = "bezier", points = { { 0, 1 }, { 0.618, 1 } } }'')
      ];
    }
  ];

  # ----- ANIMATIONS ----- #
  wayland.windowManager.hyprland.settings.animation = [
    {
      _args = [
        (lib.generators.mkLuaInline ''{ leaf = "windowsIn", enabled = true, speed = 1.618, bezier = "ease", style = "slide" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''{ leaf = "windowsOut", enabled = true, speed = 1.618, bezier = "ease", style = "slide" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''{ leaf = "windowsMove", enabled = true, speed = 1.618, bezier = "ease", style = "slide" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''{ leaf = "workspaces", enabled = true, speed = 1.618, bezier = "ease", style = "slide" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''{ leaf = "layers", enabled = true, speed = 1.618, bezier = "ease", style = "slide" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''{ leaf = "specialWorkspace", enabled = true, speed = 1.618, bezier = "ease", style = "slidevert" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''{ leaf = "fadePopups", enabled = true, speed = 1.618, bezier = "ease" }'')
      ];
    }
  ];
}

