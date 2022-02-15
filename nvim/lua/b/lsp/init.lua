local cmp = require "cmp"
local u = require "b.lsp.utils"

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping.confirm({select = true, behavior = cmp.ConfirmBehavior.Replace})
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "vsnip"},
        {name = "buffer", keyword_length = 3},
        {name = "path"}
    }
}

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(
    function(server)
        server:setup(
            {
                on_attach = function (c, b)
                    if server.name == "tsserver" then
                        c.resolved_capabilities.document_formatting = false
                    end
                    u.default_on_attach(c, b)
                end,
                capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
        )
        vim.cmd [[ do User LspAttachBuffers ]]
    end
)
require("flutter-tools").setup {
    lsp = {
        on_attach = u.default_on_attach,
        settings = {
            showTodos = false,
            completeFunctionCalls = true,
            analysisExcludedFolders = {
                vim.fn.expand "$HOME/.pub-cache",
                vim.fn.expand("$HOME/flutter/packages"),
                vim.fn.expand("$HOME/flutter/bin/cache"),
                vim.fn.expand("$HOME/flutter/.pub-cache"),
                vim.fn.expand("$HOME/flutter")
            },
            lineLength = 120
        }
    }
}

local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics
local code_actions = require("null-ls").builtins.code_actions

-- SOURCES https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
require("null-ls").setup {
    sources = {
        formatting.eslint_d,
        diagnostics.eslint,
        code_actions.eslint_d,
        formatting.goimports,
        diagnostics.golangci_lint,
        code_actions.refactoring
    }
}
