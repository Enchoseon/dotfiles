" ===========
" Boilerplate
" ===========

" Don"t be vi-compatible
set nocompatible

" Plugins and syntax highlighting
filetype plugin on
filetype indent on
syntax on

" =======
" Plugins
" =======

call plug#begin()
	" === Cache ===
	Plug 'lewis6991/impatient.nvim' " Provides: Cache for slightly faster loading of Lua modules
	" === Aesthetics ===
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " Provides: Catppuccin color scheme
	Plug 'junegunn/goyo.vim' " Provides: Removal of unnecessary UI elements and the addition of margins for readability while writing Markdown
		Plug 'junegunn/limelight.vim' " Provides: Dimming of all lines except ones near your cursor (requires a color scheme to do color-dimming calculations)
	" === Markdown ===
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Provide: Markdown preview in-browser (note: use pre-built if you don't have node nad yarn!)
	Plug 'dkarter/bullets.vim' " Provides: Intuitive bullet-point behavior in Markdown
	Plug 'ellisonleao/glow.nvim' " Provides: A quick in-terminal preview of a markdown file (useful when you just want to read a markdown file without live-preview editing it in a separate window)
	" === Pandoc ===
	Plug 'vim-pandoc/vim-pandoc' " Provides: Integration with pandoc document converter
	" === Coding ===
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Provides: Better highlighting
	Plug 'tpope/vim-fugitive' " Provides: Git integration. Most notable is ':G' for arbitrary git commands
	Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' } " Provides: Fuzzy finder (optional deps: `fd` and `ripgrep`)
		Plug 'nvim-lua/plenary.nvim' " Provides: Function library for Telescope
	" === LSP Zero ===
	" LSP Support
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} 
	Plug 'williamboman/mason-lspconfig.nvim'
	" Autocompletion
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-buffer' " Provides: Completions based on the current file
	Plug 'hrsh7th/cmp-path' " Provides: Completions based on the filesystem
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'hrsh7th/cmp-nvim-lsp'
	" Snippets
	Plug 'L3MON4D3/LuaSnip'
	" LSP Zero
	Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
call plug#end()

" lewis6991/impatient.nvim: Start impatient.nvim
lua require('impatient')

" junegunn/limelight: Start Limelight with Goyo
autocmd! User GoyoEnter Limelight 0.2
autocmd! User GoyoLeave Limelight!

" junegunn/goyo: Increase Goyo"s dimensions
let g:goyo_height="150%"
let g:goyo_width="125"
" junegunn/goyo: Start Goyo automatically when opening a markdown or todo.txt file
autocmd VimEnter *.md Goyo
autocmd VimEnter *todo.txt Goyo
" junegunn/goyo: Quit Neovim on :q if this is the last buffer
" (https://github.com/junegunn/goyo.vim/wiki/Customization#ensure-q-to-quit-even-when-goyo-is-active). Tip: Use ':Goyo' to toggle Goyo without exiting Neovim
function! s:goyo_enter()
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction
function! s:goyo_leave()
	if b:quitting && len(filter(range(1, bufnr("$")), "buflisted(v:val)")) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif
endfunction
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
" junegunn/goyo: Redraw Goyo window when window is resized
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif

" iamcco/markdown-preview: Aesthetic tweaks
let g:mkdp_preview_options = { "disable_filename": 1,  } " Don"t display filename in body
let g:mkdp_theme = "light"
let g:mkdp_page_title = "${name}"

" dkarter/bullets.vim: Only activate in Markdown, Text, and Gitcommit
let g:bullets_enable_in_empty_buffers = 1 " Enable in empty buffers
let g:bullets_enabled_file_types = [ "markdown", "text", "gitcommit" ] " Only enable on Markdown, Text, and Gitcommit

" ellisonleao/glow.nvim: Setup Glow to launch in a larger window
lua << EOF
	require("glow").setup({
		border = "",
		width_ratio = 0.9,
		height_ratio = 0.9,
	})
EOF

" vim-pandoc/vim-pandoc: Set filetype to something MarkdownPreview and Mason will actually detect as Markdown and add ability to execute Pandoc on write and see preview.
autocmd FileType pandoc set filetype=markdown.pandoc " Enable vim-pandoc on Markdown files. Workaround for https://github.com/vim-pandoc/vim-pandoc/issues/34
let g:pandoc#modules#disabled = [ "folding" ] " Disable folding module
function PandocPreview () " Custom function to open a live preview of the current document in Okular. Uses xelatex (dev-texlive/texlive-xetex) to generate the riced PDF.
	let l:command = "Pandoc pdf -o /tmp/vim-pandoc.pdf --pdf-engine=xelatex -H ~/.config/nvim/catppuccin_pandoc.tex --wrap=preserve"
	let g:pandoc#command#autoexec_command = l:command
	let g:pandoc#command#autoexec_on_writes = 1 | execute l:command | :silent !okular "/tmp/vim-pandoc.pdf" &
endfunction
command PandocPreview call PandocPreview()

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

" netrw
let g:netrw_banner = 0 " Hide banner by default (toggle with 'I')
let g:netrw_preview = 1 " Vertical split when previewing files
let g:netrw_liststyle = 3 " Tree-style listing
let g:netrw_winsize = 25 " Shrink netrw to 25% width when previewing a file
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " Hide dotfiles by default (toggle with 'gh')

" ===================
" :W to Write as Sudo
" ===================

" Based on https://vi.stackexchange.com/a/25038
com -bar W exe 'w !pkexec tee >/dev/null %:p:S' | setl nomod

" ===================
" Non-Plugin Autocmds
" ===================

" Start in insert mode at top of file when entering gitcommits
autocmd FileType gitcommit :1 | :startinsert!

" =====================
" Other Neovim Settings
" =====================

" Search Case (In)sensitivity and Highlight
set ignorecase " Ignore casing when searching
set smartcase " Override ignorecase if search pattern contains uppercase chars
set hlsearch " Highlight search (use `:noh` to shut off highlighting until next search)

" Matching Brackets
set showmatch " Jump to matching bracket briefly when inserting one
set matchtime=2 " How long to show the matching bracket (see: showmatch) in 1/10ths of a second

" No Swap/Backup File Spam
set nobackup
set noswapfile

" Auto/Smart Indent and Tab
set smartindent
set smarttab

" Wrap Lines Softly
set linebreak
set wrap

" Line Numbers and Ruler
set number
set relativenumber
set ruler

" Show vertical bar in-between tabs
set listchars=tab:\|\ " Trailing space is intentional
set list

" Better Scrolling
set scrolloff=8 " Leave space between the top/bottom of the screen and the cursor.

" System Integration
set autoread " Read file if changed
set clipboard=unnamedplus " Use system keyboard

