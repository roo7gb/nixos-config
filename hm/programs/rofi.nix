# rofi.nix

{
  pkgs,
  config,
  ...
}:
{
  programs.rofi = {
    enable = true;

    extraConfig = {
      modi = "drun,run,window";
      sidebar-mode = true;
      show-icons = true;
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        background-color = mkLiteral "#11111b";
	text-color = mkLiteral "#cdd6f4";
      };
      "window" = {
        width = mkLiteral "600px";
      };
      "mode-switcher" = {
        orientation = mkLiteral "horizontal";
	expand = false;
	spacing = mkLiteral "10px";
	background-color = mkLiteral "transparent";
      };
      "button" = {
        padding = mkLiteral "10px";
	border-radius = mkLiteral "5px";
	background-color = mkLiteral "#1e1e2e";
	text-color = mkLiteral "#cdd6f4";
      };
      "button-selected" = {
        background-color = mkLiteral "#74c7ec";
	text-color = mkLiteral "#11111b";
      };
    };
  };
}

