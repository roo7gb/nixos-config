# .nixflake/modules/programs/niri/default.nix

{ moduleWithSystem, self, inputs, ... }: {
  flake.nixosModules.niri = moduleWithSystem (
    { self', pkgs, inputs', ... }: { config, ... }: let
      modules = with self.nixosModules; [
        audio
        systemTheme
        fuzzel
        hyprlock
        mako
        swayidle
        waybar
        wezterm
      ];
    in {
      imports = modules;
      programs = {
        niri = {
          enable = true;
          package = self'.packages.niri;
        };
        thunar.enable = true;
      };
      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;
      xdg.portal.config.niri = {
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
      environment.systemPackages = with pkgs; [
        awww
        btop
        brightnessctl
        spotify-player
        xwayland-satellite
        inputs'.zen-browser.packages.default
      ];
    }
  );
  perSystem = { pkgs, ... }: {
    packages.niri = inputs.wrappers.wrappers.niri.wrap {
      inherit pkgs;
      "config.kdl".path = ./config.kdl;
    };
  };
}

