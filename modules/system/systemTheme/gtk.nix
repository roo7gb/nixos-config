# .nixflake/modules/system/systemTheme/gtk.nix

{ self, inputs, ... }: {

  flake.nixosModules.gtkTheme = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      (colloid-gtk-theme.override {
        themeVariants = [ "grey" ];
        colorVariants = [ "dark" ];
        sizeVariants = [ "compact" ];
        tweaks = [ "rimless" "black" ];
      })
      (colloid-icon-theme.override {
        colorVariants = [ "purple" ];
      })
    ];
    programs = {
      dconf = {
        enable = true;
        profiles.user.databases = [{
          lockAll = false;
          settings = {
            "org/gnome/desktop/interface" = {
              gtk-theme = "Colloid-Grey-Dark-Compact";
              icon-theme = "Colloid-Purple-Dark";
              color-scheme = "prefer-dark";
            };
          };
        }];
      };
    };
  };
}

