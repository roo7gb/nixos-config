# .nixflake/flake.nix

{
  description = "Flake for full roo7gb nixos configuration";

  inputs = {
    # use unstable pkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # neovim setup
    nvim = {
      url = "github:roo7gb/nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # flake parts
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    import-tree = {
      url = "github:denful/import-tree";
    };
    wrappers = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}

