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

require'lspsaga'.init_lsp_saga{
    error_sign = '▬',
    warn_sign = '▴',
    hint_sign = '⬧',
    infor_sign = '🛈',

}

local on_attach = function(server)
    print("'" .. server .. "' started") -- so I'm "sure" my LS has started!
end

local servers = {'tsserver', 'pyright', 'gopls', 'vuels', 'svelte', 'ccls'}

for _, server in ipairs(servers) do
    lspconfig[server].setup{
        on_attach=function(client, buf)
            on_attach(server)
        end,
        capabilities = capabilities,
    }
end

require("flutter-tools").setup {
    closing_tags = {
        highlight = "NonText",
        enabled = false
    },
    lsp = {
        on_attach = function(client,buf)
            on_attach('dartls')
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
