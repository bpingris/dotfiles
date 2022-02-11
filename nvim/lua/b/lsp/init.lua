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
local formatters = {
    luafmt = {
        formatCommand = "luafmt ${-i:tabWidth} --stdin",
        formatStdin = true
    },
    prettier = {
        formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
        formatStdin = true
    },
    prettierd = {
        formatCommand = 'prettierd "${INPUT}"',
        formatStdin = true
        -- env = {
        --   string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
        -- },
    },
    black = {
        formatCommand = "black --quiet -",
        formatStdin = true
    }
}

local languages = {
    -- typescript = { require('b.lsp.efm.prettier') },
    -- javascript = { require('b.lsp.efm.prettier') },
    -- vue = { require('b.lsp.efm.prettier') },
    typescript = {formatters.prettierd},
    javascript = {formatters.prettierd},
    vue = {formatters.prettierd}
}

local configs = {
    efm = {
        filetypes = vim.tbl_keys(languages),
        init_options = {
            documentFormatting = true
        },
        settings = {
            rootMarkers = {".git", "package.json"},
            lintDebounce = 500,
            languages = languages
        },
        on_attach = u.default_on_attach
    },
    -- efm = { require('b.lsp.efm'), on_attach = on_attach },
    tsserver = {
        on_attach = function(c, b)
            c.resolved_capabilities.document_formatting = false
            c.resolved_capabilities.document_range_formatting = false
            u.default_on_attach(c, b)
        end,
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    },
    default = {
        on_attach = u.default_on_attach,
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
}

lsp_installer.on_server_ready(
    function(server)
        server:setup(
            {
                on_attach = u.default_on_attach,
                capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
        )
        vim.cmd [[ do User LspAttachBuffers ]]
    end
)

-- require("go").config.update_tool(
--     "quicktype",
--     function(tool)
--         tool.pkg_mgr = "npm"
--     end
-- )
--
-- require("go").setup(
--     {
--         linter = "golangci-lint",
--         lint_prompt_style = "vt"
--     }
-- )
--
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
