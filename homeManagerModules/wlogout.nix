# wlogout.nix

{ config, lib, pkgs, ... }: {

  # - TOGGLE ------------------ #
  options = {
    wlogout.enable =
      lib.mkEnableOption "enables wlogout";
  };

  # - CONFIG ------------------ #
  programs.wlogout = lib.mkIf config.wlogout.enable {
    enable = true;

    layout = [
      {
        label = "lock";
	action = "hyprlock";
	text = "Lock";
	keybind = "l";
      }
      {
        label = "logout";
	action = "hyprctl dispatch exit";
	text = "Logout";
	keybind = "e";
      }
      {
        label = "shutdown";
	action = "systemctl poweroff";
	text = "Shutdown";
	keybind = "s";
      }
      {
        label = "reboot";
	action = "systemctl reboot";
	text = "Reboot";
	keybind = "r";
      }
      {
        label = "suspend";
	action = "systemctl suspend";
	text = "Suspend";
	keybind = "u";
      }
    ];
  };
}
