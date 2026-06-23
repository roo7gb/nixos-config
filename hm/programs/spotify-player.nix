# spotify-player.nix

{
  pkgs,
  catppuccin,
  ...
}:
{
  catppuccin.spotify-player.enable = true;

  programs.spotify-player = {
    enable = true;

    settings = {
      playback_format = "{track} • {artists} - {album}";
    };
  };
}

