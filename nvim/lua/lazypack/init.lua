local M = {}

--- Extract the plugin name from a URL or return as-is if already a name
---@param src string The plugin source URL or name
---@return string name The plugin name
local function get_plugin_name(src)
	-- Handle URLs like "https://github.com/tpope/vim-fugitive"
	local name = src:match("/([^/]+)$")
	if name then
		-- Remove .git suffix if present
		name = name:gsub("%.git$", "")
		return name
	end
	return src
end

--- Convert a lazypack spec to an lze spec
---@param spec table The lazypack plugin spec
---@return table|nil lze_spec The lze spec, or nil if no lazy loading needed
local function to_lze_spec(spec)
	local name = get_plugin_name(spec[1])

	-- If there are no lazy-loading triggers and no after function, load immediately
	local has_lazy_triggers = spec.keys or spec.event or spec.cmd or spec.ft or spec.colorscheme

	if not has_lazy_triggers and not spec.after then
		-- Load immediately via vim.pack
		return nil
	end

	-- Build lze spec
	local lze_spec = {
		name,
		after = spec.after,
	}

	-- Copy over lazy-loading triggers
	if spec.keys then
		lze_spec.keys = spec.keys
	end
	if spec.event then
		lze_spec.event = spec.event
	end
	if spec.cmd then
		lze_spec.cmd = spec.cmd
	end
	if spec.ft then
		lze_spec.ft = spec.ft
	end
	if spec.colorscheme then
		lze_spec.colorscheme = spec.colorscheme
	end

	return lze_spec
end

--- Setup plugins with lazy loading support
---@param plugins table Array of plugin specs (strings or tables)
function M.setup(plugins)
	-- First, install and load lze (required for lazy loading)
	vim.pack.add({
		"https://github.com/BirdeeHub/lze",
	}, { load = true })

	local immediate_plugins = {}
	local lze_specs = {}

	for _, plugin in ipairs(plugins) do
		if type(plugin) == "string" then
			-- Simple string plugin - load immediately
			table.insert(immediate_plugins, plugin)
		elseif type(plugin) == "table" then
			local src = plugin[1]
			if not src then
				error("lazypack: plugin spec must have a source URL as first element")
			end

			local lze_spec = to_lze_spec(plugin)
			if lze_spec then
				-- Plugin has lazy-loading triggers - add to lze specs
				table.insert(lze_specs, lze_spec)
			end

			-- Add to vim.pack list (will be installed but not loaded if lazy)
			table.insert(immediate_plugins, {
				src = src,
				version = plugin.version,
			})
		end
	end

	-- Step 1: Install all plugins with vim.pack.add
	-- Plugins that need lazy loading get an empty load function
	-- Plugins that should load immediately get load = true
	local pack_specs = {}
	for _, plugin in ipairs(immediate_plugins) do
		if type(plugin) == "string" then
			-- Check if this plugin is in lze_specs (meaning it needs lazy loading)
			local plugin_name = get_plugin_name(plugin)
			local needs_lazy = false
			for _, spec in ipairs(lze_specs) do
				if spec[1] == plugin_name then
					needs_lazy = true
					break
				end
			end

			if needs_lazy then
				table.insert(pack_specs, { src = plugin, load = function() end })
			else
				table.insert(pack_specs, { src = plugin, load = true })
			end
		else
			-- Complex plugin spec from table
			local plugin_name = get_plugin_name(plugin.src)
			local needs_lazy = false
			for _, spec in ipairs(lze_specs) do
				if spec[1] == plugin_name then
					needs_lazy = true
					break
				end
			end

			if needs_lazy then
				table.insert(pack_specs, { src = plugin.src, version = plugin.version, load = function() end })
			else
				table.insert(pack_specs, { src = plugin.src, version = plugin.version, load = true })
			end
		end
	end

	vim.pack.add(pack_specs)

	-- Step 2: Load lze specs for lazy-loaded plugins
	if #lze_specs > 0 then
		require("lze").load(lze_specs)
	end
end

return M
