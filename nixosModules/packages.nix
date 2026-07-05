# packages.nix

{ pkgs, ... }: {

  # import global packages
  environment.systemPackages = with pkgs; [
    vim      # text editor if nvim is borked
    wget     # downloader
    cliphist # clipboard
    gnumake  # make command
    # git
  ];
}

