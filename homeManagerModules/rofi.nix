# rofi.nix

{ config, lib, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  # - CONFIG ------------------ #
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = true;
    };

    theme = {
      "*" = {
        font = "Agave Nerd Font 10";
      };

      "window" = {
        anchor = mkLiteral "west";
	location = mkLiteral "west";
	height = mkLiteral "100%";
	width = mkLiteral "300px";
	x-offset = mkLiteral "0px";
	y-offset = mkLiteral "0px";
	children = map mkLiteral [ "mainbox" ];
      };

      "mainbox" = {
        orientation = mkLiteral "vertical";
        children = map mkLiteral [ "inputbar" "listview" ];
      };

      "inputbar" = {
        padding = mkLiteral "12px";
	children = map mkLiteral [ "prompt" "entry" ];
      };

      "prompt" = {
        margin = mkLiteral "0px 8px 0px 0px";
        background-color = mkLiteral "#313244";
      };

      "entry" = {
        placeholder = "Search...";
        placeholder-color = mkLiteral "#313244";
      };

      "listview" = {
        columns = 1;
	lines = 12;
	spacing = mkLiteral "4px";
	cycle = false;
	dynamic = true;
	layout = mkLiteral "vertical";
      };

      "element" = {
        padding = mkLiteral "8px 12px";
	spacing = mkLiteral "8px";
	border-radius = mkLiteral "4px";
      };

      "element-text" = {
	vertical-align = mkLiteral "0.5";
      };

      "element-icon" = {
        size = mkLiteral "24px";
      };
    };
  };
}

