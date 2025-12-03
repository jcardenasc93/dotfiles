local wezterm = require("wezterm")
local session_manager = require("wezterm-session-manager/session-manager")

-- shortcut to save typing below
local act = wezterm.action
local mux = wezterm.mux

local config = {}

local nord0 = "#2E3440"
local nord1 = "#3B4252"
local nord2 = "#434C5E"
local nord3 = "#4C566A"
local nord4 = "#D8DEE9"
local nord5 = "#E5E9F0"
local nord6 = "#ECEFF4"
local nord7 = "#8FBCBB"
local nord8 = "#88C0D0"
local nord9 = "#81A1C1"
local nord10 = "#5E81AC"
local nord11 = "#BF616A"
local nord12 = "#D08770"
local nord13 = "#EBCB8B"
local nord14 = "#A3BE8C"
local nord15 = "#B48EAD"

config = wezterm.config_builder()
config.font = wezterm.font("GeistMono Nerd Font")
config.font_size = 11
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "Nord (Gogh)"
config.window_background_opacity = 0.95
config.enable_kitty_graphics = true
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.show_new_tab_button_in_tab_bar = false

-- -------------------------------------
-- Window decorations
-- -------------------------------------

config.window_padding = {
	left = 10,
	right = 10,
	top = 3,
	bottom = 3,
}
config.window_background_opacity = 0.95

config.leader = { key = "b", mods = "CTRL", timout_milliseconds = 1000 }

-- Switch to the last active tab when I close a tab
config.switch_to_last_active_tab_when_closing_tab = true

-- Workspaces
config.unix_domains = {
	{
		name = "unix",
	},
}

-- --------------------------------------------------------------
-- Tab bar styling
-- --------------------------------------------------------------
-- Displays active Workspace
wezterm.on("update-right-status", function(window, pane)
	local workspace = window:active_workspace()
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = nord5 } },
		{ Background = { Color = nord8 } },
		{ Text = "  " .. workspace .. " " },
	}))
end)

config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = nord0,

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = nord10,
			-- The color of the text for the tab
			fg_color = nord6,

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Bold",
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = nord1,
			fg_color = nord9,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = nord1,
			fg_color = nord9,
		},
	},
}

-- Navigation function (see: https://github.com/mrjones2014/smart-splits.nvim?tab=readme-ov-file#wezterm)
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- -------------------------------------------------------------------------------
-- Session management
-- -------------------------------------------------------------------------------
wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

config.keys = {
	-- Copy mode
	{
		key = "[",
		mods = "LEADER",
		action = act.ActivateCopyMode,
	},

	-- Quick select mode
	{
		key = "{",
		mods = "LEADER",
		action = act.QuickSelect,
	},

	-- ----------------------------------------------------------------
	-- Session restoring
	-- ----------------------------------------------------------------
	{ key = "s", mods = "LEADER|SHIFT", action = wezterm.action({ EmitEvent = "save_session" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
	{ key = "r", mods = "LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },

	-- ----------------------------------------------------------------
	-- Workspaces
	-- ----------------------------------------------------------------
	{ key = "n", mods = "LEADER|SHIFT", action = act.SwitchWorkspaceRelative(1) },
	{ key = "p", mods = "LEADER|SHIFT", action = act.SwitchWorkspaceRelative(-1) },
	-- Show list of workspaces
	{
		key = "s",
		mods = "LEADER",
		action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},

	-- ----------------------------------------------------------------
	-- mux tabs
	-- ----------------------------------------------------------------
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "b",
		mods = "LEADER",
		action = wezterm.action.ActivateLastTab,
	},
	{
		key = ",",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "q",
		mods = "LEADER|SHIFT",
		action = act.CloseCurrentTab({ confirm = true }),
	},

	-- ----------------------------------------------------------------
	-- mux panes
	-- ----------------------------------------------------------------
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "l"),
	split_nav("move", "k"),
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "l"),
	split_nav("resize", "k"),
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "v",
		mods = "LEADER|SHIFT",
		action = act.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "q",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "z",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},
	-- show the pane selection mode, but have it swap the active and selected panes
	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	-- ----------------------------------------------------------------
	-- Workspaces
	-- ----------------------------------------------------------------
	-- Attach to muxer
	{
		key = "a",
		mods = "LEADER|SHIFT",
		action = act.AttachDomain("unix"),
	},
	-- Detach from muxer
	{
		key = "d",
		mods = "LEADER|SHIFT",
		action = act.DetachDomain({ DomainName = "unix" }),
	},
	-- Rename current session; analagous to command in tmux
	{
		key = "r",
		mods = "LEADER|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for session",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					mux.rename_workspace(window:mux_window():get_workspace(), line)
				end
			end),
		}),
	},
}

-- Tab activation by idx
for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i),
	})
end

-- moving tabs to pos
for i = 0, 9 do
	-- CTRL+ALT + number to move to that position
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = wezterm.action.MoveTab(i),
	})
end

return config
