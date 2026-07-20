-- nix-wrapper-overlays/overlays/wezterm/wezterm.lua

local wezterm = require 'wezterm'
local config = wezterm.config_builder and wezterm.config_builder() or {}

-- font config
config.font = wezterm.font 'Mononoki Nerd Font'
config.font_size = 14.0
config.font_rules = {
  {
    intensity = 'Bold',
    font = wezterm.font({ family = 'Mononoki Nerd Font', weight = 'Regular' })
  },
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font({ family = 'Mononoki Nerd Font', weight = 'Regular', style = 'Italic' })
  }
};

config.freetype_load_target = 'Light'
config.freetype_render_target = 'Light'

-- tabs
config.hide_tab_bar_if_only_one_tab = true

-- window
config.window_background_opacity = 1.0

-- colors
config.colors = {
  -- ansi
  ansi = {
    "#161616",
    "#d6717b",
    "#8ed671",
    "#d6b471",
    "#3395b2",
    "#8c7094",
    "#6965a6",
    "#dadada"
  },

  -- bg
  background = "151515",

  -- brights
  brights = {
    "#606060",
    "#d6404f",
    "#72d64b",
    "#d6a84b",
    "#29a6cc",
    "#896094",
    "#5f59b3",
    "#f8f8f8"
  },

  -- cursor
  compose_cursor = "d6b471",
  cursor_bg = "d6b471",
  cursor_fg = "151515",

  -- fg
  foreground = "d6b471",

  -- scrollbar
  scrollbar_thumb = "161616",

  -- selection
  selection_bg = "d6b471",
  selection_fg = "151515",

  -- split line
  split = "71bfd6",

  -- bell
  visual_bell = "d68571",

  -- tab colors
  tab_bar = {
    -- bg
    background = "161616",

    -- active tab
    active_tab = {
      bg_color = "151515",
      fg_color = "bcbcbc"
    },

    -- inactive tab
    inactive_tab = {
      bg_color = "5c5c5c",
      fg_color = "bcbcbc"
    },
    inactive_tab_hover = {
      bg_color = "bcbcbc",
      fg_color = "151515"
    },
    inactive_tab_edge = "161616",

    -- new tab
    new_tab = {
      bg_color = "5c5c5c",
      fg_color = "bcbcbc"
    },
    new_tab_hover = {
      bg_color = "bcbcbc",
      fg_color = "151515"
    },
  },
}

-- command palette
config.command_palette_bg_color = "161616"
config.command_palette_fg_color = "bcbcbc"

-- window frame
config.window_frame = {
  -- active titlebar
  active_titlebar_bg = "5c5c5c",
  active_titlebar_fg = "bcbcbc",
  active_titlebar_border_bottom = "5c5c5c",

  -- border
  border_bottom_color = "161616",
  border_left_color = "161616",
  border_right_color = "161616",
  border_top_color = "161616",

  -- buttons
  button_bg = "161616",
  button_fg = "bcbcbc",
  button_hover_bg = "bcbcbc",
  button_hover_fg = "5c5c5c",

  -- inactive titlebar
  inactive_titlebar_bg = "161616",
  inactive_titlebar_fg = "bcbcbc",
  inactive_titlebar_border_bottom = "5c5c5c"
}

return config

