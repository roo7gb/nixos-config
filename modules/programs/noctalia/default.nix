# .nixflake/modules/programs/noctalia/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.noctalia = moduleWithSystem (
    { self', pkgs, ... }: {
      environment.systemPackages = [
        self'.packages.noctalia-shell
      ];
    }
  );

  perSystem = { inputs', pkgs, ... }: {
    packages.noctalia-shell = inputs.wrappers.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      settings = {
        theme = {
          mode = "dark";
          source = "custom";
          custom_palette = "colors";
        };
      };
      colors = {
        mPrimary = "#d6b471";
        mOnPrimary = "#161616";
        mSecondary = "#6965a6";
        mOnSecondary = "#dadada";
        mTertiary = "#3395b2";
        mOnTertiary = "#161616";
        mError = "#d6717b";
        mOnError = "#dadada";
        mSurface = "#161616";
        mOnSurface = "#dadada";
        mSurfaceVariant = "#161616";
        mOnSurfaceVariant = "#dadada";
        mOutline = "#161616";
        mShadow = "#151515";
        mHover = "#161616";
        mOnHover = "#dadada";
      };
    };
  };
}

