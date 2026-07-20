# .nixflake/modules/system/core/nix-settings.nix

{ inputs, ... }: {

  perSystem = { system, ... }: {
  
    _module.args.unfreePkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  };
  flake.nixosModules.nix = { ... }: {
  
    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };
  };
}

