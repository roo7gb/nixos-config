# env.nix

{ ... }: {

  # - ENVIRONMENT ------------- #
  wayland.windowManager.hyprland.settings.env = [
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
}

