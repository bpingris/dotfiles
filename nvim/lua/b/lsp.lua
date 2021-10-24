local cmp = require'cmp'
local au = require'b.au'

cmp.setup{
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer", keyword_length = 3 },
        { name = "path" },
    },
}

local setup_aucmd = function(client)
    if client and client.resolved_capabilities.document_formatting then
        -- format on save
        au.BufWritePre = function()
            -- BUG: folds are are removed when formatting is done, so we save the current state of the
            -- view and re-apply it manually after formatting the buffer
            -- @see: https://github.com/nvim-treesitter/nvim-treesitter/issues/1424#issuecomment-909181939
            vim.cmd 'mkview!'
            vim.lsp.buf.formatting_sync()
            vim.cmd 'loadview'
        end
    end
end

local on_attach = function(client, bufnr)
    setup_aucmd(client)
    local opts = { noremap = true, silent = true }
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "gn", ":lua vim.lsp.buf.rename()<CR>", opts)
    map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
    map("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", opts)
    map("n", "<leader>a", ":lua vim.lsp.buf.code_action()<CR>", opts)
    map("n", "<leader>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map("n", "d[", ":lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    map("n", "d]", ":lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end



local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

require('flutter-tools').setup{
    lsp = {
        on_attach = on_attach,
        settings = {
            showTodos = false,
            completeFunctionCalls = true,
            analysisExcludedFolders = {
                vim.fn.expand '$HOME/.pub-cache',
                vim.fn.expand("$HOME/flutter/packages"),
                vim.fn.expand("$HOME/flutter/bin/cache"),
                vim.fn.expand("$HOME/flutter/.pub-cache"),
                vim.fn.expand("$HOME/flutter"),

            },
            lineLength = 120
        }
    }
}
