local cmp = require("cmp")
local lsp = require("lsp-zero")
local null_ls = require("null-ls")

local cmp_select = { behavior = cmp.SelectBehavior.Select }

lsp.preset("recommended")

local cmp_mapping = lsp.defaults.cmp_mappings()

cmp_mapping["<C-p>"] = cmp.mapping.select_prev_item(cmp_select)
cmp_mapping["<C-n>"] = cmp.mapping.select_next_item(cmp_select)
cmp_mapping["<Tab>"] = cmp.mapping.confirm({ select = true })

lsp.setup_nvim_cmp({ mapping = cmp_mapping })

lsp.set_preferences({
   set_lsp_keymaps = false,
})

lsp.configure("tsserver", {
   on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
   end,
})

lsp.configure("sumneko_lua", {
   settings = {
      Lua = {
         runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
         },
         diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
         },
         workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
         },
         -- Do not send telemetry data containing a randomized but unique identifier
         telemetry = {
            enable = false,
         },
      },
   },
   on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
   end,
})

lsp.on_attach(function(_, bufnr)
   local map = function(mode, lhs, rhs)
      local opts = { remap = false, buffer = bufnr }
      vim.keymap.set(mode, lhs, rhs, opts)
   end

   -- LSP actions
   map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>")
   map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
   map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
   map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
   map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
   map("n", "gr", "<cmd>Telescope lsp_references<cr>") --lua vim.lsp.buf.references()<cr>")
   map("n", "gn", "<cmd>lua vim.lsp.buf.rename()<cr>")
   map("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
   map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>")
   map("x", "<leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

   -- Diagnostics
   map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>")
   map("n", "d[", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
   map("n", "d]", "<cmd>lua vim.diagnostic.goto_next()<cr>")
end)

local null_opts = lsp.build_options("null-ls", {
   on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
         vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = function() vim.lsp.buf.format({bufnr = bufnr}) end,
         })
      end
   end,
})

null_ls.setup({
   on_attach = null_opts.on_attach,
   sources = {
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.formatting.stylua,
   },
})

lsp.setup()
