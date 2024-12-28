-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 40
-- NONE doesn't work with yabai
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.text_background_opacity = 0.5
config.font_size = 16

config.max_fps = 120

config.font = wezterm.font_with_fallback({
	"Cascadia Code",
	"JetBrainsMono Nerd Font Mono",
})

config.default_prog = { "/etc/profiles/per-user/gangjun/bin/nu", "-l" }

config.bold_brightens_ansi_colors = true

-- fix colored blocks instead of text
config.front_end = "WebGpu"

return config
