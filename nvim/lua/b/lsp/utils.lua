local au = require'b.au'

local M = {};

-- M.setFormatOnSave = function(client)
--   if client.resolved_capabilities.document_formatting then
--       -- BufWritePost ?
--       au.BufWritePre = {
--           '<buffer>',
--           function()
--               -- BUG: folds are are removed when formatting is done, so we save the current state of the
--               -- view and re-apply it manually after formatting the buffer
--               -- @see: https://github.com/nvim-treesitter/nvim-treesitter/issues/1424#issuecomment-909181939
--               vim.cmd 'mkview!'
--               vim.lsp.buf.formatting_sync()
--               vim.cmd 'loadview'
--           end}
--       end

--   if client.resolved_capabilities.document_highlight then
--       au.group('LspDocumentHighlight', {
--           'CursorHold',
--           '<buffer>',
--           vim.lsp.buf.document_highlight
--       },
--       {
--           'CursorMoved',
--           '<buffer>',
--           vim.lsp.buf.clear_references
--       })
--       -- vim.cmd [[
--       --   augroup lsp_document_highlight
--       --     autocmd! * <buffer>
--       --     autocmd CursorHold <buffer> :lua vim.lsp.buf.document_highlight()
--       --     autocmd CursorMoved <buffer> :lua vim.lsp.buf.clear_references()
--       --   augroup END
--       -- ]]
--   end
-- end
--

M.set_keybindings = function(bufnr)
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


M.setup_aucmd = function(client)
    if client and client.resolved_capabilities.document_formatting then
        -- format on save
        au.BufWritePre = function()
            -- BUG: folds are are removed when formatting is done, so we save the current state of the
            -- view and re-apply it manually after formatting the buffer
            -- @see: https://github.com/nvim-treesitter/nvim-treesitter/issues/1424#issuecomment-909181939
            -- vim.cmd 'mkview!'
            vim.lsp.buf.formatting_sync()
            -- vim.cmd 'loadview'
        end
    end
end

M.default_on_attach = function (client, bufnr)
    -- M.setup_aucmd(client)
    M.set_keybindings(bufnr)
end

return M;
