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

-- toggle background colour
wezterm.on('toggle-black', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.colors then
    overrides.colors = { background = '#000000', foreground = '#bbc2cf' }
  else
    overrides.colors = nil
  end
  window:set_config_overrides(overrides)
end)

config.keys = {
  {
    key = 'B',
    mods = 'CTRL',
    action = wezterm.action.EmitEvent 'toggle-black',
  },
}

-- more boilerplate
return config
