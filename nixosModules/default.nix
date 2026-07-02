# default.nix

{ config, ... }:

{
  import = [
    ./steam.nix
    ./stylix.nix
  ];

  stylixMain.enable = true;
}

