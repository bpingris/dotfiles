local vim = vim
local function plug(path, config) 
    vim.validate {
        path = {path, 's'},
        config = {config, vim.tbl_islist, 'an array of packages'},
    }
    vim.fn["plug#begin"](path)

    for _, v in ipairs(config) do
        if type(v) == "string" then
            vim.fn["plug#"](v)
        elseif type(v) == "table" then
            local p = v[1]
            assert(p, "Must specify package as first index.")
            v[1] = nil
            vim.fn["plug#"](p, v)
            v[1] = p
        end
    end
    vim.fn["plug#end"]()
end

plug(tostring(os.getenv("HOME")) .. "/.vim/plugged", {
    {"nvim-treesitter/nvim-treesitter", ["do"] = ":TSUpdate"},
    "tjdevries/astronauta.nvim",

    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-compe",

    -- tpope a beast
    "tpope/vim-fugitive",
    "tpope/vim-surround",
    "tpope/vim-commentary",

    "mhartington/oceanic-next",
    "Th3Whit3Wolf/one-nvim",

    "jiangmiao/auto-pairs",
    "jose-elias-alvarez/buftabline.nvim",

    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", ["do"] = ":make"},
    "folke/tokyonight.nvim",
    "mhartington/formatter.nvim",
    "peitalin/vim-jsx-typescript",

    -- akinsho's a beast too
    "akinsho/flutter-tools.nvim"
})
