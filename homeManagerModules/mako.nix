# mako.nix

{ ... }: {

  # - CONFIG ------------------ #
  services.mako = {
    enable = true;
    settings = {
      global = {
        anchor = "top-right";
        font = "Agave Nerd Font 12";
        margin = "10";
        padding = "10";
        width = 200;
        height = 75;
        border-size = 2;
        border-radius = 5;
        default-timeout = 5000;
      };
    };
  };
}

