" ===========
" Boilerplate
" ===========

" Don't be vi-compatible
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
	" Smooth-scrolling. WARNING: Causes lots of redraws!
	Plug 'psliwka/vim-smoothie'
	" Removal of unnecessary UI elements and the addition of margins for readability while writing Markdown
	Plug 'folke/zen-mode.nvim' 
		" Dimming of all lines except ones near your cursor (uses TreeSitter for dimming)
		Plug 'folke/twilight.nvim' 
	" Status line
	Plug 'nvim-lualine/lualine.nvim' 
		" Icons for lualine
		Plug 'nvim-tree/nvim-web-devicons' 
	" Experimental UI replacement for Neovim
	Plug 'folke/noice.nvim'
		" Notification manager
		Plug 'rcarriga/nvim-notify'
		" UI Library for noice
		Plug 'MunifTanjim/nui.nvim'
	" View LSP results in many different & convenient ways
	Plug 'folke/trouble.nvim'
	" === Export & Preview ===
	" Integration with pandoc document converter
	Plug 'vim-pandoc/vim-pandoc' 
	" Markdown preview in-browser (note: use pre-built if you don't have node and yarn!)
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } 
	" === Prose ===
	" Intuitive bullet-point behavior in Markdown
	Plug 'dkarter/bullets.vim'
	" The Vimwiki plugin
	Plug 'vimwiki/vimwiki', { 'for': 'markdown' }
	" Seamless wrapping tweaks and undo points suited for prose (e.g. undo points on punction)
	Plug 'preservim/vim-pencil' 
		" Seamless and minimal auto-correction (e.g. `teh` -> `the`, `Im` -> `I'm`, etc.)
		Plug 'preservim/vim-litecorrect' 
	" The `:Wordy` command for detecting words/statements that are weak, weaselly, idiomatic, jargony, etc.
	Plug 'preservim/vim-wordy', { 'for': 'markdown' }
	" === Coding ===
	" Better highlighting
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
	" Git integration. Most notable is ':G' for arbitrary git commands
	Plug 'tpope/vim-fugitive' 
	" Contextual indentation highlighting
	Plug 'lukas-reineke/indent-blankline.nvim'
	" Set shiftwidth and expandtab automatically per-file
	Plug 'tpope/vim-sleuth'
	" Integrated keymappings to work with surrounding text
	Plug 'tpope/vim-surround'
	" === Navigation ===
	" Fuzzy finder (optional deps: `fd` and `ripgrep`)
	Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' } 
		" Function library for Telescope
		Plug 'nvim-lua/plenary.nvim' 
	" Edit filesystem like a buffer (netrw replacement)
	Plug 'stevearc/oil.nvim'
	" Vimwiki integration with Telescope (:Telescope vimwiki)
	Plug 'ElPiloto/telescope-vimwiki.nvim'
	" Undo tree integration with Telescope (:Telescope undo)
	Plug 'debugloop/telescope-undo.nvim'
	" Extend "%" to language-specific words using TreeSitter
	Plug 'andymass/vim-matchup'
	" Tabline
	Plug 'romgrk/barbar.nvim'
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

" ========
" Mappings
" ========

" === Navigation ===
" nvim-telescope/telescope.nvim: Replace default spell suggest menu with Telescope
map <silent> z= :Telescope spell_suggest theme=cursor<cr>
" ElPiloto/telescope-vimwiki.nvim: Load Telescope extension
" <leader>vw to search filenames
nnoremap <silent> <leader>vw <cmd>lua require("telescope").extensions.vimwiki.vimwiki()<cr>
" <leader>vg to live grep files
nnoremap <silent> <leader>vg <cmd>lua require("telescope").extensions.vimwiki.live_grep()<cr>
" romgrk/barbar.nvim: Keyboard-based navigation
" - Move to previous/next
nnoremap <silent> <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent> <A-.> <Cmd>BufferNext<CR>
" - Re-order to previous/next
nnoremap <silent> <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent> <A->> <Cmd>BufferMoveNext<CR>
" - Goto buffer in position...
nnoremap <silent> <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent> <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent> <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent> <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent> <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent> <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent> <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent> <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent> <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent> <A-0> <Cmd>BufferLast<CR>
" - Pin/unpin buffer
nnoremap <silent> <A-p> <Cmd>BufferPin<CR>
" - Close buffer
nnoremap <silent> <A-c> <Cmd>BufferClose<CR>
" - Restore buffer
nnoremap <silent> <A-s-c> <Cmd>BufferRestore<CR>
" - Sort by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>
" === Non-Plugin ===
" <F4> to open a nobuflisted terminal in a split at the bottom of screen cd'ed to the current file's directory (based on https://vi.stackexchange.com/a/14533)
map <silent> <F4> :let $VIM_DIR=expand('%:p:h')<CR>:bot split<Bar>:exe "resize " . (winheight(0) * 2/5)<Bar>:term<CR>cd $VIM_DIR && clear<CR>
" <F9> to open vertical split to the left with Oil
map <silent> <F9> :vnew<Bar>:exe "vert resize " . (winwidth(0) * 2/5)<Bar>:Oil<CR>
" <Esc> to leave terminal and change window focus
tnoremap <silent> <Esc> <C-\><C-n>:wincmd k<Bar>wincmd l<CR>
" <F4> to leave terminal without changing window focus
tnoremap <silent> <F4> <C-\><C-n>

" ========
" Autocmds
" ========

" === Aesthetics ===
" folke/zen-mode.nvim: Open markdown and todo.txt files in ZenMode
autocmd VimEnter *.md ZenMode
autocmd VimEnter *todo.txt ZenMode
" === Export & Preview ===
" vim-pandoc/vim-pandoc: Enable vim-pandoc on Markdown files (workaround https://github.com/vim-pandoc/vim-pandoc/issues/34)
autocmd FileType pandoc set filetype=markdown.pandoc 
" === Prose ===
" preservim/vim-pencil: Launch various prose plugins automatically and use hard wrapping
autocmd FileType markdown,vimwiki call pencil#init({"wrap": "soft"}) | call litecorrect#init()
" === Non-Plugin ===
" Start in insert mode at top of file when entering gitcommits
autocmd FileType gitcommit :1 | :startinsert!
" Go into insert mode when entering terminal window
autocmd BufWinEnter,WinEnter term://* startinsert
" When opening terminal enter insert mode, hide from tabline, & hide line numbers
autocmd TermOpen * startinsert | setlocal nobuflisted | setlocal nonumber | setlocal norelativenumber
" Go into normal mode when exiting terminal window
autocmd BufLeave term://* stopinsert
" HACK: Delete the buffers of finished terminals (source: https://github.com/neovim/neovim/issues/14986#issuecomment-902705190)
autocmd TermClose * execute "bdelete! " . expand("<abuf>")

" ====
" Misc
" ====

" :W to Write as Sudo
" Based on https://vi.stackexchange.com/a/25038
com -bar W exe 'w !pkexec tee >/dev/null %:p:S' | setl nomod

" Create Undo File Directory
" https://vi.stackexchange.com/a/53
if !isdirectory($HOME."/.cache/nvim/undo")
	call mkdir($HOME."/.cache/nvim/undo", "p", 0700)
endif

" ========
" Settings
" ========

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

" Better Scrolling
set scrolloff=8 " Leave space between the top/bottom of the screen and the cursor.

" System Integration
set autoread " Read file if changed
set clipboard=unnamedplus " Use system keyboard
set shell=/bin/zsh " Use zsh instead of bash in :terminal

" Save undo files ~/.cache/nvim/undo
set undodir=~/.cache/nvim/undo
set undofile
