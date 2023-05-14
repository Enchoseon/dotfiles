" catpuccin/nvim: Apply colorscheme
colorscheme catppuccin

" psliwka/vim-smoothie: Even smoother animation
let g:smoothie_update_interval = 1

" folke/zen-mode.nvim: Open markdown and todo.txt files in ZenMode
autocmd VimEnter *.md ZenMode
autocmd VimEnter *todo.txt ZenMode
" folke/zen-mode.nvim: Aesthetic tweaks
lua << EOF
	require("zen-mode").setup({
		window = {
			backdrop = 1, -- Keep background color consistent
			options = {
				number = false, -- Hide number column
				relativenumber = false, -- Hide relative numbers
			}
		}
	})
EOF

" nvim-lualine/lualine.nvim: Start Lualine with Fugitive Support
set noshowmode " No longer needed
lua require("lualine").setup({ extensions = { "fugitive" } })
