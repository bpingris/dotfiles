local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


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
    treesitter = true;
  };
}

local on_attach = function(server, client, bufnr)
            print("'" .. server .. "' started") -- so I'm "sure" my LS has started!
            vim.cmd [[
            set completeopt=menuone,noinsert,noselect
            set shortmess+=c

            let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

            nnoremap gd :lua vim.lsp.buf.definition()<CR>
            nnoremap gi :lua vim.lsp.buf.implementation()<CR>
            nnoremap gr :lua vim.lsp.buf.references()<CR>
            nnoremap gn :lua vim.lsp.buf.rename()<CR>
            nnoremap gh :lua vim.lsp.buf.hover()<CR>
            nnoremap gs :lua vim.lsp.buf.signature_help()<CR>
            nnoremap <leader>a :lua vim.lsp.buf.code_action()<CR>
            nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
            nnoremap <leader>s :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
            nnoremap d[ :lua vim.lsp.diagnostic.goto_prev()<CR>
            nnoremap d] :lua vim.lsp.diagnostic.goto_next()<CR>

            imap <silent><expr> <c-Space> compe#complete()
            inoremap <silent><expr> <Tab>      compe#confirm('<Tab>')
            inoremap <silent><expr> <C-e>     compe#close('<C-e>')
            ]]
        end

local servers = {'tsserver', 'pyls', 'gopls', 'vuels', 'svelte'}

for _, server in ipairs(servers) do
    lspconfig[server].setup{
        on_attach=function(client, buf)
            on_attach(server, client, buf)
        end,
        capabilities = capabilities,
    }
end

require("flutter-tools").setup {
  flutter_outline = {
    highlight = "NonText",
    enabled = true,
  },
  outline = {
    open_cmd = "30vnew",
  },
  lsp = {
    on_attach = function(client,buf)
        on_attach('dartls', client, buf)
    end,
    capabilities = capabilities
  }
}



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

