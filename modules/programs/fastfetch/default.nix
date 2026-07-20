# .nixflake/modules/programs/fastfetch/default.nix

{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.fastfetch = moduleWithSystem (
    { self' }: {
      environment.systemPackages = with self'.packages; [
        fastfetch
      ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.fastfetch = inputs.wrappers.wrappers.fastfetch.wrap {
      settings = {
        # pad logo by 1 px
        logo = {
          padding = {
            right = 1;
          };
        };

        # define separator
        display = {
          separator = " ";
        };

        # display
        modules = [
          # header
          {
            type = "title";
            format = "{#1}╭───────────── {#}{user-name-colored}";
          }

          # sysinfo
          {
            type = "custom";
            format = "{#1}│ {#}System Information";
          }
          {
            type = "os";
            key = "{#separator}│  {#keys}󰍹 OS";
            format = "{2} btw 󱄅 ";
          }
          {
            type = "kernel";
            key = "{#separator}│  {#keys}󰒋 Kernel";
          }
          {
            type = "uptime";
            key = "{#separator}│  {#keys}󰅐 Uptime";
          }
          {
            type = "command";
            key = "{#separator}│  {#keys}󰅐 OS Age";
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo \"$days_difference days\"";
          }
          {
            type = "custom";
            format = "{#1}│";
          }

          # desktop
          {
            type = "custom";
            format = "{#1}│ {#}Desktop Environment";
          }
          {
            type = "wm";
            key = "{#separator}│  {#keys}󱂬 WM";
          }
          {
            type = "display";
            key = "{#separator}│  {#keys}󰹑 Resolution";
          }
          {
            type = "shell";
            key = "{#separator}│  {#keys}󰞷 Shell";
          }
          {
            type = "custom";
            format = "{#1}│";
          }

          # hw info
          {
            type = "custom";
            format = "{#1}│ {#}Hardware Information";
          }
          {
            type = "cpu";
            key = "{#separator}│  {#keys}󰻠 CPU";
          }
          {
            type = "gpu";
            key = "{#separator}│  {#keys}󰢮 GPU";
          }
          {
            type = "memory";
            key = "{#separator}│  {#keys}󰍛 Memory";
          }
          {
            type = "disk";
            key = "{#separator}│  {#keys}󰋊 Disk ({mountpoint})";
            folders = "/:/home:/mnt/bstor";
          }
          {
            type = "custom";
            format = "{#1}│";
          }

          # colors
          {
            type = "colors";
            key = "{#separator}│";
            symbol = "circle";
          }

          # footer
          {
            type = "custom";
            format = "{#1}╰───────────────────────────────╯";
          }
        ];
      };
    };
  };
}

