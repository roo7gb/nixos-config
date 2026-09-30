# .nixflake/modules/hosts/TARDIS/default.nix

{ self, inputs, ... }: {

  flake.nixosConfigurations.TARDIS = inputs.nixpkgs.lib.nixosSystem {

    modules = with self.nixosModules; [
      desktop
      tardisConfiguration
      nvidiaDrivers
      nix-ld
      development
      office
      gaming
      termstuff
      images
      fastfetch
      mpv
    ];
  };
}

