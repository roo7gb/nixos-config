# nvim.nix

{ config, lib, pkgs, ... }: {

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
          tabstop = 4;
          shiftwidth = 4;
	};

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
	};
      };
    };
  };
}

