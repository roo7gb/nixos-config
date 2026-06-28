# stylix.nix

{
  lib,
  config,
  ...
}:
{
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = {
      base00 = "282828";
      base01 = "ee5396";
      base02 = "25be6a";
      base03 = "be95ff";
      base04 = "78a9ff";
      base05 = "d6b471";
      base06 = "33b1ff";
      base07 = "dfdfe0";
      base08 = "484848";
      base09 = "f16da6";
      base0A = "46c880";
      base0B = "c8a5ff";
      base0C = "8cb6ff";
      base0D = "eac67e";
      base0E = "52bdff";
      base0F = "e4e4e5";
    };
    polarity = "dark";

    targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };
}

