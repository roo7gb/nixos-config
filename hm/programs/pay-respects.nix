# pay-respects.nix

{
  lib,
  ...
}:
{
  programs.pay-respects = {
    enable = true;
    enableNushellIntegration = true;
    options = [
      "--alias"
      "fuck"
    ];
  };
}

