# packages.nix

{ pkgs, inputs, ... }: {

  # install non-configured packages
  home.packages = with pkgs; [
    awww                 # wallpaper daemon
    btop                 # system resource monitor
    brightnessctl        # monitor brightness control
    cava                 # tui audio visualizer
    gimp                 # image editing
    git-credential-oauth # git authentication handler
    hyprpolkitagent      # polkit agent
    hyprshot             # screenshot utility
    imagemagick          # cli image processing
    nerd-fonts.agave     # my favorite nerd font
    pavucontrol          # audio control interface
    playerctl            # audio player control
    prismlauncher        # minecraft launcher
    yazi                 # file explorer
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default # browser
  ];
}

