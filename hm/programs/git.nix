# git.nix

{
  ...
}:
{
  programs.git {
    enable = true;
    userName = "roo7gb";
    userEmail = "miasma1007@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

