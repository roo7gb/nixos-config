# .nixflake/modules/system/audio/default.nix

{ self, inputs, ... }: {

  flake.nixosModules.audio = { pkgs, lib, ... }: {

    environment.systemPackages = with pkgs; [
      playerctl
      pavucontrol
    ];
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      also.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}

