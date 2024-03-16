return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"debugpy",
					"black",
					"mypy",
					"stylua",
					"lua_ls",
					"pyright",
				},
			})
		end,
	},
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
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local on_attach = require('cmp_nvim_lsp'). // https://github.com/dreamsofcode-io/neovim-python/blob/main/configs/lspconfig.lua

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				filetypes = { "python" },
				-- on_attach = on_attach
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
-- https://github.com/williamboman/mason.nvim/pull/1639/commits/0088ca599114e33bae3a4822dbfc5dc8ba357ab8
-- https://github.com/williamboman/mason.nvim/issues/1637
