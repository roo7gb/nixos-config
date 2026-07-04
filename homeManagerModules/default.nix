# default.nix

{ ... }: {

  imports = [
    ./git.nix
    ./hyprlock.nix
    ./nushell.nix
    ./fastfetch.nix
    ./mako.nix
    ./nvim.nix
    ./rofi.nix
    ./spotify-player.nix
    ./stylix.nix
    ./vesktop.nix
    ./waybar.nix
    ./wezterm.nix
    ./wlogout.nix
    ./hyprland
  ];
}

