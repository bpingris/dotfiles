return function()
	local tokyonight = require("tokyonight")

	tokyonight.setup({
		style = "night",
		sidebars = { "qf", "vista_kind", "terminal", "packer" },
		on_colors = function(colors)
			colors.border = colors.blue0
		end,
		on_highlights = function(hl, c)
			hl.CursorLineNr = { fg = c.orange, bold = true }

			hl.LineNr = { fg = "#aaaadd" }

			-- borderless telescope
			hl.TelescopeNormal = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopeBorder = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopePromptBorder = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopePromptTitle = {
				bg = c.bg_dark,
				fg = c.orange,
			}
			hl.TelescopePreviewTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopeResultsTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
		end,
	})
	tokyonight.load()
	vim.cmd("colorscheme tokyonight")
end
