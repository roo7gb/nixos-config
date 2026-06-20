# home.nix

{
  lib,
  pkgs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "roo7gb";
    homeDirectory = "/home/roo7gb";

    stateVersion = "26.05";
  };
}


