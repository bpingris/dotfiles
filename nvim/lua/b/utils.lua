return {
	keymap = function(mode, lhs, rhs, opts)
		vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { noremap = true, silent = true }, opts or {}))
	end,
}
