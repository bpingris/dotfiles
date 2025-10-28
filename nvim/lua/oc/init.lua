local M = {}

local function list_oc_addrs()
	local output = vim.fn.system("lsof -w -iTCP -sTCP:LISTEN -P -n | grep opencode")

	local addresses = {}

	for line in output:gmatch("[^\r\n]+") do
		if not line:match("^COMMAND") then
			local address = line:match("TCP%s+([%d%.]+:%d+)%s+%(LISTEN%)")
			if address then
				table.insert(addresses, address)
			end
		end
	end

	return addresses
end

local function get_oc_addr(oc_ports, cb)
	if #oc_ports == 0 then
		vim.notify("no opencode process found", vim.log.levels.WARN)
		return nil
	end
	if #oc_ports == 1 then
		cb(oc_ports[1])
		return
	end

	return vim.ui.select(oc_ports, {
		prompt = "Select opencode port",
	}, function(choice)
		if #choice == 0 then
			vim.notify("no opencode process found", vim.log.levels.WARN)
			return
		end
		cb(choice)
	end)
end

local function get_locations()
	local ok, start_line = pcall(vim.fn.line, "'<")
	if not ok or start_line == 0 then
		return nil
	end
	local ok2, end_line = pcall(vim.fn.line, "'>")
	if not ok2 or end_line == 0 then
		return nil
	end
	local start_col = vim.fn.col("'<")
	local end_col = vim.fn.col("'>")

	local bufnr = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(bufnr)
	local end_line_content = vim.api.nvim_buf_get_lines(bufnr, end_line - 1, end_line, false)[1] or ""

	if end_col > #end_line_content then
		end_col = #end_line_content
	end

	if start_col <= 0 then
		start_col = 1
	end
	if end_col <= 0 then
		end_col = 1
	end

	return string.format("%s:%d:%d-%d:%d", filepath, start_line, start_col, end_line, end_col)
end

local function curl(oc_addr, body, endpoint)
	local curl_command = {
		"curl",
		"-X",
		"POST",
		"-H",
		"Content-Type: application/json",
	}

	if body then
		table.insert(curl_command, "-d")
		table.insert(curl_command, vim.fn.json_encode(body))
	end

	table.insert(curl_command, oc_addr .. "/tui/" .. endpoint)
	vim.fn.jobstart(curl_command)
end

M.append_prompt = function(text)
	local oc_ports = list_oc_addrs()

	get_oc_addr(oc_ports, function(oc_addr)
		local locations = get_locations()

		local body_text = text
		if locations then
			body_text = locations .. " " .. text
		end

		local body = { text = body_text }

		curl(oc_addr, body, "append-prompt")
	end)
end

M.submit_prompt = function()
	get_oc_addr(list_oc_addrs(), function(oc_addr)
		curl(oc_addr, {}, "submit-prompt")
	end)
end

M.setup = function()
	vim.api.nvim_create_user_command("OC", function(opts)
		M.append_prompt(opts.args)
	end, {
		nargs = "+",
		range = true,
		desc = "Send selected text and command to endpoint",
	})
end

return M
