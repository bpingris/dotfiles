if not pcall(require, "impatient") then
	print("failed to load impatient.")
end

require("b.plugins")
require("b.settings")
require("b.keybindings")
require("b.theme")
require("b.telescope")
require("b.comment")
require("b.treesitter")
require("b.surround")
require("b.autopairs")
require("b.tree")
require("b.lsp")
