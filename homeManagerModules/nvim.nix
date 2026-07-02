# nvim.nix

{ config, lib, pkgs, inputs, ... }: {

  # - TOGGLE ------------------ #
  options = {
    nvim.enable =
      lib.mkEnableOption "enables nvim";
  };

  # - NEOVIM ------------------ #
  programs.neovim = lib.mkIf config.nvim.enable {
    enable = true;
  };

  # - NVF --------------------- #
  vim = lib.mkIf config.nvim.enable {
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
    };
  };
}

