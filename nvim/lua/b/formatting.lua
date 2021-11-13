local cfg = {
    javascript = {
        -- prettier
        function()
            return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                stdin = true
            }
        end
    },
    typescript = {
        -- prettier
        function()
            return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                stdin = true
            }
        end
    },
    rust = {
        -- Rustfmt
        function()
            return {
                exe = "rustfmt",
                args = {"--emit=stdout"},
                stdin = true
            }
        end
    },
    lua = {
        -- luafmt
        function()
            return {
                exe = "luafmt",
                args = {"--indent-count", 4, "--stdin"},
                stdin = true
            }
        end
    },
    cpp = {
        -- clang-format
        function()
            return {
                exe = "clang-format",
                args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                stdin = true,
                cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
            }
        end
    },
    c = {
        function()
            return {
                exe = "clang-format",
                args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                stdin = true,
                cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
            }
        end
    },
    go = {
        function()
            return {exe = "goimports", args = {"-w", vim.api.nvim_buf_get_name(0)}, stdin = false}
        end,
        function()
            return {exe = "gci", args = {"-local", "cocoon", "-w", vim.api.nvim_buf_get_name(0)}, stdin = false}
        end
    },
    python = {
        function()
            return {exe = "black", args = {"-"}, stdin = true}
        end
    },
    vue = {
        function()
            return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote", "--parser", "vue"},
                stdin = true
            }
        end
    }
    -- extra slow + asks each time if I want to reopen the file as it has been changed
    -- dart = {
    --   function()
    --     return {
    --       exe = "flutter",
    --       args = {"format", vim.api.nvim_buf_get_name(0)},
    --       stdin = false
    --     }
    --   end
    -- }
}
require("formatter").setup(
    {
        logging = false,
        filetype = cfg
    }
)
vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.vue,*.ts,*.lua,*.go FormatWrite
  autocmd BufWritePre *.dart lua vim.lsp.buf.formatting_sync()
augroup END
]],
    true
)
