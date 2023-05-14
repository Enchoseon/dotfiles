" vim-pandoc/vim-pandoc
" === Filetype Fixes & Setup ===
" Enable vim-pandoc on Markdown files. Workaround for https://github.com/vim-pandoc/vim-pandoc/issues/34
autocmd FileType pandoc set filetype=markdown.pandoc 
" Disable folding module
let g:pandoc#modules#disabled = [ "folding" ] 
" === Custom Pandoc Functions ===
" - NOTE: xelatex (dev-texlive/texlive-xetex) is used to generate the PDFs!
" Custom function to open a live preview of the current document in Okular. 
function PandocPDFPreview () 
	let l:command = "Pandoc pdf -o /tmp/nvim-pandoc.pdf --pdf-engine=xelatex -H ~/.config/nvim/pandoc/catppuccin_pandoc.tex --wrap=preserve"
	silent exec l:command
	exec "autocmd BufWritePost * silent exec '" .. l:command .. "'"
	silent exec "!sleep 1; okular '/tmp/nvim-pandoc.pdf' &"
endfunction
" Custom function to export Markdown files to MLA-formatted PDFs (DEMO FILE: ~/.config/nvim/pandoc/sample-mla.md)
command PandocPDFPreview call PandocPDFPreview()
function PandocMarkdownToMla (preview=0)
	let l:command = "Pandoc pdf -f markdown+hard_line_breaks -o /tmp/nvim-pandoc-mla.pdf --pdf-engine=xelatex --template ~/.config/nvim/pandoc/markdown-to-mla.template --standalone --resource-path .:~/.config/nvim/pandoc/"
	silent exec l:command
	if a:preview
		exec "autocmd BufWritePost * silent exec '" .. l:command .. "'"
		silent exec "!sleep 1; okular '/tmp/nvim-pandoc-mla.pdf' &"
	endif
endfunction
command PandocMarkdownToMla call PandocMarkdownToMla()
command PandocMarkdownToMlaPreview call PandocMarkdownToMla(1)
" Custom function to count number of paged in exported Mla-formatted PDF (https://stackoverflow.com/a/36801253)
function PandocMarkdownToMlaPageCount ()
	let l:command = "!pdftotext /tmp/nvim-pandoc-mla.pdf - | grep -c $'\f'"
	execute l:command
endfunction
command PandocMarkdownToMlaPageCount call PandocMarkdownToMlaPageCount()

" iamcco/markdown-preview: Aesthetic tweaks
let g:mkdp_preview_options = { "disable_filename": 1,  } " Don"t display filename in body
let g:mkdp_theme = "light"
let g:mkdp_page_title = "${name}"
let g:mkdp_filetypes = [ "markdown", "vimwiki" ] " Also run on Vimwiki files
