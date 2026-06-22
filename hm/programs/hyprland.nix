# hyprland.nix

{
  lib,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {
    # ----- STARTUP ----- #
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd("waybar")
	      hl.exec_cmd("hyprctl setcursor phinger-cursors-dark 24")
            end'')
        ];
      };

      # ----- MONITORS ----- #
      monitor = [
        (lib.generators.mkLuaInline ''{ output = "DP-1", mode = "highres", position = "1080x840", scale = 1}'')
        (lib.generators.mkLuaInline ''{ output = "HDMI-A-1", mode = "highres", position = "0x0", scale = 1, transform = 3}'')
      ];

      # ----- ENVIRONMENT ----- #
      env = [
        {
	  _args = [
            "LIBVA_DRIVER_NAME"
	    "nvidia"
	  ];
	}
	{
	  _args = [
	    "__GLX_VENDOR_LIBRARY_NAME"
	    "nvidia"
	  ];
	}
	{
	  _args = [
            "HYPRCURSOR_SIZE"
	    "24"
	  ];
	}
	{
	  _args = [
	    "HYPRCURSOR_THEME"
	    "phinger-cursors-dark"
	  ];
	}
	{
	  _args = [
	    "XCURSOR_SIZE"
	    "24"
	  ];
	}
	{
	  _args = [
	    "XCURSOR_THEME"
	    "phinger-cursors-dark"
	  ];
	}
      ];

      # ----- CONFIG ----- #
      config = {
        # ----- LAYOUTS ----- #
        dwindle = {
          force_split = 2;
          preserve_split = true;
          special_scale_factor = 0.95;
        };
        master = {
          new_on_top = 0;
          mfact = 0.5;
          special_scale_factor = 0.5;
          orientation = "right";
        };

        # ----- GENERAL ----- #
        general = {
          layout = "dwindle";
	  border_size = 0;
	  col = {
            active_border = "rgb(808080)";
	    inactive_border = "rgb(000000)";
	  };
	  resize_on_border = true;
	  gaps_in = 7;
	  gaps_out = 10;
	  snap = {
	    enabled = true;
	  };
	};

        # ----- INPUT ----- #
	input = {
          kb_rules = "evdev";
          kb_model = "pc105";
          resolve_binds_by_sym = 1;
          kb_options = "grp:alt_shift_toggle";
          repeat_rate = 50;
          repeat_delay = 300;
          numlock_by_default = 1;
          left_handed = 0;
          follow_mouse = 1;
          float_switch_override_focus = 0;
        };

        # ----- ANIMATIONS TOGGLE ----- #
        animations = {
	  enabled = true;
	};

        # ----- WINDOW DECORATIONS ----- #
	decoration = {
          rounding = 15;
	  dim_strength = 0.1;
	  dim_inactive = true;
	  active_opacity = 0.9;
	  inactive_opacity = 0.85;
	  fullscreen_opacity = 1;
	  blur = {
            contrast = 1;
	    vibrancy = 1;
	    new_optimizations = true;
	    ignore_opacity = true;
	    popups = true;
	    popups_ignorealpha = 0.97;
	    input_methods = true;
	    size = 4;
	    passes = 4;
	  };
	  shadow = {
            enabled = true;
	    range = 15;
	    render_power = 3;
	  };
	};

        # ----- MISC ----- #
	misc = {
          disable_hyprland_logo = true;
	  disable_splash_rendering = false;
	  mouse_move_enables_dpms = true;
	  key_press_enables_dpms = true;
	  enable_swallow = true;
	};
      };

      # ----- BINDS ----- #
      bind =
        map
	  (
	    {
	      keys,
	      dispatcher,
	      flags ? { },
	    }:
	    {
	      _args = [
	        keys
		(lib.generators.mkLuaInline dispatcher)
		flags
	      ];
	    }
	  )
	  [
	    # ----- WINDOW MANAGEMENT ----- #
	    ## fullscreen active window
	    {
	      keys = "SUPER + F";
	      dispatcher = ''hl.dsp.window.fullscreen({ action = "toggle" })'';
	      flags.description = "Toggle fullscreen on active window";
	    }
	    ## close active window
	    {
	      keys = "SUPER + Q";
	      dispatcher = ''hl.dsp.window.close()'';
	      flags.description = "Close active window";
	    }
	    ## kill active window
	    {
	      keys = "SUPER + SHIFT + Q";
	      dispatcher = ''hl.dsp.window.kill()'';
	      flags.description = "Kill active window";
	    }
	    ## float for active window
	    {
	      keys = "SUPER + Space";
	      dispatcher = ''hl.dsp.window.float({ action = toggle })'';
	      flags.description = "Toggle float for active window";
	    }
	    ## pin active window
	    {
	      keys = "SUPER + CTRL + Space";
	      dispatcher = ''hl.dsp.window.pin()'';
	      flags.description = "Pin active window";
	    }

            # ----- OPEN APPS ----- #
	    ## open terminal
	    {
	      keys = "SUPER + RETURN";
	      dispatcher = ''hl.dsp.exec_cmd("wezterm")'';
	      flags.description = "Open wezterm terminal emulator";
	    }
	    ## open floating terminal
	    {
              keys = "SUPER + CTRL + RETURN";
	      dispatcher = ''hl.dsp.exec_cmd("[float] wezterm")'';
	      flags.description = "Open wezterm terminal emulator (floating)";
	    }
            ## open btop
	    {
	      keys = "SUPER + P";
	      dispatcher = ''hl.dsp.exec_cmd("wezterm start -- btop")'';
	      flags.description = "Open btop";
	    }

            # ----- STATUS BAR AND PANELS ----- #
	    ## open app launcher
	    {
	      keys = "SUPER + SUPER_L";
	      dispatcher = ''hl.dsp.exec_cmd("wofi --show run")'';
	      flags.description = "Open application launcher";
	    }

            # ----- SCREENSHOTS ----- #
	    ## screenshot active window
	    {
	      keys = "SUPER + SHIFT + S";
	      dispatcher = ''hl.dsp.exec_cmd("hyprshot -m window -m active --clipboard-only")'';
	      flags.description = "Take a screenshot of an active window to clipboard";
	    }
	    ## screenshot area
	    {
	      keys = "SUPER + CTRL + SHIFT + S";
	      dispatcher = ''hl.dsp.exec_cmd("hyprshot -m region --clipboard-only")'';
	      flags.description = "Take a screenshot of an area to clipboard";
	    }

            # ----- SPECIAL WORKSPACE ----- #
	    ## move to special workspace
	    {
	      keys = "SUPER + CTRL + S";
	      dispatcher = ''hl.dsp.window.move({ workspace = "special" })'';
	      flags.description = "Move active window to special workspace";
	    }
	    ## toggle special workspace
	    {
	      keys = "SUPER + S";
	      dispatcher = ''hl.dsp.workspace.toggle_special()'';
	      flags.description = "Toggle special workspace";
	    }

            # ----- MEDIA, VOLUME, BRIGHTNESS ----- #
	    ## volume up
	    {
	      keys = "ALT + F12";
	      dispatcher = ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")'';
	      flags.locked = true;
	      flags.repeating = true;
	      flags.description = "Increase volume";
	    }
	    ## volume down
            {
	      keys = "ALT + F11";
	      dispatcher = ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'';
	      flags.locked = true;
	      flags.repeating = true;
	      flags.description = "Decrease volume";
	    }
	    ## volume up
            {
	      keys = "XF86AudioRaiseVolume";
	      dispatcher = ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")'';
	      flags.locked = true;
	      flags.repeating = true;
	      flags.description = "Increase volume";
	    }
	    ## volume down
            {
	      keys = "XF86AudioLowerVolume";
	      dispatcher = ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'';
	      flags.locked = true;
	      flags.repeating = true;
	      flags.description = "Decrease volume";
	    }
	    ## toggle mute
	    {
	      keys = "XF86AudioMute";
	      dispatcher = ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'';
	      flags.locked = true;
	      flags.description = "Mute audio";
	    }
            ## brightness up
	    {
	      keys = "ALT + F3";
	      dispatcher = ''hl.dsp.exec_cmd("brightnessctl set +10%")'';
	      flags.locked = true;
	      flags.repeating = true;
	      flags.description = "Raise brightness";
	    }
	    ## brightness down
	    {
	      keys = "ALT + F2";
	      dispatcher = ''hl.dsp.exec_cmd("brightnessctl set -10%")'';
	      flags.locked = true;
	      flags.repeating = true;
	      flags.description = "Lower brightness";
	    }
            ## brightness up
	    {
	      keys = "XF86MonBrightnessUp";
	      dispatcher = ''hl.dsp.exec_cmd("brightnessctl set +10%")'';
	      flags.locked = true;
	      flags.repeating = true;
	      flags.description = "Raise brightness";
	    }
	    ## brightness down
	    {
	      keys = "XF86MonBrightnessDown";
	      dispatcher = ''hl.dsp.exec_cmd("brightnessctl set -10%")'';
	      flags.locked = true;
	      flags.repeating = true;
	      flags.description = "Lower brightness";
	    }

            # ----- SYSTEM CONTROLS ----- #
	    ## lock screen
	    {
	      keys = "SUPER + SHIFT + Escape";
	      dispatcher = ''hl.dsp.exec_cmd("hyprlock")'';
	      flags.description = "Lock screen";
	    }
            ## suspend
	    {
	      keys = "SUPER + CTRL + Escape";
	      dispatcher = ''hl.dsp.exec_cmd("systemctl suspend; hyprlock")'';
	      flags.description = "Suspend";
	    }
	    ## shutdown
	    {
	      keys = "SUPER + CTRL + SHIFT + Escape";
	      dispatcher = ''hl.dsp.exec_cmd("shudown now")'';
	      flags.description = "Shutdown";
	    }

            # ----- WINDOW RESIZE, MOVE, FOCUS ----- #
	    ## expand left
	    {
	      keys = "SUPER + SHIFT + left";
	      dispatcher = ''hl.dsp.window.resize({ x = -25, y = 0, relative = true })'';
	      flags.description = "Expand window left";
	    }
	    ## expand right
	    {
	      keys = "SUPER + SHIFT + right";
	      dispatcher = ''hl.dsp.window.resize({ x = 25, y = 0, relative = true })'';
	      flags.description = "Expand window right";
	    }
	    ## expand up
            {
	      keys = "SUPER + SHIFT + up";
	      dispatcher = ''hl.dsp.window.resize({ x = 0, y = -25, relative = true })'';
	      flags.description = "Expand window up";
	    }
	    ## expand down
	    {
	      keys = "SUPER + CTRL + down";
	      dispatcher = ''hl.dsp.window.resize({ x = 0, y = 25, relative = true })'';
	      flags.description = "Expand window down";
	    }

            ## move left
	    {
	      keys = "SUPER + CTRL + left";
	      dispatcher = ''hl.dsp.window.move({ direction = "l" })'';
	      flags.description = "Move window left";
	    }
	    ## move right
	    {
	      keys = "SUPER + CTRL + right";
	      dispatcher = ''hl.dsp.window.move({ direction = "r" })'';
	      flags.description = "Move window right";
	    }
	    ## move up
            {
	      keys = "SUPER + CTRL + up";
	      dispatcher = ''hl.dsp.window.move({ direction = "u" })'';
	      flags.description = "Move window up";
	    }
	    ## move down
	    {
	      keys = "SUPER + CTRL + down";
	      dispatcher = ''hl.dsp.window.move({ direction = "d" })'';
	      flags.description = "Move window down";
	    }

            # ----- WORKSPACE KEYBINDS ----- #
	    ## switch to workspace 1
	    {
	      keys = "SUPER + 1";
	      dispatcher = ''hl.dsp.focus({ workspace = 1 })'';
	      flags.description = "Move to workspace 1";
	    }
            ## switch to workspace 2
	    {
	      keys = "SUPER + 2";
	      dispatcher = ''hl.dsp.focus({ workspace = 2 })'';
	      flags.description = "Move to workspace 2";
	    }
            ## switch to workspace 3
	    {
	      keys = "SUPER + 3";
	      dispatcher = ''hl.dsp.focus({ workspace = 3 })'';
	      flags.description = "Move to workspace 3";
	    }
            ## switch to workspace 4
	    {
	      keys = "SUPER + 4";
	      dispatcher = ''hl.dsp.focus({ workspace = 4 })'';
	      flags.description = "Move to workspace 4";
	    }
            ## switch to workspace 5
	    {
	      keys = "SUPER + 5";
	      dispatcher = ''hl.dsp.focus({ workspace = 5 })'';
	      flags.description = "Move to workspace 5";
	    }
            ## switch to workspace 6
	    {
	      keys = "SUPER + 6";
	      dispatcher = ''hl.dsp.focus({ workspace = 6 })'';
	      flags.description = "Move to workspace 6";
	    }
            ## switch to workspace 7
	    {
	      keys = "SUPER + 7";
	      dispatcher = ''hl.dsp.focus({ workspace = 7 })'';
	      flags.description = "Move to workspace 7";
	    }
            ## switch to workspace 8
	    {
	      keys = "SUPER + 8";
	      dispatcher = ''hl.dsp.focus({ workspace = 8 })'';
	      flags.description = "Move to workspace 8";
	    }
            ## switch to workspace 9
	    {
	      keys = "SUPER + 9";
	      dispatcher = ''hl.dsp.focus({ workspace = 9 })'';
	      flags.description = "Move to workspace 9";
	    }
            ## switch to workspace 10
	    {
	      keys = "SUPER + 0";
	      dispatcher = ''hl.dsp.focus({ workspace = 10 })'';
	      flags.description = "Move to workspace 10";
	    }

            ## move window to workspace 1
	    {
	      keys = "SUPER + CTRL + 1";
	      dispatcher = ''hl.dsp.window.move({ workspace = 1 })'';
	      flags.description = "Move window to workspace 1";
	    }
            ## move window to workspace 2
	    {
	      keys = "SUPER + CTRL + 2";
	      dispatcher = ''hl.dsp.window.move({ workspace = 2 })'';
	      flags.description = "Move window to workspace 2";
	    }
            ## move window to workspace 3
	    {
	      keys = "SUPER + CTRL + 3";
	      dispatcher = ''hl.dsp.window.move({ workspace = 3 })'';
	      flags.description = "Move window to workspace 3";
	    }
            ## move window to workspace 4
	    {
	      keys = "SUPER + CTRL + 4";
	      dispatcher = ''hl.dsp.window.move({ workspace = 4 })'';
	      flags.description = "Move window to workspace 4";
	    }
            ## move window to workspace 5
	    {
	      keys = "SUPER + CTRL + 5";
	      dispatcher = ''hl.dsp.window.move({ workspace = 5 })'';
	      flags.description = "Move window to workspace 5";
	    }
            ## move window to workspace 6
	    {
	      keys = "SUPER + CTRL + 6";
	      dispatcher = ''hl.dsp.window.move({ workspace = 6 })'';
	      flags.description = "Move window to workspace 6";
	    }
            ## move window to workspace 7
	    {
	      keys = "SUPER + CTRL + 7";
	      dispatcher = ''hl.dsp.window.move({ workspace = 7 })'';
	      flags.description = "Move window to workspace 7";
	    }
            ## move window to workspace 8
	    {
	      keys = "SUPER + CTRL + 8";
	      dispatcher = ''hl.dsp.window.move({ workspace = 8 })'';
	      flags.description = "Move window to workspace 8";
	    }
            ## move window to workspace 9
	    {
	      keys = "SUPER + CTRL + 9";
	      dispatcher = ''hl.dsp.window.move({ workspace = 9 })'';
	      flags.description = "Move window to workspace 9";
	    }
            ## move window to workspace 10
	    {
	      keys = "SUPER + CTRL + 0";
	      dispatcher = ''hl.dsp.window.move({ workspace = 10 })'';
	      flags.description = "Move window to workspace 10";
	    }

            ## silent move window to workspace 1
	    {
	      keys = "SUPER + SHIFT + 1";
	      dispatcher = ''hl.dsp.window.move({ workspace = 1, follow = false })'';
	      flags.description = "Silent move window to workspace 1";
	    }
            ## silent move window to workspace 2
	    {
	      keys = "SUPER + SHIFT + 2";
	      dispatcher = ''hl.dsp.window.move({ workspace = 2, follow = false })'';
	      flags.description = "Silent move window to workspace 2";
	    }
            ## silent move to workspace 3
	    {
	      keys = "SUPER + SHIFT + 3";
	      dispatcher = ''hl.dsp.window.move({ workspace = 3, follow = false })'';
	      flags.description = "Silent move window to workspace 3";
	    }
            ## silent move window to workspace 4
	    {
	      keys = "SUPER + SHIFT + 4";
	      dispatcher = ''hl.dsp.window.move({ workspace = 4, follow = false })'';
	      flags.description = "Silent move window to workspace 4";
	    }
            ## silent move window to workspace 5
	    {
	      keys = "SUPER + SHIFT + 5";
	      dispatcher = ''hl.dsp.window.move({ workspace = 5, follow = false })'';
	      flags.description = "Silent move window to workspace 5";
	    }
            ## silent move window to workspace 6
	    {
	      keys = "SUPER + SHIFT + 6";
	      dispatcher = ''hl.dsp.window.move({ workspace = 6, follow = false })'';
	      flags.description = "Silent move window to workspace 6";
	    }
            ## silent move window to workspace 7
	    {
	      keys = "SUPER + SHIFT + 7";
	      dispatcher = ''hl.dsp.window.move({ workspace = 7, follow = false })'';
	      flags.description = "Silent move window to workspace 7";
	    }
            ## silent move window to workspace 8
	    {
	      keys = "SUPER + SHIFT + 8";
	      dispatcher = ''hl.dsp.window.move({ workspace = 8, follow = false })'';
	      flags.description = "Silent move window to workspace 8";
	    }
            ## silent move window to workspace 9
	    {
	      keys = "SUPER + SHIFT + 9";
	      dispatcher = ''hl.dsp.window.move({ workspace = 9, follow = false })'';
	      flags.description = "Silent move window to workspace 9";
	    }
            ## silent move window to workspace 10
	    {
	      keys = "SUPER + SHIFT + 0";
	      dispatcher = ''hl.dsp.window.move({ workspace = 10, follow = false })'';
	      flags.description = "Silent move window to workspace 10";
	    }

            ## previous workspace
	    {
	      keys = "SUPER + TAB";
	      dispatcher = ''hl.dsp.focus({ workspace = "prev" })'';
	      flags.description = "Move to previously accessed workspace";
	    }

            # ----- MOUSE CONTROLS ----- #
            ## next workspace
	    {
	      keys = "SUPER + mouse_down";
	      dispatcher = ''hl.dsp.focus({ workspace = "e+1" })'';
	      flags.description = "Move to next workspace";
	    }
	    ## previous workspace
	    {
	      keys = "SUPER + mouse_up";
	      dispatcher = ''hl.dsp.focus({ workspace = "e-1" })'';
	      flags.description = "Move to previous workspace";
	    }
	    ## drag window
	    {
	      keys = "SUPER + mouse:272";
	      dispatcher = ''hl.dsp.window.drag()'';
	      flags.mouse = true;
	      flags.description = "Drag window";
	    }
	    ## resize window
	    {
	      keys = "SUPER + mouse:273";
	      dispatcher = ''hl.dsp.window.resize()'';
	      flags.mouse = true;
	      flags.description = "Resize window";
	    }
	  ];

      # ----- LAYER RULES ----- #
      layer_rule = [
        (lib.generators.mkLuaInline ''{ match = { namespace = "waybar" }, blur = true }'')
        (lib.generators.mkLuaInline ''{ match = { namespace = "wofi" }, blur = true }'')
        (lib.generators.mkLuaInline ''{ match = { namespace = "mako" }, blur = true }'')

        (lib.generators.mkLuaInline ''{ match = { namespace = "waybar" }, blur_popups = true }'')
        (lib.generators.mkLuaInline ''{ match = { namespace = "wofi" }, blur_popups = true }'')
        (lib.generators.mkLuaInline ''{ match = { namespace = "mako" }, blur_popups = true }'')

        (lib.generators.mkLuaInline ''{ match = { namespace = "waybar" }, ignore_alpha = 0.1 }'')
        (lib.generators.mkLuaInline ''{ match = { namespace = "wofi" }, ignore_alpha = 0.1 }'')
        (lib.generators.mkLuaInline ''{ match = { namespace = "mako" }, ignore_alpha = 0.1 }'')

        (lib.generators.mkLuaInline ''{ match = { namespace = "wofi" }, animation = "fade" }'')
        (lib.generators.mkLuaInline ''{ match = { namespace = "awww" }, animation = "fade" }'')
      ];

      # ----- CURVE ----- #
      curve = [
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
      animation = [
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
    };
  };
}
