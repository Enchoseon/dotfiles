" f3fora/cmp-spell: Add cmp dictionary source
lua <<EOF
require("cmp").setup({
	sources = {
		{
			name = "spell",
			option = {
				keep_all_entries = false,
				enable_in_context = function()
				return true
				end,
			},
		},
	},
})
EOF

" VonHeikemen/lsp-zero.nvim: Setup LSP zero
lua <<EOF
	local lsp = require("lsp-zero").preset({
		manage_nvim_cmp = {
			set_sources = "recommended"
		}
	})
	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({buffer = bufnr})
	end)
	require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
	lsp.setup()
EOF
