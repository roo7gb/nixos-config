# home.nix

{
  lib,
  pkgs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      fastfetch
      git
      neovim
    ];

    username = "roo7gb";
    homeDirectory = "/home/roo7gb";

    stateVersion = "26.05";
  };
}


