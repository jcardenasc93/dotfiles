local wezterm = require("wezterm")
return {
	font = wezterm.font("MonaspiceNe Nerd Font"),
	font_size = 11,
	color_scheme_dirs = { "~/.config/wezterm/colors" },
	-- color_scheme = "Everforest Dark (Hard)",
	color_scheme = "Nord (Gogh)",
	hide_tab_bar_if_only_one_tab = true,
	enable_kitty_graphics = true,
}
