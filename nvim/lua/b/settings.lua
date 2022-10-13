local options = {
   backup = false,
   clipboard = "unnamedplus",
   completeopt = { "menu", "menuone", "noselect" },
   conceallevel = 2,
   fileencoding = "utf-8",
   hlsearch = true,
   ignorecase = true,
   mouse = "a",
   pumheight = 10,
   showmode = false,
   showtabline = 1,
   smartcase = true,
   smartindent = true,
   splitright = true,
   swapfile = false,
   termguicolors = true,
   timeoutlen = 300,
   undofile = true,
   updatetime = 200,
   writebackup = false,
   expandtab = true,
   shiftwidth = 3,
   tabstop = 3,
   cursorline = false,
   number = true,
   relativenumber = true,
   signcolumn = "yes",
   wrap = false,
   scrolloff = 5,
   spell = false,
   list = true,
   listchars = { tab = "▸ " },
   winbar = '%f',
}

for k, v in pairs(options) do
   vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")

vim.opt.fillchars:append({ eob = " " }) -- hide tildes at the end of buffers

vim.g.vim_markdown_fenced_languages =
"c++=cpp", "python", "viml=vim", "bash=sh", "javascript=js", "java", "html", "xml", "markdown"

require("tokyonight").setup({
   style = "night",
   sidebars = { "qf", "vista_kind", "terminal", "packer" },
   on_colors = function(colors)
      colors.border = colors.blue0
   end,
})

vim.cmd([[colorscheme tokyonight]])

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank()
   end,
   group = highlight_group,
   pattern = "*",
})

vim.cmd([[
    hi LineNr guifg=#aaaaaa gui=bold
    hi CursorLineNr guifg=#dddddd gui=italic
    set cursorline
    set cursorlineopt=number
]])
