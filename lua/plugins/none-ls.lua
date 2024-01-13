return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.mypy.with({
					extra_args = function()
						local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
						return { "--python-executable", virtual .. "/bin/python3" }
					end,
				}),
				null_ls.builtins.diagnostics.ruff,
				-- null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.diagnostics.erb_lint,
				-- null_ls.builtins.diagnostics.eslint_d,
				-- null_ls.builtins.diagnostics.rubocop,
				-- null_ls.builtins.formatting.rubocop,
			},
	-- 		on_attach = function(client, bufnr)
	-- 			if client.supports_method("textDocument/formatting") then
	-- 				vim.api.nvim_clear_autocmds({
	-- 					group = augroup,
	-- 					buffer = bufnr,
	-- 				})
	-- 				vim.api.nvim_create_autocmd("BufWritePre", {
	-- 					group = augroup,
	-- 					buffer = bufnr,
	-- 					callback = function()
	-- 						vim.lsp.buf.format({ bufnr = bufnr })
	-- 					end,
	-- 				})
	-- 			end
	 		})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	}
