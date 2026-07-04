# default.nix

{ ... }: {

  imports = [
    ./steam.nix    # steam config
    ./stylix.nix   # global stylix config
    ./packages.nix # global packages to be installed
  ];
}

