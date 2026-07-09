# startup.nix

{ lib, ... }: {

  # - STARTUP ----------------- #
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("quickshell")
          hl.exec_cmd("hyprctl setcursor phinger-cursors-dark 24")
          hl.exec_cmd("systemctl --user start hyprpolkitagent")
          hl.exec_cmd("awww-daemon")
          hl.exec_cmd("hyprlock")
        end'')
    ];
  };
}

