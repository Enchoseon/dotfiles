" nvim-telescope: Setup and load extensions
lua << EOF
	require("telescope").setup{
		defaults = {
			path_display = { "smart" },
			color_devicons = false
		}
	}
	require("telescope").load_extension("undo")
EOF

" ElPiloto/telescope-vimwiki.nvim: Load Telescope extension
lua require("telescope").load_extension("vimwiki")

" stevearc/oil.nvim: Setup Oil.nvim to not show file icons
lua require("oil").setup({ columns={} })

" romgrk/barbar.nvim: Auto-hide when there is only one "tab"
let g:barbar_auto_setup = v:false
lua << EOF
	require("barbar").setup({
		auto_hide = true,
	})
EOF

" netrw: Disable Netrw. Too many bugs :(
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
