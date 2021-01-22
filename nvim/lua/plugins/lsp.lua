local lspconfig = require'lspconfig'
local completion = require'completion'

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

local on_attach = function(client)
  completion.on_attach(client)
  mapper("n", "gh", "vim.lsp.buf.hover()")
  mapper("n", "gn", "vim.lsp.buf.rename()")
  mapper("n", "<C-k>", "vim.lsp.buf.signature_help()")
  mapper("n", "gd", "vim.lsp.buf.definition()")
  mapper("n", "<space>h", "vim.lsp.buf.code_action()")

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

local servers = {'tsserver', 'html', 'jsonls'}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach=on_attach
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = false,
    update_in_insert = false,
  }
)

vim.cmd('set completeopt=menuone,noinsert,noselect')
vim.cmd('set shortmess+=c')

