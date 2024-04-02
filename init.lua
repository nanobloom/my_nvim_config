local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("keymaps")
require("lazy").setup("plugins")

-- Packages to consider:
--
-- 'folke/which-key.nvim' / NvCheatsheet (?)
-- 'folke/trouble.nvim'
-- 'tpope/vim-fugitive'
-- 'ThePrimeagen/vim-be-good'
-- 'hrsh7th/cmp-nvim-lua'
-- 'hrsh7th/cmp-buffer'
-- 'hrsh7th/cmp-path'
-- 'nvim-treesitter/playground'
