# hyprlock.nix

{
  pkgs,
  ...,
}:
{
  programs.hyprlock = {
    enable = true;

    input-field = [
      {
        monitor = "";
	size = "200, 50";
	outline_thickness = 3;
	dots_size = 0.33;
	dots_spacing = 0.15;
	dots_center = true;
	dots_rounding = -1;
	outer_color = "rgb(151515)";
        inner_color = "rgb(1, 1, 1)";
	font_color = "rgb(200, 200, 200)";
	fade_on_empty = true;
	fade_timeout = 1000;
	placeholder_text = "<i>Input Password...</i>";
	hide_input = false;
	rounding = -1;
	check_color = "rgb(204, 136, 34)";
	fail_color = "rgb(204, 34, 34)";
	fail_transition = 300;
	capslock_color = -1;
	numlock_color = -1;
	bothlock_color = -1;
	invert_numlock = false;
	swap_font_color = false;
	position = "0, -20";
	halign = "center";
	valign = "center";
      }
    ];
  };
}
