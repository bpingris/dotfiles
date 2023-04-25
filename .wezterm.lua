local wezterm = require("wezterm")

local act = wezterm.action

-- local function isViProcess(pane)
-- 	-- get_foreground_process_name On Linux, macOS and Windows,
-- 	-- the process can be queried to determine this path. Other operating systems
-- 	-- (notably, FreeBSD and other unix systems) are not currently supported
-- 	return pane:get_foreground_process_name():find("n?vim") ~= nil
-- 	-- return pane:get_title():find("n?vim") ~= nil
-- end
--
-- local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
-- 	if isViProcess(pane) then
-- 		window:perform_action(
-- 			-- This should match the keybinds you set in Neovim.
-- 			act.SendKey({ key = vim_direction, mods = "CTRL" }),
-- 			pane
-- 		)
-- 	else
-- 		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
-- 	end
-- end
--
-- wezterm.on("ActivatePaneDirection-right", function(window, pane)
-- 	conditionalActivatePane(window, pane, "Right", "l")
-- end)
-- wezterm.on("ActivatePaneDirection-left", function(window, pane)
-- 	conditionalActivatePane(window, pane, "Left", "h")
-- end)
-- wezterm.on("ActivatePaneDirection-up", function(window, pane)
-- 	conditionalActivatePane(window, pane, "Up", "k")
-- end)
-- wezterm.on("ActivatePaneDirection-down", function(window, pane)
-- 	conditionalActivatePane(window, pane, "Down", "j")
-- end)
--
-- wezterm.on("update-right-status", function(win)
-- 	win:set_right_status(win:active_workspace())
-- end)
--
local keys = {
	{ key = "t", mods = "SUPER", action = "DisableDefaultAssignment" },
	{ key = "f", mods = "SUPER", action = wezterm.action_callback(function(win)
		win:maximize()
	end) },
	-- { key = "m", mods = "SUPER", action = act.DisableDefaultAssignment },
	-- { key = "n", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },
	-- { key = "s", mods = "SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- { key = "t", mods = "SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- { key = "g", mods = "SUPER", action = act.PaneSelect },
	--
	-- { key = "h", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-left") },
	-- { key = "j", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-down") },
	-- { key = "k", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-up") },
	-- { key = "l", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-right") },
	--
	-- { key = "f", mods = "SUPER|SHIFT", action = act.Search({ Regex = "" }) },
	-- { key = "e", mods = "SUPER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	-- { key = "[", mods = "SUPER", action = act.ActivateCopyMode },
}

local PADDING = 8

return {
	color_scheme = "tokyonight",
	enable_tab_bar = false,
	window_padding = {
		top = PADDING,
		bottom = PADDING,
		left = PADDING,
		right = PADDING,
	},
	font = wezterm.font("JetBrainsMono Nerd Font"),
	line_height = 1.35,
	window_decorations = "RESIZE",
	use_ime = false,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	colors = {
		tab_bar = {
			background = "#1a1b26",
			active_tab = {
				bg_color = "#1F2335",
				fg_color = "#eeeeee",
			},
			inactive_tab = {
				bg_color = "#1a1b26",
				fg_color = "#808080",
			},
			inactive_tab_hover = {
				bg_color = "#181b29",
				fg_color = "#909090",
				italic = true,
			},
		},
	},
	keys = keys,
	key_tables = {
		copy_mode = {
			{
				key = "Escape",
				mods = "NONE",
				action = act.Multiple({ act.CopyMode("ClearPattern"), act.CopyMode("Close") }),
			},
			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
			{
				key = "v",
				mods = "NONE",
				action = act.CopyMode({ SetSelectionMode = "Cell" }),
			},
			{
				key = "v",
				mods = "CTRL",
				action = act.CopyMode({ SetSelectionMode = "Block" }),
			},
			{
				key = "V",
				mods = "NONE",
				action = act.CopyMode({ SetSelectionMode = "Line" }),
			},
			{
				key = "V",
				mods = "SHIFT",
				action = act.CopyMode({ SetSelectionMode = "Line" }),
			},
			{
				key = "f",
				mods = "NONE",
				action = act.CopyMode({ JumpForward = { prev_char = false } }),
			},
			{
				key = "t",
				mods = "NONE",
				action = act.CopyMode({ JumpForward = { prev_char = true } }),
			},
			{
				key = "T",
				mods = "NONE",
				action = act.CopyMode({ JumpBackward = { prev_char = true } }),
			},
			{
				key = "T",
				mods = "SHIFT",
				action = act.CopyMode({ JumpBackward = { prev_char = true } }),
			},
			{ key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
			{ key = ",", mods = "NONE", action = act.CopyMode("JumpReverse") },
			{
				key = "$",
				mods = "SHIFT",
				action = act.CopyMode("MoveToEndOfLineContent"),
			},
			{
				key = "0",
				mods = "NONE",
				action = act.CopyMode("MoveToStartOfLine"),
			},
			{
				key = "y",
				mods = "NONE",
				action = act.Multiple({
					act.CopyTo("ClipboardAndPrimarySelection"),
					act.CopyMode("ClearPattern"),
					act.CopyMode("Close"),
				}),
			},

			{ key = "k", mods = "SHIFT", action = act.CopyMode("PageUp") },
			{ key = "j", mods = "SHIFT", action = act.CopyMode("PageDown") },
			{
				key = "/",
				mods = "NONE",
				action = act.Multiple({ act.CopyMode("ClearPattern"), act.Search({ CaseSensitiveString = "" }) }),
			},
			{ key = "?", mods = "NONE", action = act({ Search = { CaseInSensitiveString = "" } }) },
			{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
			{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
		},
		search_mode = {
			{ key = "Escape", mods = "NONE", action = act({ CopyMode = "Close" }) },
			-- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
			-- to navigate search results without conflicting with typing into the search area.
			{ key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
			{ key = "c", mods = "CTRL", action = "ActivateCopyMode" },
			{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
			{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
			{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
			{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
		},
	},
}
