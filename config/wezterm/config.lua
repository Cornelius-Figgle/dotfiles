-- boilerplate
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- general
config.automatically_reload_config = true

{{#if (eq dotter.os "windows")}}
  config.default_prog = { 'pwsh', '-NoLogo' }
{{/if}}

-- window appearance
config.enable_tab_bar = false

{{#if (eq dotter.hostname "poseidon")}}  -- only enable for Poseidon
  config.window_background_opacity = 0.5
{{/if}}

-- colours
config.color_scheme = 'One Dark (Gogh)'
config.colors = { background = '#202020', foreground = '#bbc2cf' }

-- fonts
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10.0

-- more boilerplate
return config
