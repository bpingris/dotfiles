local nvim_lsp = require"lspconfig"
local protocol = require"vim.lsp.protocol"


local on_attach = function(client, bufnr)
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

    map("i", "<C-Space>", "compe#complete()", {noremap=true,silent=true,expr=true})
    map("i", "<Tab>", "compe#confirm('<Tab>')", {noremap=true,silent=true,expr=true})
    map("i", "<C-e>", "compe#close('<C-e>')", {noremap=true,silent=true,expr=true})
    map("i", "<C-f>", "compe#scroll({'delta': +4 })", {noremap=true,silent=true,expr=true})
    map("i", "<C-d>", "compe#scroll({'delta': -4 })", {noremap=true,silent=true,expr=true})
end

-- NVIM COMPE
require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    };

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = true;
    };
}

-- LSPINSTALL
local function setup_servers()
    require"lspinstall".setup()
    local servers = require'lspinstall'.installed_servers()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    }
    for _, server in pairs(servers) do
        require"lspconfig"[server].setup{
            on_attach = function(client, bufnr) print("'"..server.."' launched"); on_attach(client, bufnr) end,
            capabilities = capabilities,
        }
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
