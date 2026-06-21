# fastfetch.nix

{
  pkgs,
  ...
}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = "/home/roo7gb/.nixflake/etc/cirno.png";
	height = 25;
      };
      display = {
        separator = " : ";
      };
      modules = [
        "title"
        "separator"
        {
          type = "os";
	  key = "OS";
	}
        {
	  type = "kernel";
	  key = "Kernel";
	}
	{
	  type = "uptime";
	  key = "Uptime";
	}
	{
	  type = "shell";
	  key = "Shell";
	}
	{
	  type = "wm";
	  key = "WM";
	}
	{
	  type = "terminal";
	  key = "Terminal";
	}
        {
	  type = "cpu";
	  key = "CPU";
	}
        {
	  type = "gpu";
	  key = "GPU";
	}
        {
	  type = "memory";
	  key = "Memory";
	}
        {
	  type = "disk";
	  key = "Disk";
	}
      ];
    };
  };
}
