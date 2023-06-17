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

" netrw: Disable Netrw. Too many bugs :(
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
