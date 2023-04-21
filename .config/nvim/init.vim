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
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " Provides: Catppuccin color scheme (remember to run `:CatppuccinCompile`!)
	Plug 'junegunn/goyo.vim' " Provides: Removal of unnecessary UI elements and the addition of margins for readability while writing Markdown
		Plug 'junegunn/limelight.vim' " Provides: Dimming of all lines except ones near your cursor (requires a color scheme to do color-dimming calculations)
	Plug 'nvim-lualine/lualine.nvim' " Provides: Status line
		Plug 'nvim-tree/nvim-web-devicons' " Provides: Icons for lualine
	" === Prose ===
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Provide: Markdown preview in-browser (note: use pre-built if you don't have node nad yarn!)
	Plug 'dkarter/bullets.vim' " Provides: Intuitive bullet-point behavior in Markdown
	Plug 'vimwiki/vimwiki' " Provides: The Vimwiki plugin
	Plug 'preservim/vim-pencil' " Provides: Seamless wrapping tweaks and undo points suited for prose (e.g. undo points on punction)
		Plug 'preservim/vim-litecorrect' " Provides: Seamless and minimal auto-correction (e.g. `teh` -> `the`, `Im` -> `I'm`, etc.)
	Plug 'preservim/vim-wordy' " Provides: The `:Wordy` command for detecting words/statements that are weak, weaselly, idiomatic, jargony, etc.
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
	" Spell Check
	Plug 'f3fora/cmp-spell' " Provides: Dictionary completion source based on the built-in spellsuggest
	" Snippets
	Plug 'L3MON4D3/LuaSnip'
	" LSP Zero
	Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
call plug#end()

" lewis6991/impatient.nvim: Start impatient.nvim
lua require('impatient')

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
