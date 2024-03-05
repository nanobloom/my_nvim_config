return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			local function make_cmp_mapping(keybind, cmp_method)
				return function(fallback)
					if cmp.visible() then
						cmp_method()
					else
						fallback()
					end
				end
			end

			local custom_mappings = {
				["<C-k>"] = make_cmp_mapping("<C-k>", cmp.select_prev_item),
				["<C-j>"] = make_cmp_mapping("<C-j>", cmp.select_next_item),
				["<C-e>"] = make_cmp_mapping("<C-e>", cmp.abort),
				["<C-d>"] = make_cmp_mapping("<C-d>", function()
					cmp.scroll_docs(4)
				end),
				["<C-u>"] = make_cmp_mapping("<C-u>", function()
					cmp.scroll_docs(-4)
				end),
				["<CR>"] = make_cmp_mapping("<CR>", function()
					cmp.confirm({ select = true })
				end),
			}

			local mapping = cmp.mapping.preset.insert(custom_mappings)

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = mapping,
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
				}),
			})
		end,
	},
}
