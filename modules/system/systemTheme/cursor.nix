# .nixflake/modules/system/systemTheme/cursor.nix

{ self, inputs, ... }: {

  flake.nixosModules.phCursors = { pkgs, lib, ... }: {
    fonts.packages = with pkgs.nerd-fonts; [
      mononoki
    ];

    environment.systemPackages = with pkgs; [
      phinger-cursors
    ];

    environment.variables = {
      XCURSOR_THEME = "phinger-cursors-dark";
      XCURSOR_SIZE = "24";
    };

    programs.dconf.profiles.user.databases = [
      {
        lockAll = false;
        settings = {
          "org/gnome/desktop/interface" = {
            cursor-theme = "phinger-cursors-dark";
            font-name = "Mononoki Nerd Font 11";
          };
        };
      }
    ];
  };
}

