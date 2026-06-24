# waybar.nix

{
  config,
  pkgs,
  catppuccin,
  ...
}:
{
  catppuccin.waybar.enable = true;

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passtrough = false;
        gtk-layer-shell = true;
        height = 0;

        "modules-left" = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        "modules-center" = [
          "clock"
        ];

        "modules-right" = [
          "mpris"
          "pulseaudio"
          "tray"
          "network"
          "cpu"
          "memory"
          "custom/notification"
          "custom/exit"
        ];

        clock = {
          interval = 30;
          format = " {:L%H:%M}";
          on-click = "gsimplecal";
          tooltip = true;
          tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        };

        tray = {
          # icon-size = 18;
          spacing = 5;
          show-passive-items = false;
        };

        network = {
          format-wifi = "{signalStrength}%  ";
          format-ethernet = "󰈀 {ipaddr}";
          format-disconnected = "󰌙";
          on-click = "wezterm start -- nmtui";
          on-click-right = "nmcli device wifi rescan";
          on-click-middle = "nmcli networking off && nmcli networking on";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-icons = ["" "" ""];
          on-click = "pavucontrol";
        };

        memory = {
          interval = 30;
          format = "{}%  ";
          format-alt = "{used:0.1f}G ";
          max-length = 10;
        };

        cpu = {
          format = "{}%  ";
          format-alt = "{usage}% ";
          tooltip = false;
        };

        "custom/exit" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && wlogout";
        };

        "hyprland/workspaces" = {
          format = "{id}"; # or "{id}" or "{name} {icon}" etc
          sort-by-number = true;
          all-outputs = true;
          on-click = "activate";
          disable-scroll = false;
        };

        "hyprland/window" = {
          format = "{title}";
          icon = false;
          expand = true;
          max-length = 20;
          separate-outputs = true;
        };

        "mpris" = {
          format = "{player_icon} {dynamic}";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          dynamic-len = 40; # Truncates text to prevent bar stretching
          player-icons = {
            default = "▶";
            spotify = "";
            mpv = "🎵";
          };
          status-icons = {
            paused = "⏸";
          };
          ignored-players = [ "zen" ];
        };
      };
    };
    style = ''
    * {
        font-family: "Agave Nerd Font", monospace;
	font-weight: 500;
	font-size: 14px;
	color: #cdd6f4;
    }

    #waybar {
        background: rgb(30, 30, 46);
	box-shadow: none;
	border: none;
	padding: 6px 12px;
    }

    #waybar .module {
      padding: 0 10px;
      margin: 0 5px;
      border-radius: 6px;
      transition: background-color 0.3s ease;
    }

    #waybar .module:hover {
        background-color: rgba(108, 112, 134, 0.1);
    }

    #waybar .clock {
      font-weight: 600;
      font-size: 13px;
    }

    #waybar .cpu
    #waybar .network {
      font-weight: 600;
    }

    #waybar .separator {
      margin: 0 8px;
      color: #45475a;
    }

    #mpris {
      color: #cdd6f4;
      padding: 0 10px;
      margin: 0 4px;
      background-color: rgb(30, 30, 46);
      border-radius: 8px;
    }

    .tooltip {
      background-color: rgba(108, 112, 134, 0.7);
      color: #74c7ec;
      border-radius: 4px;
      padding: 3px 6px;
      font-size: 11px;
    }
    '';
  };
}
