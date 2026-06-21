# fastfetch.nix

{
  pkgs,
  ...
}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
      };
    };
    display = {
      separator = " : ";
    };
    modules = [
      "title"
      "separator"
      "os"
      "kernel"
      "uptime"
      "shell"
      "desktop"
      "terminal"
      "cpu"
      "gpu"
      "memory"
      "swap"
      "disk"
    ];
  };
}
