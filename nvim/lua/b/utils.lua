local M = {}

function M.create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command('augroup '..group_name)
		vim.api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			-- if type(def) == 'table' and type(def[#def]) == 'function' then
			-- 	def[#def] = lua_callback(def[#def])
			-- end
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command('augroup END')
	end
end

function M.apply_options(opts)
  for k, v in pairs(opts) do
    if v == true then
      vim.cmd("set " .. k)
    elseif v == false then
      vim.cmd(string.format("set no%s", k))
    else
      vim.cmd(string.format("set %s=%s", k, v))
    end
  end
end

return M
