local enabled = true

if enabled then
    vim.api.nvim_exec([[
    augroup Cocoon
      autocmd!
      autocmd BufWritePost *.go silent !gci -local cocoon -w %
    augroup END
    ]], true)
end
