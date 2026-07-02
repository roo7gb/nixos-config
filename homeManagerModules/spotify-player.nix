# spotify-player.nix

{ config, lib, pkgs, ... }: {

  # - TOGGLE ------------------ #
  options = {
    spotify.enable =
      lib.mkEnableOption "enables spotify";
  };

  # - CONFIG ------------------ #
  programs.spotify-player = lib.mkIf config.spotify.enable {
    enable = true;

    settings = {
      playback_format = "{track} • {artists} - {album}";
    };
  };
}

