return function()
   require("telescope").setup({
      pickers = {
         find_files = {
            hidden = true,
         },
      },
      defaults = {
         mappings = {
            i = {
               ["<C-u>"] = false,
               ["<C-d>"] = false,
            },
         },
      },
   })

   -- Enable telescope fzf native
   require("telescope").load_extension("fzf")
end
