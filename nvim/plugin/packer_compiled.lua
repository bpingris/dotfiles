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
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
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
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lsp-zero.nvim"] = {
    config = { "\27LJ\2\nF\0\1\3\0\2\0\0049\1\0\0+\2\1\0=\2\1\1K\0\1\0\31documentFormattingProvider\24server_capabilitiesF\0\1\3\0\2\0\0049\1\0\0+\2\1\0=\2\1\1K\0\1\0\31documentFormattingProvider\24server_capabilitiesY\0\3\n\1\5\0\f5\3\0\0-\4\0\0=\4\1\0036\4\2\0009\4\3\0049\4\4\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\1À\bset\vkeymap\bvim\vbuffer\1\0\1\nremap\1Ó\6\1\2\b\0\28\0D3\2\0\0\18\3\2\0'\5\1\0'\6\2\0'\a\3\0B\3\4\1\18\3\2\0'\5\1\0'\6\4\0'\a\5\0B\3\4\1\18\3\2\0'\5\1\0'\6\6\0'\a\a\0B\3\4\1\18\3\2\0'\5\1\0'\6\b\0'\a\t\0B\3\4\1\18\3\2\0'\5\1\0'\6\n\0'\a\v\0B\3\4\1\18\3\2\0'\5\1\0'\6\f\0'\a\r\0B\3\4\1\18\3\2\0'\5\1\0'\6\14\0'\a\15\0B\3\4\1\18\3\2\0'\5\1\0'\6\16\0'\a\17\0B\3\4\1\18\3\2\0'\5\1\0'\6\18\0'\a\19\0B\3\4\1\18\3\2\0'\5\20\0'\6\18\0'\a\21\0B\3\4\1\18\3\2\0'\5\1\0'\6\22\0'\a\23\0B\3\4\1\18\3\2\0'\5\1\0'\6\24\0'\a\25\0B\3\4\1\18\3\2\0'\5\1\0'\6\26\0'\a\27\0B\3\4\0012\0\0€K\0\1\0,<cmd>lua vim.diagnostic.goto_next()<cr>\ad],<cmd>lua vim.diagnostic.goto_prev()<cr>\ad[-<cmd>lua vim.diagnostic.open_float()<cr>\14<leader>e1<cmd>lua vim.lsp.buf.range_code_action()<cr>\6x+<cmd>lua vim.lsp.buf.code_action()<cr>\14<leader>a.<cmd>lua vim.lsp.buf.signature_help()<cr>\14<leader>k&<cmd>lua vim.lsp.buf.rename()<cr>\agn&<cmd>Telescope lsp_references<cr>\agr/<cmd>lua vim.lsp.buf.type_definition()<cr>\ago.<cmd>lua vim.lsp.buf.implementation()<cr>\agi+<cmd>lua vim.lsp.buf.declaration()<cr>\agD*<cmd>lua vim.lsp.buf.definition()<cr>\agd%<cmd>lua vim.lsp.buf.hover()<cr>\agh\6n\0I\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1À\nbufnr\1\0\0\vformat\bbuf\blsp\bvimÑ\1\1\2\a\0\t\0\0149\2\0\0009\2\1\2\15\0\2\0X\3\b€6\2\2\0009\2\3\0029\2\4\2'\4\5\0005\5\6\0003\6\a\0=\6\b\5B\2\3\0012\0\0€K\0\1\0\rcallback\0\1\0\2\tdesc\28Auto format before save\fpattern\r<buffer>\16BufWritePre\24nvim_create_autocmd\bapi\bvim\31documentFormattingProvider\24server_capabilitiesÅ\b\1\0\16\0E\0\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0025\3\6\0009\4\4\0009\4\5\4=\4\a\0039\4\b\1'\6\t\0B\4\2\0019\4\n\0019\4\v\4B\4\1\0029\5\f\0009\5\r\5'\a\14\0005\b\16\0009\t\15\0009\t\b\t9\t\r\tB\t\1\2=\t\15\b9\t\17\0009\t\18\t4\v\3\0005\f\19\0>\f\1\v4\f\3\0005\r\20\0>\r\1\fB\t\3\2=\t\18\bB\5\3\0019\5\15\0009\5\22\5\18\a\3\0B\5\2\2=\5\21\0049\5\15\0009\5\24\5\18\a\3\0B\5\2\2=\5\23\0049\5\15\0009\5\26\0055\a\27\0B\5\2\2=\5\25\0049\5\28\0015\a\29\0=\4\15\aB\5\2\0019\5\30\0015\a\31\0B\5\2\0019\5 \1'\a!\0005\b#\0003\t\"\0=\t$\bB\5\3\0019\5 \1'\a%\0005\b8\0005\t6\0005\n'\0005\v&\0=\v(\n5\v*\0005\f)\0=\f+\v=\v,\n5\v1\0006\f-\0009\f.\f9\f/\f'\0140\0+\15\2\0B\f\3\2=\f2\v=\v3\n5\v4\0=\v5\n=\n7\t=\t9\b3\t:\0=\t$\bB\5\3\0019\5$\0013\a;\0B\5\2\0019\5<\1'\a\3\0005\b>\0003\t=\0=\t$\bB\5\3\0029\6\f\0025\b?\0009\t$\5=\t$\b4\t\5\0009\n@\0029\n,\n9\nA\n>\n\1\t9\n@\0029\nB\n9\nA\n>\n\2\t9\n@\0029\nC\n9\nA\n>\n\3\t9\n@\0029\nB\n9\nD\n>\n\4\t=\t\18\bB\6\2\0019\6\f\1B\6\1\1K\0\1\0\vstylua\17code_actions\15formatting\reslint_d\rbuiltins\1\0\0\1\0\0\0\18build_options\0\0\rsettings\1\0\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\16sumneko_lua\14on_attach\1\0\0\0\rtsserver\14configure\1\0\1\20set_lsp_keymaps\1\20set_preferences\1\0\0\19setup_nvim_cmp\1\0\1\vselect\2\fconfirm\n<Tab>\21select_next_item\n<C-n>\21select_prev_item\n<C-p>\1\0\1\tname\fcmdline\1\0\1\tname\tpath\fsources\vconfig\1\0\0\fmapping\6:\fcmdline\nsetup\17cmp_mappings\rdefaults\16recommended\vpreset\rbehavior\1\0\0\vSelect\19SelectBehavior\fnull-ls\rlsp-zero\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine-lsp-progress.nvim"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress.nvim",
    url = "https://github.com/WhoIsSethDaniel/lualine-lsp-progress.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n×\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_c\1\0\0\1\3\0\0\rfilename\17lsp_progress\foptions\1\0\0\1\0\4\17globalstatus\2\18icons_enabled\2\25component_separators\6|\23section_separators\5\nsetup\flualine\frequire\0" },
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
    config = { "\27LJ\2\n¬\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\23popup_border_style\frounded\22enable_git_status\2\23enable_diagnostics\2\26sort_case_insensitive\1\25close_if_last_window\2\nsetup\rneo-tree\frequire\0" },
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
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
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
    config = { "\27LJ\2\n¢\2\0\0\4\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\0\0'\2\f\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\23treesitter-context\26context_commentstring\1\0\2\venable\2\19enable_autocmd\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\blua\btsx\15typescript\15javascript\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
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
    config = { "\27LJ\2\nÝ\1\0\0\6\0\16\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\v\0005\4\t\0005\5\b\0=\5\n\4=\4\f\3=\3\r\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\14\0'\2\15\0B\0\2\1K\0\1\0\bfzf\19load_extension\rdefaults\rmappings\1\0\0\6i\1\0\0\1\0\2\n<C-d>\1\n<C-u>\1\fpickers\1\0\0\15find_files\1\0\0\1\0\1\vhidden\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/bpingris/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n \0\1\2\0\2\0\0039\1\1\0=\1\0\0K\0\1\0\nblue0\vborder„\3\0\2\4\0\21\0+5\2\2\0009\3\1\1=\3\3\2=\2\0\0005\2\5\0=\2\4\0005\2\b\0009\3\a\1=\3\t\0029\3\n\1=\3\3\2=\2\6\0005\2\f\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\v\0005\2\14\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\r\0005\2\16\0009\3\a\1=\3\t\0029\3\1\1=\3\3\2=\2\15\0005\2\18\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\17\0005\2\20\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\19\0K\0\1\0\1\0\0\26TelescopeResultsTitle\1\0\0\26TelescopePreviewTitle\1\0\0\25TelescopePromptTitle\1\0\0\26TelescopePromptBorder\1\0\0\20TelescopeBorder\ffg_dark\abg\1\0\0\fbg_dark\20TelescopeNormal\1\0\1\afg\f#aaaadd\vLineNr\afg\1\0\1\tbold\2\vorange\17CursorLineNrµ\1\1\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0033\4\6\0=\4\a\0033\4\b\0=\4\t\3B\1\2\0019\1\n\0B\1\1\1K\0\1\0\tload\18on_highlights\0\14on_colors\0\rsidebars\1\5\0\0\aqf\15vista_kind\rterminal\vpacker\1\0\1\nstyle\nnight\nsetup\15tokyonight\frequire\0" },
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
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¢\2\0\0\4\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\0\0'\2\f\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\23treesitter-context\26context_commentstring\1\0\2\venable\2\19enable_autocmd\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\blua\btsx\15typescript\15javascript\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÝ\1\0\0\6\0\16\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\v\0005\4\t\0005\5\b\0=\5\n\4=\4\f\3=\3\r\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\14\0'\2\15\0B\0\2\1K\0\1\0\bfzf\19load_extension\rdefaults\rmappings\1\0\0\6i\1\0\0\1\0\2\n<C-d>\1\n<C-u>\1\fpickers\1\0\0\15find_files\1\0\0\1\0\1\vhidden\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n \0\1\2\0\2\0\0039\1\1\0=\1\0\0K\0\1\0\nblue0\vborder„\3\0\2\4\0\21\0+5\2\2\0009\3\1\1=\3\3\2=\2\0\0005\2\5\0=\2\4\0005\2\b\0009\3\a\1=\3\t\0029\3\n\1=\3\3\2=\2\6\0005\2\f\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\v\0005\2\14\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\r\0005\2\16\0009\3\a\1=\3\t\0029\3\1\1=\3\3\2=\2\15\0005\2\18\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\17\0005\2\20\0009\3\a\1=\3\t\0029\3\a\1=\3\3\2=\2\19\0K\0\1\0\1\0\0\26TelescopeResultsTitle\1\0\0\26TelescopePreviewTitle\1\0\0\25TelescopePromptTitle\1\0\0\26TelescopePromptBorder\1\0\0\20TelescopeBorder\ffg_dark\abg\1\0\0\fbg_dark\20TelescopeNormal\1\0\1\afg\f#aaaadd\vLineNr\afg\1\0\1\tbold\2\vorange\17CursorLineNrµ\1\1\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0033\4\6\0=\4\a\0033\4\b\0=\4\t\3B\1\2\0019\1\n\0B\1\1\1K\0\1\0\tload\18on_highlights\0\14on_colors\0\rsidebars\1\5\0\0\aqf\15vista_kind\rterminal\vpacker\1\0\1\nstyle\nnight\nsetup\15tokyonight\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
try_loadstring("\27LJ\2\nF\0\1\3\0\2\0\0049\1\0\0+\2\1\0=\2\1\1K\0\1\0\31documentFormattingProvider\24server_capabilitiesF\0\1\3\0\2\0\0049\1\0\0+\2\1\0=\2\1\1K\0\1\0\31documentFormattingProvider\24server_capabilitiesY\0\3\n\1\5\0\f5\3\0\0-\4\0\0=\4\1\0036\4\2\0009\4\3\0049\4\4\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\1À\bset\vkeymap\bvim\vbuffer\1\0\1\nremap\1Ó\6\1\2\b\0\28\0D3\2\0\0\18\3\2\0'\5\1\0'\6\2\0'\a\3\0B\3\4\1\18\3\2\0'\5\1\0'\6\4\0'\a\5\0B\3\4\1\18\3\2\0'\5\1\0'\6\6\0'\a\a\0B\3\4\1\18\3\2\0'\5\1\0'\6\b\0'\a\t\0B\3\4\1\18\3\2\0'\5\1\0'\6\n\0'\a\v\0B\3\4\1\18\3\2\0'\5\1\0'\6\f\0'\a\r\0B\3\4\1\18\3\2\0'\5\1\0'\6\14\0'\a\15\0B\3\4\1\18\3\2\0'\5\1\0'\6\16\0'\a\17\0B\3\4\1\18\3\2\0'\5\1\0'\6\18\0'\a\19\0B\3\4\1\18\3\2\0'\5\20\0'\6\18\0'\a\21\0B\3\4\1\18\3\2\0'\5\1\0'\6\22\0'\a\23\0B\3\4\1\18\3\2\0'\5\1\0'\6\24\0'\a\25\0B\3\4\1\18\3\2\0'\5\1\0'\6\26\0'\a\27\0B\3\4\0012\0\0€K\0\1\0,<cmd>lua vim.diagnostic.goto_next()<cr>\ad],<cmd>lua vim.diagnostic.goto_prev()<cr>\ad[-<cmd>lua vim.diagnostic.open_float()<cr>\14<leader>e1<cmd>lua vim.lsp.buf.range_code_action()<cr>\6x+<cmd>lua vim.lsp.buf.code_action()<cr>\14<leader>a.<cmd>lua vim.lsp.buf.signature_help()<cr>\14<leader>k&<cmd>lua vim.lsp.buf.rename()<cr>\agn&<cmd>Telescope lsp_references<cr>\agr/<cmd>lua vim.lsp.buf.type_definition()<cr>\ago.<cmd>lua vim.lsp.buf.implementation()<cr>\agi+<cmd>lua vim.lsp.buf.declaration()<cr>\agD*<cmd>lua vim.lsp.buf.definition()<cr>\agd%<cmd>lua vim.lsp.buf.hover()<cr>\agh\6n\0I\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1À\nbufnr\1\0\0\vformat\bbuf\blsp\bvimÑ\1\1\2\a\0\t\0\0149\2\0\0009\2\1\2\15\0\2\0X\3\b€6\2\2\0009\2\3\0029\2\4\2'\4\5\0005\5\6\0003\6\a\0=\6\b\5B\2\3\0012\0\0€K\0\1\0\rcallback\0\1\0\2\tdesc\28Auto format before save\fpattern\r<buffer>\16BufWritePre\24nvim_create_autocmd\bapi\bvim\31documentFormattingProvider\24server_capabilitiesÅ\b\1\0\16\0E\0\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0025\3\6\0009\4\4\0009\4\5\4=\4\a\0039\4\b\1'\6\t\0B\4\2\0019\4\n\0019\4\v\4B\4\1\0029\5\f\0009\5\r\5'\a\14\0005\b\16\0009\t\15\0009\t\b\t9\t\r\tB\t\1\2=\t\15\b9\t\17\0009\t\18\t4\v\3\0005\f\19\0>\f\1\v4\f\3\0005\r\20\0>\r\1\fB\t\3\2=\t\18\bB\5\3\0019\5\15\0009\5\22\5\18\a\3\0B\5\2\2=\5\21\0049\5\15\0009\5\24\5\18\a\3\0B\5\2\2=\5\23\0049\5\15\0009\5\26\0055\a\27\0B\5\2\2=\5\25\0049\5\28\0015\a\29\0=\4\15\aB\5\2\0019\5\30\0015\a\31\0B\5\2\0019\5 \1'\a!\0005\b#\0003\t\"\0=\t$\bB\5\3\0019\5 \1'\a%\0005\b8\0005\t6\0005\n'\0005\v&\0=\v(\n5\v*\0005\f)\0=\f+\v=\v,\n5\v1\0006\f-\0009\f.\f9\f/\f'\0140\0+\15\2\0B\f\3\2=\f2\v=\v3\n5\v4\0=\v5\n=\n7\t=\t9\b3\t:\0=\t$\bB\5\3\0019\5$\0013\a;\0B\5\2\0019\5<\1'\a\3\0005\b>\0003\t=\0=\t$\bB\5\3\0029\6\f\0025\b?\0009\t$\5=\t$\b4\t\5\0009\n@\0029\n,\n9\nA\n>\n\1\t9\n@\0029\nB\n9\nA\n>\n\2\t9\n@\0029\nC\n9\nA\n>\n\3\t9\n@\0029\nB\n9\nD\n>\n\4\t=\t\18\bB\6\2\0019\6\f\1B\6\1\1K\0\1\0\vstylua\17code_actions\15formatting\reslint_d\rbuiltins\1\0\0\1\0\0\0\18build_options\0\0\rsettings\1\0\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\16sumneko_lua\14on_attach\1\0\0\0\rtsserver\14configure\1\0\1\20set_lsp_keymaps\1\20set_preferences\1\0\0\19setup_nvim_cmp\1\0\1\vselect\2\fconfirm\n<Tab>\21select_next_item\n<C-n>\21select_prev_item\n<C-p>\1\0\1\tname\fcmdline\1\0\1\tname\tpath\fsources\vconfig\1\0\0\fmapping\6:\fcmdline\nsetup\17cmp_mappings\rdefaults\16recommended\vpreset\rbehavior\1\0\0\vSelect\19SelectBehavior\fnull-ls\rlsp-zero\bcmp\frequire\0", "config", "lsp-zero.nvim")
time([[Config for lsp-zero.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n \1\0\0\6\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0006\3\0\0'\5\3\0B\3\2\0029\3\4\3B\3\1\2=\3\6\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\20create_pre_hook7ts_context_commentstring.integrations.comment_nvim\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n×\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_c\1\0\0\1\3\0\0\rfilename\17lsp_progress\foptions\1\0\0\1\0\4\17globalstatus\2\18icons_enabled\2\25component_separators\6|\23section_separators\5\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n¬\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\23popup_border_style\frounded\22enable_git_status\2\23enable_diagnostics\2\26sort_case_insensitive\1\25close_if_last_window\2\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)

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
