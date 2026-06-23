# nvim.nix

{
  lib,
  catppuccin,
  ...
}
{
  catppuccin.nvim.enable = true;

  programs.nvim = {
    enable = true;
  };
}

