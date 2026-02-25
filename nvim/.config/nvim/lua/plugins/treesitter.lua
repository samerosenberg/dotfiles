return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local filetypes = { "lua", "json" }
		require("nvim-treesitter").setup({
			ensure_installed = filetypes,
			highlight = {
				enable = true
			}
		})
	end,
}
