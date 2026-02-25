return {
	{
		'catppuccin/nvim',
		priority = 1000,
		config = function()
			require('catppuccin').setup({
				transparent_background = true,
				flavour = 'mocha'
			})

			-- vim.cmd.colorscheme 'catppuccin'
		end,
	},
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function ()
			require('onedark').setup({
				style = darker,
				transparent = true
			})
			require('onedark').load()
		end
	}
}
