local map = function(keys, func, desc, mode, buf)
	mode = mode or "n"
	buf = buf or false
	vim.keymap.set(mode, keys, func, { buffer = buf, desc = desc or "Default" })
end

-- Remappings
map("<Esc>", "<cmd>nohlsearch<CR>")
map(";", ":")
map(":", ";")
map("<leader><Up>", "<C-w><C-k>", "Move window up")
map("<leader><Down>", "<C-w><C-j>", "Move window down")
map("<leader><Left>", "<C-w><C-h>", "Move window left")
map("<leader><Right>", "<C-w><C-l>", "Move window right")

-- NeoTree
map("<leader>b", ":Neotree filesystem toggle<CR>", "Toggle filetree")

-- Telescope
local builtin = require("telescope.builtin")
map("<C-p>", builtin.find_files, "Telescope find files")
map("<leader>f", builtin.live_grep, "Telescope live grep")
map("<leader>hf", function() builtin.live_grep({ additional_args = {"--hidden"}}) end, "Live Grep hidden files")
map("<C-.>", builtin.oldfiles, "[S]earch Recent files")
map("<C-f>", builtin.grep_string, "Search current word", { "n", "v" })

-- LSP Key bindings
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		-- LSP Key bindings
		map("grn", vim.lsp.buf.rename, "[R]e[n]ame", nil, event.buf)

		map("ga", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" }, event.buf)

		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration", nil, event.buf)

		map("K", vim.lsp.buf.hover, "Show hover", nil, event.buf)

		map("<leader>lf", vim.lsp.buf.format, "[L]anguage [F]ormat", nil, event.buf)

		--Telescope LSP
		map("grr", builtin.lsp_references, "[G]oto [R]eferences", nil, event.buf)

		map("gri", builtin.lsp_implementations, "[G]oto [I]mplementation", nil, event.buf)

		map("<C-o>", builtin.lsp_document_symbols, "Open Document Symbols", nil, event.buf)
	end,
})
