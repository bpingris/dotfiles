return function()
	local luasnip = require("luasnip")
	local cmp = require("cmp")

	local cmp_select = { behavior = cmp.SelectBehavior.Select }

	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		seources = {
			{ name = "nvim_lsp" },
		},
		sources = {
			{ name = "path" },
			{ name = "nvim_lsp", keyword_length = 3 },
			{ name = "buffer", keyword_length = 3 },
			{ name = "luasnip", keyword_length = 2 },
		},
		mapping = {
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
			["<C-e>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.close()
					fallback()
				else
					cmp.complete()
				end
			end),
			["<C-d>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),

			-- go to previous placeholder in the snippet
			["<C-b>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
	})
end
