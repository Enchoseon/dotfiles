" nvim-treesitter/nvim-treesitter: Enable modules
lua << EOF
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			-- Config Files
			"json",
			"json5",
			"yaml",
			-- Web & Node
			"twig",
			"html",
			"javascript",
			"css",
			"typescript",
			-- Markup
			"markdown",
			"markdown_inline",
			"todotxt",
			-- Portable Scripting Languages
			"bash", 
			"lua",
			-- C
			"c",
			-- Git
			"diff",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			-- Help
			"help",
		},
		auto_install = true,
		highlight = { 
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		}
	})
EOF

" nvim-lualine/lualine.nvim: Start Lualine with Fugutive Support
set noshowmode " No longer needed
lua require("lualine").setup({ extensions = { "fugitive" } })
