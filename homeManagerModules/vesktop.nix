# vesktop.nix

{ ... }: {

  # - CONFIG ------------------ #
  programs.vesktop = {
    enable = true;

    settings = {
      discordBranch = "stable";
      minimizeToTray = false;
      splash = true;
    };

    vencord.settings = {
      notifyAboutUpdates = false;
      autoUpdate = false;
      plugins = {
        volumeBooster.enabled = true;
      };
    };
  };
}

