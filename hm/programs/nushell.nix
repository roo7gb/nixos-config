# nushell.nix

{
  lib,
  pkgs,
  catppuccin,
  ...
}:
{
  catppuccin.nushell.enable = true;

  programs.nushell = {
    enable = true;
    shellAliases = {
      v = "nvim";
      ff = ''fastfetch --logo-type kitty --logo-recache --logo-height 15 --logo "~/.nixflake/etc/cirnos.png"'';
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
      fastfetch --logo-type kitty --logo-recache --logo-height 15 --logo "~/.nixflake/etc/cirnos.png"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = ''$character$os$hostname$directory[](#74c7ec)$time[ ](#74c7ec)$cmd_duration$git_branch$git_status $python$aws$golang$java$rust$ruby$scala$dart$conda$pijul_channel$lua$rlang$package$buf$memory_usage$docker_context
[└─>](#74c7ec)'';
      continuation_prompt = "▶▶ ";
      character = {
        error_symbol = "X ";
      };
      time = {
        disabled = false;
	time_format = "%r";
	style = "bg:#64afd1";
	format = "[[ 󱑍 $time ](bg:#74c7ec fg:#11111b)]($style)";
      };
      cmd_duration = {
        format = "last command: [$duration](#f9e2af)";
      };
      os = {
        format = "[  ](#cba6f7)";
	disabled = false;
      };

      os.symbols = {
        NixOS = "  ";
      };
      hostname = {
        ssh_only = false;
	format = "on [$hostname](#89dceb)";
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
        style = "#a6e3a1";
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
	style = "#bac2de";
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
