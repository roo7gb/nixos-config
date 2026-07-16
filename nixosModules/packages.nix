# packages.nix

{ pkgs, ... }: {

  # import global packages
  environment.systemPackages = with pkgs; [
    # vim        # text editor if nvim is borked
    wget       # downloader
    cliphist   # clipboard
    gnumake    # make command
    lm_sensors # temp sensors
    conf-fastfetch
    conf-hyprlock
    conf-wezterm
    # git
  ];
}

