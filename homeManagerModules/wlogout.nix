# wlogout.nix

{ config, lib, pkgs, ... }: {

  # - CONFIG ------------------ #
  programs.wlogout = {
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
	ction = "hyprctl dispatch exit";
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
