return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			-- local on_attach = require('cmp_nvim_lsp'). // https://github.com/dreamsofcode-io/neovim-python/blob/main/configs/lspconfig.lua 

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				filetypes = {"python"},
				-- on_attach = on_attach
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
