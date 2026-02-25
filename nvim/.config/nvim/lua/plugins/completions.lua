return {
	'saghen/blink.cmp',
	event = 'VimEnter',
	version = '1.*',
	dependencies = {
		{ 'L3MON4D3/LuaSnip', version = '2.*'}
	},
	opts = {
		completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = true
				}
			}
		},
		keymap = {
			preset = 'super-tab'
		},
		sources = {
			default = {'lsp', 'path', 'snippets'}
		},
		snippets = {
			preset = 'luasnip'
		},
		cmdline = {
			keymap = {
				['<Tab>'] = {'show', 'accept'}
			},
			completion = { menu = { auto_show = true}}
		}
	}
}
