# .nixflake/modules/hosts/TARDIS/default.nix

{ self, inputs, ... }: {

  flake.nixosConfigurations.FIREFLY = inputs.nixpkgs.lib.nixosSystem {

    modules = with self.nixosModules; [
      desktop
      fireflyConfiguration
      intelIntDrivers
      nix-ld
      development
      office
      gaming
      images
      fastfetch
      mpv
    ];
  };
}

