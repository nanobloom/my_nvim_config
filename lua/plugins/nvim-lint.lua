return {
	{
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
--         javascript = { "eslint_d" },
--         typescript = { "eslint_d" },
--         javascriptreact = { "eslint_d" },
--         typescriptreact = { "eslint_d" },
--         svelte = { "eslint_d" },
--         kotlin = { "ktlint" },
--         terraform = { "tflint" },
--         ruby = { "standardrb" },
				python = {'mypy'},
      }

-- https://stackoverflow.com/questions/76487150/how-to-avoid-cannot-find-implementation-or-library-stub-when-mypy-is-installed
			lint.linters.mypy = {
				cmd = 'mypy',
				stdin = true,
				append_fname = true,
				args = function()
					local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
					return { "--python-executable", virtual .. "/bin/python3" }
				end,
			}

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
}
