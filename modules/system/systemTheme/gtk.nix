# .nixflake/modules/system/systemTheme/gtk.nix

{ self, inputs, ... }: {

  flake.nixosModules.gtkTheme = { pkgs, lib, ... }: {
    programs = {
      xconf.enable = true;
      dconf = {
        enable = true;
        profiles.user.databases = [
          {
            lockAll = false;
            settings = {
              "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
              };
            };
          }
        ];
      };
    };
  };
}

