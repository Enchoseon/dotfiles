" catpuccin/nvim: Apply colorscheme
colorscheme catppuccin

" psliwka/vim-smoothie: Even smoother animation
let g:smoothie_update_interval = 1

" junegunn/goyo: Increase Goyo"s dimensions
let g:goyo_height="150%"
let g:goyo_width="125"
" junegunn/goyo: Start Goyo automatically when opening a markdown or todo.txt file
autocmd VimEnter *.md Goyo
autocmd VimEnter *todo.txt Goyo
function! s:goyo_enter()
	" junegunn/limelight: Turn on Limelight
	Limelight 0.2
	" nvim-lualine/lualine: Disable Lualine
	lua require('lualine').hide()
	" junegunn/goyo: Quit Neovim on :q if this is the last buffer (https://github.com/junegunn/goyo.vim/wiki/Customization#ensure-q-to-quit-even-when-goyo-is-active)
	" Tip: Use ':Goyo' to toggle Goyo without exiting Neovim
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction
function! s:goyo_leave()
	" junegunn/limelight: Turn off Limelight
	Limelight!
	" nvim-lualine/lualine: Reenable Lualine
	lua require('lualine').hide({unhide=true})
	" junegunn/goyo: Quit Neovim on :q if this is the last buffer (https://github.com/junegunn/goyo.vim/wiki/Customization#ensure-q-to-quit-even-when-goyo-is-active)
	" Tip: Use ':Goyo' to toggle Goyo without exiting Neovim
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
