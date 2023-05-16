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
		},
	})
EOF

" folke/twilight.nvim: Exclude Markdown from dimming (only looks good with code)
lua require("twilight").setup({ exclude = { "markdown", "vimwiki" } })

" nvim-lualine/lualine.nvim: Setup Lualine with Fugitive support
lua require("lualine").setup({ extensions = { "fugitive" } })

" folke/noice.nvim: Setup
lua vim.notify = require("noice").setup()

" rcarriga/nvim-notify: Load Telescope extension
lua require("telescope").load_extension("notify") 
