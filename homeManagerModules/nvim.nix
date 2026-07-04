# nvim.nix

{ ... }: {

  # - NEOVIM ------------------ #
  programs.neovim = {
    enable = true;
  };

  # - NVF --------------------- #
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        lsp.enable = true;

        languages = {
          enableTreesitter = true;

          nix.enable = true;
        };
      };
    };
  };
}

