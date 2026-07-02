# mako.nix

{ config, lib, pkgs, ... }: {

  # - TOGGLE ------------------ #
  options = {
    mako.enable =
      lib.mkEnableOption "enables mako";
  };

  # - CONFIG ------------------ #
  services.mako = lib.mkIf config.mako.enable {
    enable = true;
    settings = {
      global = {
        anchor = "top-right";
	font = "Agave Nerd Font 12";
	margin = "10";
	padding = "10";
	width = 200;
	height = 75;
	border-size = 2;
	border-radius = 5;
	default-timeout = 5000;
      };
    };
  };
}

