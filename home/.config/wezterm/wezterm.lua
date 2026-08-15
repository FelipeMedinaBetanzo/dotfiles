local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local schemes = {
  cyberdream = {
    foreground = '#ffffff', background = '#05050a', cursor_bg = '#5ef1ff',
    cursor_fg = '#05050a', cursor_border = '#5ef1ff', selection_fg = '#ffffff',
    selection_bg = '#3c4048', ansi = {'#16181a','#ff6e5e','#5eff6c','#f1ff5e','#5ea1ff','#bd5eff','#5ef1ff','#ffffff'},
    brights = {'#3c4048','#ffbd5e','#5eff6c','#f1ff5e','#5ea1ff','#bd5eff','#5ef1ff','#ffffff'},
  },
  cyber_ocean = {
    foreground = '#d5f4ff', background = '#041018', cursor_bg = '#50fae6', cursor_fg = '#041018',
    cursor_border = '#50fae6', selection_fg = '#ffffff', selection_bg = '#183b4d',
    ansi = {'#071820','#ff668c','#5af78e','#f3f99d','#57c7ff','#c792ea','#50fae6','#d5f4ff'},
    brights = {'#34515e','#ff92a8','#8affb4','#fff3a3','#85d8ff','#dda8ff','#85fff0','#ffffff'},
  },
  neon_noir = {
    foreground = '#f4eaff', background = '#09060d', cursor_bg = '#ff5ef1', cursor_fg = '#09060d',
    cursor_border = '#ff5ef1', selection_fg = '#ffffff', selection_bg = '#3d2347',
    ansi = {'#151019','#ff5e7a','#62ffb0','#ffe66d','#68a7ff','#c678ff','#65e7ff','#f4eaff'},
    brights = {'#514259','#ff8ca0','#91ffc9','#fff09e','#91c2ff','#d9a3ff','#94f0ff','#ffffff'},
  },
}

config.color_schemes = schemes
config.color_scheme = 'cyberdream'
config.font = wezterm.font_with_fallback { 'JetBrainsMono Nerd Font Mono', 'Noto Color Emoji' }
config.font_size = 12.5
config.window_background_opacity = 0.84
config.macos_window_background_blur = 24
config.window_decorations = 'RESIZE'
config.window_padding = { left = 14, right = 14, top = 12, bottom = 10 }
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.colors = { tab_bar = { background = '#05050a', active_tab = { bg_color = '#5ef1ff', fg_color = '#05050a', intensity = 'Bold' }, inactive_tab = { bg_color = '#16181a', fg_color = '#bd5eff' } } }
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 650
config.animation_fps = 60
config.max_fps = 120
config.audible_bell = 'Disabled'
config.scrollback_lines = 10000
config.window_close_confirmation = 'NeverPrompt'
config.adjust_window_size_when_changing_font_size = false

config.keys = {
  { key = 'Enter', mods = 'ALT', action = wezterm.action.ToggleFullScreen },
  { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'd', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'e', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right' },
}

return config

