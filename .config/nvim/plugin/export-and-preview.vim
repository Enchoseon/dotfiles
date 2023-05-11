" vim-pandoc/vim-pandoc
" === Filetype Fixes & Setup ===
" Enable vim-pandoc on Markdown files. Workaround for https://github.com/vim-pandoc/vim-pandoc/issues/34
autocmd FileType pandoc set filetype=markdown.pandoc 
" Disable folding module
let g:pandoc#modules#disabled = [ "folding" ] 
" === Custom Pandoc Functions ===
" - NOTE: xelatex (dev-texlive/texlive-xetex) is used to generate the PDFs!
" Custom function to open a live preview of the current document in Okular. 
" - I never use this. Markdown-Preview.nvim is more convenient for live
"   preview, my custom Wiki2Html is more convenient for exporting my notes
"   into a portable format I can view without launching Neovim (plus I get to
"   use KaTeX, which means less LaTeX boilerplate), and PandocMarkdownToMla
"   satisfies 99% of my exporting needs alongside Pandoc.nvim.
function PandocLivePDFPreview () 
	let l:command = "Pandoc pdf -o /tmp/nvim-pandoc.pdf --pdf-engine=xelatex -H ~/.config/nvim/pandoc/catppuccin_pandoc.tex --wrap=preserve"
	let g:pandoc#command#autoexec_command = l:command
	let g:pandoc#command#autoexec_on_writes = 1 | execute l:command | :silent !okular "/tmp/nvim-pandoc.pdf" &
endfunction
command PandocPreview call PandocPreview()

" iamcco/markdown-preview: Aesthetic tweaks
let g:mkdp_preview_options = { "disable_filename": 1,  } " Don"t display filename in body
let g:mkdp_theme = "light"
let g:mkdp_page_title = "${name}"
let g:mkdp_filetypes = [ "markdown", "vimwiki" ] " Also run on Vimwiki files
