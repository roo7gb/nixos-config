# catppuccinHM.nix

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

    btop.enable = true;
    cava = {
      enable = true;
      transparent = true;
    };
    gtk.icon.enable = true;
    yazi.enable = true;
  };
}

