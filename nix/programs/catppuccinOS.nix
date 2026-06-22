# catppuccinOS.nix

{
  lib,
  catppuccin,
  ...
}:
{
  catppuccin = {
    autoEnable = false;
    enable = true;
    enableReleaseCheck = true;
    cache.enable = true;
    flavor = "mocha";

    cursors = {
      enable = true;
      accent = "sapphire";
    };

    gtk.icon = {
      enable = true;
      accent = "sapphire";
    };

    tty = {
      enable = true;
    };
  };
}
