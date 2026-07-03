# default.nix

{ config, ... }: {

  imports = [
    ./steam.nix
    ./stylix.nix
  ];
}

