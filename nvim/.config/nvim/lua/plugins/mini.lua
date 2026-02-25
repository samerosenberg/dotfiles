return {
	'nvim-mini/mini.nvim',
	config = function()
		require('mini.ai').setup { n_lines = 500 }
		require('mini.surround').setup()
		require('mini.pairs').setup()
		require('mini.comment').setup({
			mappings = {
				comment_line = '<C-/>',
				comment_visual = '<C-/>'
			}
		})
		require('mini.cursorword').setup()

	end
}
