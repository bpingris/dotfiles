local api = vim.api
local lspconfig = require 'lspconfig'
local saga = require 'lspsaga'
local K = require 'keybindings'.K



require 'compe'.setup {
  enabled = true,
  debug = true,
  min_length = 2,
  preselect = "always",
  source_timeout = 200,
  allow_prefix_unmatch = false,
  source = {
    path = true,
    buffer = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    dict = true
  }
}


local rt = function(codes)
  return vim.api.nvim_replace_termcodes(codes, true, true, true)
end

function _G.tab_confirm()
  if vim.fn.pumvisible() == 1 then
    return rt('<CR>')
  else
    return rt('<Tab>')
  end
end

local on_attach = function(client)
  print("'" .. client.name .. "' server attached")
end

servers = {'bashls', 'dockerls', 'pyright', 'tsserver', 'vuels'}
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach=on_attach
  }
end

-- lspsaga
saga.init_lsp_saga({
  border_style = 2,
})
saga.init_lsp_saga()

K({
  {'i', "<CR>", "pumvisible() ? compe#confirm('<CR>') : '<CR>'", {noremap=true, expr=true}},
  {'i'; "<Tab>", "v:lua.tab_confirm()", {expr=true}},
  {'n', 'gr', ':Lspsaga lsp_finder<CR>', {noremap=true}},
  {'n', 'gh', ':Lspsaga hover_doc<CR>', {noremap=true}},
  {'n', 'gp', ':Lspsaga preview_definition<CR>', {noremap=true}},
  {'n', '<leader>a', ':Lspsaga code_action<CR>', {noremap=true}},
})

FormatRange = function()
  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")
  vim.lsp.buf.range_formatting({}, start_pos, end_pos)
end

vim.lsp.handlers["textDocument/formatting"] = function(err, _, res, _, bufnr)
   if err ~= nil or result == nil then
    return
  end
  if not vim.bo[bufnr].modified then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.cmd("noautocmd :update")
    end
  end
end

vim.cmd([[
  command! -range FormatRange  execute 'lua FormatRange()'
]])

vim.cmd([[
  command! LSPFormat  execute 'lua vim.lsp.buf.formatting()'
]])
