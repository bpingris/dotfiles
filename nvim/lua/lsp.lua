local lspconfig = require('lspconfig')
local saga = require 'lspsaga'

saga.init_lsp_saga({
    error_sign = '▬',
    warn_sign = '▴'
})

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


local servers = {'tsserver', 'pyls', 'rust_analyzer', 'gopls', 'vuels'}

for _, server in ipairs(servers) do
    lspconfig[server].setup{on_attach=function(a, b)
            print("'" .. server .. "' started") -- so I'm "sure" my LS has started!
        end,
        capabilities = capabilities,
    }
end

function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    local method = "textDocument/codeAction"
    local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
    if resp and resp[1] then
      local result = resp[1].result
      if result and result[1] then
        local edit = result[1].edit
        vim.lsp.util.apply_workspace_edit(edit)
      end
    end

    vim.lsp.buf.formatting_sync()
end

vim.cmd[[autocmd BufWritePre *.go lua goimports(1000)]]

