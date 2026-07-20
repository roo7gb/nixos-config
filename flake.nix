# .nixflake/flake.nix

{
  description = "Flake for full roo7gb nixos configuration";

  inputs = {
    # use unstable pkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # hyprland setup
    hyprland.url = "github:roo7gb/hypr";

    # neovim setup
    nvim.url = "github:roo7gb/nvim";

    # web browser of choice
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # flake parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}

