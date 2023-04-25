local M = {}

M.find_cmd = function(cmd, prefixes, start_from, stop_at)
	local util = require("null-ls.utils")

	if start_from == nil then
		start_from = vim.api.nvim_buf_get_name(0)
	end

	if prefixes == nil then
		prefixes = { "" }
	elseif type(prefixes) == "string" then
		prefixes = { prefixes }
	end

	local found
	for _, prefix in ipairs(prefixes) do
		local full_cmd = prefix and util.path.join(prefix, cmd) or cmd

		for dir in vim.fs.parents(start_from) do
			local maybe_executable = util.path.join(dir, full_cmd)
			if util.is_executable(maybe_executable) then
				found = maybe_executable
				break
			end
			if dir == stop_at then
				break
			end
		end

		if found ~= nil then
			break
		end
	end

	return found or cmd
end

M.keymap = function(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { noremap = true, silent = true }, opts or {}))
end

return M
