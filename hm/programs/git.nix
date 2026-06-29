# git.nix

{
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;

    settings = {
      user.name = "roo7gb";
      user.email = "miasma1007@gmail.com";
      init.defaultBranch = "main";
      credential.helper = "oauth";
    };
  };
}

