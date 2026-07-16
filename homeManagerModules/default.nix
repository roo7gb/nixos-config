# default.nix

{ ... }: {

  imports = [
    ./btop.nix           # btop config
    ./cava.nix           # cava config
    # ./fastfetch.nix      # sysinfo fetcher config
    ./git.nix            # git config
    # ./hyprlock.nix       # lockscreen config
    ./hyprshot.nix       # screenshot util config
    ./nushell.nix        # shell config
    ./nvim.nix           # neovim config
    ./prismlauncher.nix  # minecraft
    ./quickshell.nix     # quickshell config (config files in ./quickshell/)
    ./spotify-player.nix # spotify config
    ./stylix.nix         # stylix config for apps
    ./thunderbird.nix    # email client config
    ./vesktop.nix        # discord config
    # ./wezterm.nix        # terminal config
    ./yazi.nix           # file explorer config
    ./hyprland           # hyprland config (directory)
    ./packages.nix       # non-configured packages
  ];
}

