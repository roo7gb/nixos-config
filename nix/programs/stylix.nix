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
      base00 = "161616";
      base01 = "282828";
      base02 = "484848";
      base03 = "dfdfe0";
      base04 = "9c9484";
      base05 = "d6b471";
      base06 = "f0c674";
      base07 = "969696";
      base08 = "78a9ff";
      base09 = "33b1ff";
      base0A = "c8a5ff";
      base0B = "25be6a";
      base0C = "f16da6";
      base0D = "eac67e";
      base0E = "ee6396";
      base0F = "52bdff";
    };
    polarity = "dark";

    targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };
}

