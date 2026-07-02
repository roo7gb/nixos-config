# steam.nix

{ config, lib, pkgs, ... }: {

  options = {
    steam.enable =
      lib.mkEnableOption "enables steam";
  };

  programs.steam = lib.mkIf config.steam.enable {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}

