# home.nix

{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      fastfetch
      git
      neovim
      gh
      inputs.zen-browser.packsges.${pkgs.stdenv.hostPlatform.system}.default
    ];

    username = "roo7gb";
    homeDirectory = "/home/roo7gb";

    stateVersion = "26.05";
  };
}


