# windowrules.nix

{ lib, ... }: {

  # - WINDOW RULES ------------ #
  wayland.windowManager.hyprland.settings.window_rule = [
    (lib.generators.mkLuaInline ''{ match = { class = "^(hyprpolkitagent)$" }, float = true }'')
    (lib.generators.mkLuaInline ''{ match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol)$" }, float = true }'')
    (lib.generators.mkLuaInline ''{ match = { class = "^(nwg-look|qt5ct|mpv|zoom|Rofi|feh)$" }, float = true }'')
    (lib.generators.mkLuaInline ''{ match = { class = "^(Rofi|pavucontrol|blueman-manager)$" }, pin = true }'')
  ];
}

