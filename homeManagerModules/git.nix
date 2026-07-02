# git.nix

{ config, lib, pkgs, ... }: {

  # - TOGGLE ------------------ #
  options = {
    git.enable =
      lib.mkEnableOption "enables git";
  };

  # - CONFIG ------------------ #
  programs.git = lib.mkIf config.git.enable {
    enable = true;

    settings = {
      user.name = "roo7gb";
      user.email = "miasma1007@gmail.com";
      init.defaultBranch = "main";
      credential.helper = "oauth";
    };
  };
}

