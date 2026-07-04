# spotify-player.nix

{ ... }: {

  # - CONFIG ------------------ #
  programs.spotify-player = {
    enable = true;

    settings = {
      playback_format = "{track} • {artists} - {album}";
    };
  };
}

