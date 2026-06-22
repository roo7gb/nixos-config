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
    accent = "sapphire";

    gtk.icon.enable = true;

    tty.enable = true;
  };
}
