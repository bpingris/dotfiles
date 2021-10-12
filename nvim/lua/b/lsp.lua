local cmp = require'cmp'

cmp.setup{
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
        mapping = {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "buffer" },
        }
}

local on_attach = function(client, bufnr, server)
    print("'"..server.."' launched")
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

local function setup_servers()
    require"lspinstall".setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        require"lspconfig"[server].setup{
            on_attach = function(client, bufnr) on_attach(client, bufnr, server) end,
            capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        }
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
