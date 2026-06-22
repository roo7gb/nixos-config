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
    hyprland.enable = true;
    mako.enable = true;
    nushell.enable = true;
    nvim.enable = true;
    rofi.enable = true;
    starship.enable = true;
    waybar.enable = true;
    wezterm.enable = true;
    wlogout.enable = true;
    yazi.enable = true;
  };
}
