local prettierConfig = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

local formatterConfig = {}

local commonFT = {
  "css",
  "scss",
  "html",
  "java",
  "javascript",
  "typescript",
  "typescriptreact",
  "markdown",
  "markdown.mdx",
  "json"
}
for _, ft in ipairs(commonFT) do
  formatterConfig[ft] = {
    prettierConfig
  }
end

formatterConfig["python"] = {
    function()
        return {
            exe = "black",
            args = {"-"},
            stdin = true
        }
    end
}
formatterConfig["dart"] = {
    function()
        return {
            exe = "dart",
            args = {"format", vim.api.nvim_buf_get_name(0)},
            stdin = false
        }
    end
}

require("formatter").setup({
    logging = false,
    filetype = formatterConfig
})
