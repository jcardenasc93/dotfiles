local wezterm = require 'wezterm'
return {
    -- font = wezterm.font 'GoMono Nerd Font',
    font = wezterm.font 'Monaspace Neon',
    font_size = 11,
    color_scheme_dirs = { "~/.config/wezterm/colors" },
    color_scheme = "Everforest Dark (Hard)",
    window_background_opacity = 0.93,
    hide_tab_bar_if_only_one_tab = true,
    enable_kitty_graphics = true,
}
