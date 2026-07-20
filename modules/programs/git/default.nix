# .nixflake/modules/programs/git/default.nix

{ self, inputs, ... }: {

  flake.nixosModules.git = { pkgs, lib, ... }: {

    programs.git = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.git;
    };
  };
  perSystem = { pkgs, lib, self', ... }: {

    packages.git = inputs.wrappers.wrappers.git.wrap {
      inherit pkgs;
      runtimePkgs = with pkgs; [
        git-credential-oauth
      ];
      settings = {
        user = {
          name = "roo7gb";
          email = "miasma1007@gmail.com";
        };
        credential.helper = "oauth";
      };
    };
  };
}

