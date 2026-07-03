# spotify-player.nix

{ config, lib, pkgs, ... }: {

  # - CONFIG ------------------ #
  programs.spotify-player = {
    enable = true;

    settings = {
      playback_format = "{track} • {artists} - {album}";
    };
  };
}

