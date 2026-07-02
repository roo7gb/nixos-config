# nushell.nix

{ config, lib, pkgs, ... }: {

  # - TOGGLE ------------------ #
  options = {
    nushell.enable =
      lib.mkEnableOption "enables nushell";
  };

  # - NU CONFIG --------------- #
  programs.nushell = lib.mkIf config.nushell.enable {
    enable = true;
    shellAliases = {
      v = "nvim";
      ff = ''fastfetch --logo-type kitty --logo-recache --logo-height 15 --logo "~/.nixflake/etc/yakumOS.png"'';
    };
    extraConfig = ''
      $env.config = {
        show_banner: false,
	completions: {
	  case_sensitive: false
	  quick: true
	  partial: true
	  algorithm: "fuzzy"
	  external: {
            max_results: 100
	  }
	}
      }
      fastfetch --logo-type kitty --logo-recache --logo-height 15 --logo "~/.nixflake/etc/yakumOS.png"
    '';
  };

  # - STARSHIP CONFIG --------- #
  programs.starship = lib.mkIf config.nushell.enable {
    enable = true;
    settings = {
      add_newline = false;
      format = ''$character(#78a9ff)$os$hostname$directory[](#d6b471)$time[ ](#d6b471)$cmd_duration$git_branch$git_status $python$aws$golang$java$rust$ruby$scala$dart$conda$pijul_channel$lua$rlang$package$buf$memory_usage$docker_context
[└─>](#78a9ff)'';
      continuation_prompt = "▶▶ ";
      character = {
        error_symbol = "X ";
      };
      time = {
        disabled = false;
	time_format = "%r";
	style = "bg:#eac67e";
	format = "[[ 󱑍 $time ](bg:#d6b471 fg:#282828)]($style)";
      };
      cmd_duration = {
        format = "last command: [$duration](#dfdfe0)";
      };
      os = {
        format = "[  ](#78a9ff)";
	disabled = false;
      };

      os.symbols = {
        NixOS = "  ";
      };
      hostname = {
        ssh_only = false;
	format = "on [$hostname](#33b1ff)";
	disabled = false;
      };
      directory = {
        truncation_length = 3;
	fish_style_pwd_dir_length = 2;
	home_symbol = "󰋜 ~";
	read_only_style = "197";
	read_only = "  ";
	format = " at [$path]($style)[$read_only]($read_only_style) ";
      };
      git_branch = {
        symbol = " ";
	format = "[$symbol$branch]($style)";
	truncation_symbol = ".../";
	style = "#a6e3a1";
      };
      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "#78a9ff";
        conflicted = "🏳";
        up_to_date = "";
        untracked = " ";
        ahead = "⇡$count";
        diverged = "⇕⇡$ahead_count⇣$behind_count";
        behind = "⇣$count";
        stashed = " ";
        modified = " ";
        staged = "[++($count)](green)";
        renamed = "襁 ";
        deleted = " ";
      };
      aws.symbol = " ";
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      docker_context.symbol = " ";
      golang.symbol = " ";
      java.symbol = " ";
      lua.symbol = " ";
      memory_usage = {
        symbol = "󰍛 ";
	disabled = true;
	style = "#ee5396";
	threshold = 1;
	format = "$symbol [$ram(|$swap)]($style) ";
      };
      nodejs.symbol = " ";
      package.symbol = "󰏗 ";
      pijul_channel.symbol = " ";
      python = {
        symbol = " ";
	pyenv_version_name = true;
      };
      ruby.symbol = " ";
      rlang.symbol = "󰟔 ";
      rust.symbol = " ";
      scala.symbol = " ";
    };
  };
}

