# vesktop.nix

{ config, lib, ... }: {

  # - TOGGLE ------------------ #
  options = {
    vesktop.enable =
      lib.mkEnableOption "enables vesktop";
  };

  # - CONFIG ------------------ #
  programs.vesktop = lib.mkIf config.vesktop.enable {
    enable = true;
  };
}

