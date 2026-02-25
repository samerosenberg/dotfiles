-- Initial Setup
vim.g.mapleader=" "
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 10
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.winborder = 'rounded'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.diagnostic.config {
	update_in_insert = false,
	severity_sort = true,
	float = {border = 'rounded', source = 'if_many'},
	underline = {severity = vim.diagnostic.severity.ERROR},
	virtual_text = true,
	virutal_lines = false,
	jump = {float = true},
	signs = false
}

-- Auto open Neotree
vim.api.nvim_create_autocmd('BufReadPost', {
	once = true,
	callback = function ()
		require('neo-tree.command').execute({
			toggle = true,
			source = filesystem,
			position = left
		})
	end
})

vim.filetype.add({
	filename = {
		['config'] = 'jsonc'
	}
})
