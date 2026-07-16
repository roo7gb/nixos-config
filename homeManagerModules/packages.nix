# packages.nix

{ pkgs, inputs, ... }: {

  # install non-configured packages
  home.packages = with pkgs; [
    awww                 # wallpaper daemon
    brightnessctl        # monitor brightness control
    gimp                 # image editing
    git-credential-oauth # git credential helper
    hyprpolkitagent      # polkit agent
    imagemagick          # cli image processing
    nerd-fonts.mononoki  # friendship ended with agave this is my new favorite nerd font
    obsidian             # note text editor
    pavucontrol          # audio control interface
    playerctl            # audio player control
    protonvpn-gui
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default # browser
  ];
}

