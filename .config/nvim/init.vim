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
	" Cache for slightly faster loading of Lua modules
	Plug 'lewis6991/impatient.nvim' 
	" === Aesthetics ===
	" Catppuccin color scheme (remember to run `:CatppuccinCompile`!)
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' } 
	" === Export & Preview ===
	" Integration with pandoc document converter
	Plug 'vim-pandoc/vim-pandoc' 
	" Markdown preview in-browser (note: use pre-built if you don't have node and yarn!)
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } 
	" === Prose ===
	" Removal of unnecessary UI elements and the addition of margins for readability while writing Markdown
	Plug 'junegunn/goyo.vim' 
		" Dimming of all lines except ones near your cursor (requires a color scheme to do color-dimming calculations)
		Plug 'junegunn/limelight.vim' 
	" Intuitive bullet-point behavior in Markdown
	Plug 'dkarter/bullets.vim' 
	" The Vimwiki plugin
	Plug 'vimwiki/vimwiki' 
	" Seamless wrapping tweaks and undo points suited for prose (e.g. undo points on punction)
	Plug 'preservim/vim-pencil' 
		" Seamless and minimal auto-correction (e.g. `teh` -> `the`, `Im` -> `I'm`, etc.)
		Plug 'preservim/vim-litecorrect' 
	" The `:Wordy` command for detecting words/statements that are weak, weaselly, idiomatic, jargony, etc.
	Plug 'preservim/vim-wordy' 
	" === Coding ===
	" Better highlighting
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
	" Git integration. Most notable is ':G' for arbitrary git commands
	Plug 'tpope/vim-fugitive' 
	" Status line
	Plug 'nvim-lualine/lualine.nvim' 
		" Icons for lualine
		Plug 'nvim-tree/nvim-web-devicons' 
	" === Navigation ===
	" Fuzzy finder (optional deps: `fd` and `ripgrep`)
	Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' } 
		" Function library for Telescope
		Plug 'nvim-lua/plenary.nvim' 
	" Ranger integration with Neovim (do `<Leader>f`!)
	Plug 'francoiscabrol/ranger.vim'
		" Tiny plugin to delete a buffer without closing the window
		Plug 'rbgrouleff/bclose.vim'
	" === LSP Zero ===
	" == LSP Support ==
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
	Plug 'williamboman/mason-lspconfig.nvim'
	" == Autocompletion ==
	Plug 'hrsh7th/nvim-cmp'
	" Completions based on the current file
	Plug 'hrsh7th/cmp-buffer' 
	" Completions based on the filesystem
	Plug 'hrsh7th/cmp-path' 
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'hrsh7th/cmp-nvim-lsp'
	" == Snippets ==
	Plug 'L3MON4D3/LuaSnip'
	" Dictionary completion source based on the built-in spellsuggest
	Plug 'f3fora/cmp-spell' 
	" == LSP Zero ==
	Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
call plug#end()

" lewis6991/impatient.nvim: Start impatient.nvim
lua require('impatient')

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
