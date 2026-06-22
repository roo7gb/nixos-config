# rofi.nix

{
  pkgs,
  config,
  ...
}:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
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
        background-color = mkLiteral "#11111b";
	text-color = mkLiteral "#cdd6f4";
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
	background-color = mkLiteral "#313244";
	children = map mkLiteral [ "prompt" "entry" ];
      };

      "prompt" = {
        margin = mkLiteral "0px 8px 0px 0px";
	text-color = mkLiteral "#74c7ec";
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

      "element normal.normal" = {
        background-color = mkLiteral "transparent";
      };

      "element selected.normal" = {
        background-color = mkLiteral "#74c7ec";
	text-color = mkLiteral "#11111b";
      };

      "element-icon" = {
        size = mkLiteral "24px";
      };
    };
  };
}

