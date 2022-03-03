-- nvim-cmp setup
local cmp = require('cmp')

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                })()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end,
    },
    sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = "buffer", keyword_length = 3 },
    { name = "path" },
    },
}


local lsp_installer = require('nvim-lsp-installer')

local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    local lsp = function(cmd) return ':lua vim.lsp.'..cmd end
    local diag = function(cmd) return ':lua vim.diagnostic.'..cmd end

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', lsp 'buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', lsp 'buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', lsp 'buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', lsp 'buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', lsp 'buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gn', lsp 'buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', lsp 'buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', lsp 'buf.code_action()<CR>', opts)
    -- Diagnostic keymaps
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', diag 'open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'd[', diag 'goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'd]', diag 'goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', diag 'setloclist()<CR>', opts)
end

local function contains (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end


lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = function (client, bufnr)
            if contains({"tsserver", "gopls"}, server.name) then
                client.resolved_capabilities.document_formatting = false
            end
            on_attach(client, bufnr)
        end,
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
    server:setup(opts)
end)

local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics
local code_actions = require("null-ls").builtins.code_actions
-- local completions = require("null-ls").builtins.completion

require('null-ls').setup({
    sources = {
        formatting.eslint_d,
        diagnostics.eslint,
        code_actions.eslint_d,
    },
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
                augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                augroup END
                ]])
        end
    end,

})
