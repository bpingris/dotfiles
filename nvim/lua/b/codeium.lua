return {
	"Exafunction/codeium.vim",
	event = "InsertEnter",
	config = function()
		vim.g.codeium_disable_bindings = 1

		vim.keymap.set("i", "<C-l>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, noremap = true })
		vim.keymap.set("i", "<M-[>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, noremap = true })
		vim.keymap.set("i", "<M-]>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, noremap = true })
		vim.keymap.set("i", "<C-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, noremap = true })
		vim.keymap.set("i", "<C-z>", function()
			return vim.fn["codeium#Complete"]()
		end, { expr = true, noremap = true })
	end,
}
