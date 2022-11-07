return function()
   require("nvim-treesitter.configs").setup({
      ensure_installed = {
         "lua",
         "tsx",
         "typescript",
         "javascript",
      },
      highlight = {
         enable = true, -- false will disable the whole extension
      },
      indent = {
         enable = true,
      },
      context_commentstring = {
         enable = true,
         enable_autocmd = false,
      },
   })

   require("treesitter-context").setup({})
end
