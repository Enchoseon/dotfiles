" nvim-telescope: Setup and load extensions
lua << EOF
	require("telescope").setup{
		defaults = {
			path_display = "smart",
			color_devicons = false
		}
	}
	require("telescope").load_extension("vimwiki")
	require("telescope").load_extension("undo")
EOF

" ElPiloto/telescope-vimwiki.nvim: Mappings
" <leader>vw to search filenames
nnoremap <leader>vw <cmd>lua require("telescope").extensions.vimwiki.vimwiki()<cr>
" <leader>vg to live grep files
nnoremap <leader>vg <cmd>lua require("telescope").extensions.vimwiki.live_grep()<cr>

" francoiscabrol/ranger.vim: Override netrw
let g:ranger_replace_netrw = 1

" netrw: I still use netrw sometimes
let g:netrw_banner = 0 " Hide banner by default (toggle with 'I')
let g:netrw_preview = 1 " Vertical split when previewing files
let g:netrw_liststyle = 3 " Tree-style listing
let g:netrw_winsize = 25 " Shrink netrw to 25% width when previewing a file
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " Hide dotfiles by default (toggle with 'gh')
