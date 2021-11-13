local formatters = {
    luafmt = {
        formatCommand = "luafmt ${-i:tabWidth} --stdin",
        formatStdin = true,
    },
    prettier = {
        formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
        formatStdin = true,
    },
    prettierd = {
        formatCommand = 'prettierd "${INPUT}"',
        formatStdin = true,
        -- env = {
            --   string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
            -- },
    },
    black = {
        formatCommand = "black --quiet -",
        formatStdin = true,
    }
}

-- local linters = {
--     eslint_d = {
--         lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
--         -- lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
--         lintIgnoreExitCode = true,
--         lintStdin = true,
--         lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"},
--         formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--         formatStdin = true
--     }
-- }

local languages = {
    -- typescript = { require('b.lsp.efm.prettier') },
    -- javascript = { require('b.lsp.efm.prettier') },
    -- vue = { require('b.lsp.efm.prettier') },
    typescript = {formatters.prettierd},
    javascript = {formatters.prettierd},
    vue = {formatters.prettierd},
}

return {
    filetypes = vim.tbl_keys(languages),
    init_options = {
        documentFormatting = true,
    },
    settings = {
        rootMarkers = {'.git', 'package.json'},
        lintDebounce = 500,
        languages = languages,
    },
}
