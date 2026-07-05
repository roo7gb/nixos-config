# fastfetch.nix

{ ... }: {

  # - CONFIG ------------------ #
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = "/home/roo7gb/.nixflake/etc/yakumOS.png";
        height = 25;
        padding = {
          right = 1;
        };
      };
      display = {
        separator = " ";
      };
      modules = [
        {
          type = "title";
          format = "{#1}╭───────────── {#}{user-name-colored}";
        }
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
        {
          type = "colors";
          key = "{#separator}│";
          symbol = "circle";
        }
        {
          type = "custom";
          format = "{#1}╰───────────────────────────────╯";
        }
      ];
    };
  };
}

