# default.nix

{ ... }: {

  imports = [
    ./git.nix            # git config
    ./hyprlock.nix       # lockscreen config
    ./nushell.nix        # shell config
    ./fastfetch.nix      # sysinfo fetcher config
    #./mako.nix           # notification daemon config
    ./nvim.nix           # neovim config
    ./quickshell.nix     # quickshell config (config files in ./quickshell/)
    #./rofi.nix           # app launcher config
    ./spotify-player.nix # spotify config
    ./stylix.nix         # stylix config for apps
    ./vesktop.nix        # discord config
    #./waybar.nix         # bar config
    ./wezterm.nix        # terminal config
    #./wlogout.nix        # logout interface config
    ./hyprland           # hyprland config (directory)
    ./packages.nix       # non-configured packages
  ];
}

