# vesktop.nix

{ ... }: {

  # - CONFIG ------------------ #
  programs.vesktop = {
    enable = true;

    settings = {
      discordBranch = "stable";
      minimizeToTray = false;
    };

    vencord.settings = {
      notifyAboutUpdates = false;
      autoUpdate = false;
      plugins = {
        VolumeBooster.enabled = true;
        FakeNitro.enabled = true;
      };
    };
  };
}

