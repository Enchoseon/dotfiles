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
" Custom function to export Markdown files to MLA-formatted PDFs.
" - DEMO FILE: ~/.config/nvim/pandoc/sample-mla.md
command PandocLivePreview call PandocLivePreview()
function PandocMarkdownToMla ()
	let l:command = "Pandoc pdf -f markdown+hard_line_breaks -o /tmp/nvim-pandoc-mla.pdf --pdf-engine=xelatex --template ~/.config/nvim/markdown-to-mla.template --standalone --resource-path .:~/.config/nvim/"
	execute l:command
endfunction
command PandocMarkdownToMla call PandocMarkdownToMla()
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
