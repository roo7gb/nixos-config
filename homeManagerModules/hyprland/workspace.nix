# workspace.nix

{ lib, ... }: {

  # - WORKSPACE RULE ---------- #
  wayland.windowManager.hyprland.settings.workspace_rule = [
    (lib.generators.mkLuaInline ''{ workspace = "special:special", on_created_empty = "wezterm", }'')
  ];
}

