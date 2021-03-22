function apply_options(opts)
  for k, v in pairs(opts) do
    if v == true then
      vim.cmd("set " .. k)
    elseif v == false then
      vim.cmd(string.format("set no%s", k))
    else
      vim.cmd(string.format("set %s=%s", k, v))
    end
  end
end

apply_options{
	relativenumber=true,
	number=true,
	termguicolors=true,
	scrolloff=4,
	exrc=true,
	completeopt="menuone,noinsert,noselect",
	hidden=true,
	updatetime=50,
	signcolumn="yes",
	tabstop=4,
	softtabstop=4,
	shiftwidth=4,
	expandtab=true,
	wrap=false,
	smartcase=true,
	incsearch=true,
	hlsearch=true,
	swapfile=false,
	backup=false,
	undodir="~/.vim/undodir",
	undofile=true,
	shortmess="filnxtToOFc",
    mouse="a"
}

vim.cmd[[  
let ayucolor="dark"
colorscheme ayu
]]
