# nvim.nix

{ ... }: {

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
          markdown.enable = true;

          # enable based on needs

          # assembly.enable = true;
          # bash.enable = true;
          # cmake.enable = true;
          # csharp.enable = true;
          # css.enable = true;
          # docker.enable = true;
          # go.enable = true;
          # haskell.enable = true;
          # html.enable = true;
          # java.enable = true;
          # json.enable = true;
          # lua.enable = true;
          # make.enable = true;
          # python.enable = true;
          qml.enable = true;
          # rust.enable = true;
          # sql.enable = true;
          # toml.enable = true;
          # typescript.enable = true;
          # xml.enable = true;
          # yaml.enable = true;
          # zig.enable = true;
        };
      };
    };
  };
}

