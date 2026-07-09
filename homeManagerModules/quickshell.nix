# quickshell.nix

{ ... }: {

  programs.quickshell = {
    enable = true;
  };

  xdg.configFile."quickshell" = {
    source = ../etc/quickshell;
    recursive = true;
  };
}

