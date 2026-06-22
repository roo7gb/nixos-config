# input.nix

{
  ...
}:
{
  # ----- INPUT ----- #
  wayland.windowManager.hyprland.settings.config.input = {
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
}

