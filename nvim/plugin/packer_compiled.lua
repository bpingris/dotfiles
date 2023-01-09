-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/bpingris/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/bpingris/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/bpingris/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/bpingris/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/bpingris/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n \1\0\0\6\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0006\3\0\0'\5\3\0B\3\2\0029\3\4\3B\3\1\2=\3\6\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\20create_pre_hook7ts_context_commentstring.integrations.comment_nvim\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÊ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_c\1\0\0\1\2\0\0\rfilename\foptions\1\0\0\1\0\4\18icons_enabled\2\25component_separators\6|\23section_separators\5\17globalstatus\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\nå\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\vwindow\rmappings\1\0\0\1\0\1\n<esc>\17close_window\1\0\5\22enable_git_status\2\23enable_diagnostics\1\26sort_case_insensitive\1\25close_if_last_window\2\23popup_border_style\frounded\nsetup\rneo-tree\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\0À\tbody\15lsp_expand\\\0\1\3\1\3\0\15-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\6€-\1\0\0009\1\1\1B\1\1\1\18\1\0\0B\1\1\1X\1\3€-\1\0\0009\1\2\1B\1\1\1K\0\1\0\1À\rcomplete\nclose\fvisibleO\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3\1\0B\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1)\3\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\tjump\rjumpableO\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\tjump\rjumpable«\5\1\0\v\0(\0G6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\5\0009\3\3\0019\3\4\3=\3\6\0026\3\0\0'\5\a\0B\3\2\0029\3\b\3B\3\1\0019\3\t\0015\5\r\0005\6\v\0003\a\n\0=\a\f\6=\6\14\0054\6\0\0=\6\15\0054\6\3\0005\a\16\0>\a\1\6=\6\17\0054\6\5\0005\a\18\0>\a\1\0065\a\19\0>\a\2\0065\a\20\0>\a\3\0065\a\21\0>\a\4\6=\6\22\0055\6\25\0009\a\23\0019\a\24\a\18\t\2\0B\a\2\2=\a\26\0069\a\23\0019\a\27\a\18\t\2\0B\a\2\2=\a\28\0069\a\23\0019\a\29\a5\t\30\0B\a\2\2=\a\31\0069\a\23\0013\t \0B\a\2\2=\a!\0069\a\23\0013\t\"\0005\n#\0B\a\3\2=\a$\0069\a\23\0013\t%\0005\n&\0B\a\3\2=\a'\6=\6\23\5B\3\2\0012\0\0€K\0\1\0\n<C-b>\1\3\0\0\6i\6s\0\n<C-d>\1\3\0\0\6i\6s\0\n<C-e>\0\n<Tab>\1\0\1\vselect\2\fconfirm\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsources\1\0\2\tname\fluasnip\19keyword_length\3\2\1\0\2\tname\vbuffer\19keyword_length\3\3\1\0\2\tname\rnvim_lsp\19keyword_length\3\3\1\0\1\tname\tpath\rseources\1\0\1\tname\rnvim_lsp\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\14lazy_load luasnip.loaders.from_vscode\rbehavior\1\0\0\vSelect\19SelectBehavior\bcmp\fluasnip\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nk\0\2\4\0\4\0\b\6\0\0\0X\2\2€\a\0\1\0X\2\3€9\2\2\1+\3\1\0=\3\3\2K\0\1\0\31documentFormattingProvider\24server_capabilities\16sumneko_lua\rtsserver2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vformat\bbuf\blsp\bvim9\0\3\n\2\2\0\t-\3\0\0\18\5\0\0\18\6\1\0\18\a\2\0005\b\0\0-\t\1\0=\t\1\bB\3\5\1K\0\1\0\0\0\1À\vbuffer\1\0\0.\0\1\4\0\2\0\5'\1\0\0\18\2\0\0'\3\1\0&\1\3\1L\1\2\0\t<cr>\18:lua vim.lsp.5\0\1\4\0\2\0\5'\1\0\0\18\2\0\0'\3\1\0&\1\3\1L\1\2\0\t<cr>\25:lua vim.diagnostic.¥\4\1\2\f\1\25\0N3\2\0\0003\3\1\0003\4\2\0\18\5\2\0'\a\3\0'\b\4\0'\t\5\0B\5\4\1\18\5\2\0'\a\3\0'\b\6\0\18\t\3\0'\v\a\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\4\0\18\t\3\0'\v\b\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\t\0'\t\n\0B\5\4\1\18\5\2\0'\a\3\0'\b\v\0\18\t\3\0'\v\f\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\r\0\18\t\3\0'\v\14\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\15\0\18\t\3\0'\v\16\0B\t\2\0A\5\2\1\18\5\2\0'\a\17\0'\b\15\0\18\t\3\0'\v\18\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\19\0\18\t\4\0'\v\20\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\21\0\18\t\4\0'\v\22\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\23\0\18\t\4\0'\v\24\0B\t\2\0A\5\2\0012\0\0€K\0\1\0\2À\16goto_next()\ad]\16goto_prev()\ad[\17open_float()\14<leader>e\28buf.range_code_action()\6x\22buf.code_action()\14<leader>a\25buf.signature_help()\14<leader>k\17buf.rename()\agn\":Telescope lsp_references<cr>\agr\16buf.hover()\21buf.definition()\agd\5\agh\6n\0\0\0001\0\2\6\3\0\0\t-\2\0\0-\4\1\0\18\5\0\0B\2\3\1-\2\2\0\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\1\0\0À\2\0«\1\1\1\a\4\t\0\18-\1\0\0008\1\0\0019\1\0\0015\3\2\0003\4\1\0=\4\3\0036\4\4\0'\6\5\0B\4\2\0029\4\6\4B\4\1\2=\4\a\3-\4\3\0008\4\0\4=\4\b\3B\1\2\0012\0\0€K\0\1\0\0À\3À\5À\4À\rsettings\17capabilities\25default_capabilities\17cmp_nvim_lsp\frequire\14on_attach\1\0\0\0\nsetupI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1À\nbufnr\1\0\0\vformat\bbuf\blsp\bvimÑ\1\1\2\a\0\t\0\0149\2\0\0009\2\1\2\15\0\2\0X\3\b€6\2\2\0009\2\3\0029\2\4\2'\4\5\0005\5\6\0003\6\a\0=\6\b\5B\2\3\0012\0\0€K\0\1\0\rcallback\0\1\0\2\fpattern\r<buffer>\tdesc\28Auto format before save\16BufWritePre\24nvim_create_autocmd\bapi\bvim\31documentFormattingProvider\24server_capabilities¬\5\1\0\14\0,\0R6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0023\3\5\0005\4\24\0005\5\22\0005\6\a\0005\a\6\0=\a\b\0065\a\n\0005\b\t\0=\b\v\a=\a\f\0065\a\17\0006\b\r\0009\b\14\b9\b\15\b'\n\16\0+\v\2\0B\b\3\2=\b\18\a=\a\19\0065\a\20\0=\a\21\6=\6\23\5=\5\25\0046\5\r\0009\5\14\0059\5\26\5'\a\27\0003\b\28\0004\t\0\0B\5\4\0013\5\29\0006\6\0\0'\b\30\0B\6\2\0029\6\31\6B\6\1\0016\6\0\0'\b \0B\6\2\0029\6\31\6B\6\1\0016\6\0\0'\b \0B\6\2\0029\6!\0064\b\3\0003\t\"\0>\t\1\bB\6\2\0019\6#\0019\6$\0069\a#\0019\a\f\a9\b#\0019\b%\b9\t\31\0015\v(\0004\f\5\0009\r&\6>\r\1\f9\r&\a>\r\2\f9\r&\b>\r\3\f9\r'\6>\r\4\f=\f)\v3\f*\0=\f+\vB\t\2\0012\0\0€K\0\1\0\14on_attach\0\fsources\1\0\0\vstylua\reslint_d\17code_actions\15formatting\rbuiltins\0\19setup_handlers\20mason-lspconfig\nsetup\nmason\0\0\14LspFormat\29nvim_create_user_command\16sumneko_lua\1\0\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\0\vkeymap\fb.utils\fnull-ls\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n½\2\0\0\4\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\0016\0\0\0'\2\14\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\23treesitter-context\fautotag\1\0\1\venable\2\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\blua\btsx\15typescript\15javascript\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n»\2\0\0\a\0\20\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0005\5\b\0005\6\a\0=\6\t\5=\5\n\4=\4\v\3=\3\r\0025\3\16\0005\4\15\0005\5\14\0=\5\t\4=\4\n\3=\3\17\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\18\0'\2\19\0B\0\2\1K\0\1\0\bfzf\19load_extension\rdefaults\1\0\0\1\0\0\1\0\2\n<C-u>\1\n<C-d>\1\fpickers\1\0\0\fbuffers\rmappings\6i\1\0\0\1\0\1\n<C-d>\18delete_buffer\1\0\2\21show_all_buffers\2\18sort_lastused\2\15find_files\1\0\0\1\0\1\vhidden\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n \0\1\2\0\2\0\0039\1\1\0=\1\0\0K\0\1\0\nblue0\vborder„\3\0\2\4\0\21\0+5\2\2\0009\3\1\1=\3\3\2=\2\0\0005\2\5\0=\2\4\0005\2\b\0009\3\a\1=\3\t\0029\3\n\1=\3\3\2=\2\6\0005\2\f\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\v\0005\2\14\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\r\0005\2\16\0009\3\a\1=\3\t\0029\3\1\1=\3\3\2=\2\15\0005\2\18\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\17\0005\2\20\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\19\0K\0\1\0\1\0\0\26TelescopeResultsTitle\1\0\0\26TelescopePreviewTitle\1\0\0\25TelescopePromptTitle\1\0\0\26TelescopePromptBorder\1\0\0\20TelescopeBorder\ffg_dark\abg\1\0\0\fbg_dark\20TelescopeNormal\1\0\1\afg\f#aaaadd\vLineNr\afg\1\0\1\tbold\2\vorange\17CursorLineNrä\1\1\0\5\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0033\4\6\0=\4\a\0033\4\b\0=\4\t\3B\1\2\0019\1\n\0B\1\1\0016\1\v\0009\1\f\1'\3\r\0B\1\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\tload\18on_highlights\0\14on_colors\0\rsidebars\1\5\0\0\aqf\15vista_kind\rterminal\vpacker\1\0\1\nstyle\nnight\nsetup\15tokyonight\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n \0\1\2\0\2\0\0039\1\1\0=\1\0\0K\0\1\0\nblue0\vborder„\3\0\2\4\0\21\0+5\2\2\0009\3\1\1=\3\3\2=\2\0\0005\2\5\0=\2\4\0005\2\b\0009\3\a\1=\3\t\0029\3\n\1=\3\3\2=\2\6\0005\2\f\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\v\0005\2\14\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\r\0005\2\16\0009\3\a\1=\3\t\0029\3\1\1=\3\3\2=\2\15\0005\2\18\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\17\0005\2\20\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\19\0K\0\1\0\1\0\0\26TelescopeResultsTitle\1\0\0\26TelescopePreviewTitle\1\0\0\25TelescopePromptTitle\1\0\0\26TelescopePromptBorder\1\0\0\20TelescopeBorder\ffg_dark\abg\1\0\0\fbg_dark\20TelescopeNormal\1\0\1\afg\f#aaaadd\vLineNr\afg\1\0\1\tbold\2\vorange\17CursorLineNrä\1\1\0\5\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0033\4\6\0=\4\a\0033\4\b\0=\4\t\3B\1\2\0019\1\n\0B\1\1\0016\1\v\0009\1\f\1'\3\r\0B\1\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\tload\18on_highlights\0\14on_colors\0\rsidebars\1\5\0\0\aqf\15vista_kind\rterminal\vpacker\1\0\1\nstyle\nnight\nsetup\15tokyonight\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nå\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\vwindow\rmappings\1\0\0\1\0\1\n<esc>\17close_window\1\0\5\22enable_git_status\2\23enable_diagnostics\1\26sort_case_insensitive\1\25close_if_last_window\2\23popup_border_style\frounded\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÊ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_c\1\0\0\1\2\0\0\rfilename\foptions\1\0\0\1\0\4\18icons_enabled\2\25component_separators\6|\23section_separators\5\17globalstatus\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nk\0\2\4\0\4\0\b\6\0\0\0X\2\2€\a\0\1\0X\2\3€9\2\2\1+\3\1\0=\3\3\2K\0\1\0\31documentFormattingProvider\24server_capabilities\16sumneko_lua\rtsserver2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vformat\bbuf\blsp\bvim9\0\3\n\2\2\0\t-\3\0\0\18\5\0\0\18\6\1\0\18\a\2\0005\b\0\0-\t\1\0=\t\1\bB\3\5\1K\0\1\0\0\0\1À\vbuffer\1\0\0.\0\1\4\0\2\0\5'\1\0\0\18\2\0\0'\3\1\0&\1\3\1L\1\2\0\t<cr>\18:lua vim.lsp.5\0\1\4\0\2\0\5'\1\0\0\18\2\0\0'\3\1\0&\1\3\1L\1\2\0\t<cr>\25:lua vim.diagnostic.¥\4\1\2\f\1\25\0N3\2\0\0003\3\1\0003\4\2\0\18\5\2\0'\a\3\0'\b\4\0'\t\5\0B\5\4\1\18\5\2\0'\a\3\0'\b\6\0\18\t\3\0'\v\a\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\4\0\18\t\3\0'\v\b\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\t\0'\t\n\0B\5\4\1\18\5\2\0'\a\3\0'\b\v\0\18\t\3\0'\v\f\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\r\0\18\t\3\0'\v\14\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\15\0\18\t\3\0'\v\16\0B\t\2\0A\5\2\1\18\5\2\0'\a\17\0'\b\15\0\18\t\3\0'\v\18\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\19\0\18\t\4\0'\v\20\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\21\0\18\t\4\0'\v\22\0B\t\2\0A\5\2\1\18\5\2\0'\a\3\0'\b\23\0\18\t\4\0'\v\24\0B\t\2\0A\5\2\0012\0\0€K\0\1\0\2À\16goto_next()\ad]\16goto_prev()\ad[\17open_float()\14<leader>e\28buf.range_code_action()\6x\22buf.code_action()\14<leader>a\25buf.signature_help()\14<leader>k\17buf.rename()\agn\":Telescope lsp_references<cr>\agr\16buf.hover()\21buf.definition()\agd\5\agh\6n\0\0\0001\0\2\6\3\0\0\t-\2\0\0-\4\1\0\18\5\0\0B\2\3\1-\2\2\0\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\1\0\0À\2\0«\1\1\1\a\4\t\0\18-\1\0\0008\1\0\0019\1\0\0015\3\2\0003\4\1\0=\4\3\0036\4\4\0'\6\5\0B\4\2\0029\4\6\4B\4\1\2=\4\a\3-\4\3\0008\4\0\4=\4\b\3B\1\2\0012\0\0€K\0\1\0\0À\3À\5À\4À\rsettings\17capabilities\25default_capabilities\17cmp_nvim_lsp\frequire\14on_attach\1\0\0\0\nsetupI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1À\nbufnr\1\0\0\vformat\bbuf\blsp\bvimÑ\1\1\2\a\0\t\0\0149\2\0\0009\2\1\2\15\0\2\0X\3\b€6\2\2\0009\2\3\0029\2\4\2'\4\5\0005\5\6\0003\6\a\0=\6\b\5B\2\3\0012\0\0€K\0\1\0\rcallback\0\1\0\2\fpattern\r<buffer>\tdesc\28Auto format before save\16BufWritePre\24nvim_create_autocmd\bapi\bvim\31documentFormattingProvider\24server_capabilities¬\5\1\0\14\0,\0R6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0023\3\5\0005\4\24\0005\5\22\0005\6\a\0005\a\6\0=\a\b\0065\a\n\0005\b\t\0=\b\v\a=\a\f\0065\a\17\0006\b\r\0009\b\14\b9\b\15\b'\n\16\0+\v\2\0B\b\3\2=\b\18\a=\a\19\0065\a\20\0=\a\21\6=\6\23\5=\5\25\0046\5\r\0009\5\14\0059\5\26\5'\a\27\0003\b\28\0004\t\0\0B\5\4\0013\5\29\0006\6\0\0'\b\30\0B\6\2\0029\6\31\6B\6\1\0016\6\0\0'\b \0B\6\2\0029\6\31\6B\6\1\0016\6\0\0'\b \0B\6\2\0029\6!\0064\b\3\0003\t\"\0>\t\1\bB\6\2\0019\6#\0019\6$\0069\a#\0019\a\f\a9\b#\0019\b%\b9\t\31\0015\v(\0004\f\5\0009\r&\6>\r\1\f9\r&\a>\r\2\f9\r&\b>\r\3\f9\r'\6>\r\4\f=\f)\v3\f*\0=\f+\vB\t\2\0012\0\0€K\0\1\0\14on_attach\0\fsources\1\0\0\vstylua\reslint_d\17code_actions\15formatting\rbuiltins\0\19setup_handlers\20mason-lspconfig\nsetup\nmason\0\0\14LspFormat\29nvim_create_user_command\16sumneko_lua\1\0\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\0\vkeymap\fb.utils\fnull-ls\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n½\2\0\0\4\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\0016\0\0\0'\2\14\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\23treesitter-context\fautotag\1\0\1\venable\2\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\blua\btsx\15typescript\15javascript\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n \1\0\0\6\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0006\3\0\0'\5\3\0B\3\2\0029\3\4\3B\3\1\2=\3\6\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\20create_pre_hook7ts_context_commentstring.integrations.comment_nvim\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\0À\tbody\15lsp_expand\\\0\1\3\1\3\0\15-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\6€-\1\0\0009\1\1\1B\1\1\1\18\1\0\0B\1\1\1X\1\3€-\1\0\0009\1\2\1B\1\1\1K\0\1\0\1À\rcomplete\nclose\fvisibleO\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3\1\0B\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1)\3\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\tjump\rjumpableO\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\tjump\rjumpable«\5\1\0\v\0(\0G6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\5\0009\3\3\0019\3\4\3=\3\6\0026\3\0\0'\5\a\0B\3\2\0029\3\b\3B\3\1\0019\3\t\0015\5\r\0005\6\v\0003\a\n\0=\a\f\6=\6\14\0054\6\0\0=\6\15\0054\6\3\0005\a\16\0>\a\1\6=\6\17\0054\6\5\0005\a\18\0>\a\1\0065\a\19\0>\a\2\0065\a\20\0>\a\3\0065\a\21\0>\a\4\6=\6\22\0055\6\25\0009\a\23\0019\a\24\a\18\t\2\0B\a\2\2=\a\26\0069\a\23\0019\a\27\a\18\t\2\0B\a\2\2=\a\28\0069\a\23\0019\a\29\a5\t\30\0B\a\2\2=\a\31\0069\a\23\0013\t \0B\a\2\2=\a!\0069\a\23\0013\t\"\0005\n#\0B\a\3\2=\a$\0069\a\23\0013\t%\0005\n&\0B\a\3\2=\a'\6=\6\23\5B\3\2\0012\0\0€K\0\1\0\n<C-b>\1\3\0\0\6i\6s\0\n<C-d>\1\3\0\0\6i\6s\0\n<C-e>\0\n<Tab>\1\0\1\vselect\2\fconfirm\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsources\1\0\2\tname\fluasnip\19keyword_length\3\2\1\0\2\tname\vbuffer\19keyword_length\3\3\1\0\2\tname\rnvim_lsp\19keyword_length\3\3\1\0\1\tname\tpath\rseources\1\0\1\tname\rnvim_lsp\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\14lazy_load luasnip.loaders.from_vscode\rbehavior\1\0\0\vSelect\19SelectBehavior\bcmp\fluasnip\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n»\2\0\0\a\0\20\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0005\5\b\0005\6\a\0=\6\t\5=\5\n\4=\4\v\3=\3\r\0025\3\16\0005\4\15\0005\5\14\0=\5\t\4=\4\n\3=\3\17\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\18\0'\2\19\0B\0\2\1K\0\1\0\bfzf\19load_extension\rdefaults\1\0\0\1\0\0\1\0\2\n<C-u>\1\n<C-d>\1\fpickers\1\0\0\fbuffers\rmappings\6i\1\0\0\1\0\1\n<C-d>\18delete_buffer\1\0\2\21show_all_buffers\2\18sort_lastused\2\15find_files\1\0\0\1\0\1\vhidden\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
