# home.nix

{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "roo7gb";
  home.homeDirectory = "/home/roo7gb";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
      fastfetch
      git
      gh
      gimp
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      vesktop
    ];

  imports = [
    ./programs/nushell.nix
    ./programs/fastfetch.nix
  ];
}
