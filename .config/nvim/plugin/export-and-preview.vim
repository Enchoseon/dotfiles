" vim-pandoc/vim-pandoc
" === Filetype Fixes & Setup ===
" Disable folding module
let g:pandoc#modules#disabled = [ "folding" ] 
" === Custom Pandoc Functions ===
" Internal function to convert a Markdown file to a PDF with Pandoc using XeLaTeX.
function PandocMultitool (outputPath, pandocArgs, livePreview=0)
	let l:baseCommand = "Pandoc pdf --from markdown+hard_line_breaks+lists_without_preceding_blankline --pdf-engine=xelatex --wrap=preserve --resource-path .:~/.config/nvim/pandoc/"
	let l:command = l:baseCommand .. " --output \"" .. a:outputPath .. "\" " .. a:pandocArgs
	silent exec l:command
  	if a:livePreview
  		silent exec "autocmd BufWritePost * silent exec '" .. l:command .. "'"
		let l:xdgHack = "call jobstart(\"xdg-open '" .. a:outputPath .. "'\")" " HACK: https://bugs.kde.org/show_bug.cgi?id=442721#c10
		call timer_start(3000, { tid -> execute(l:xdgHack)}) " HACK: Delay opening file to avoid opening a non-existent file
	endif
endfunction
" Functions to create a riced PDF
command PandocMarkdownToPdf call PandocMultitool("/tmp/nvim-pandoc.pdf", "-H ~/.config/nvim/pandoc/catppuccin_pandoc.tex")
command PandocMarkdownToPdfLivePreview call PandocMultitool("/tmp/nvim-pandoc.pdf", "-H ~/.config/nvim/pandoc/catppuccin_pandoc.tex", 1)
" Functions to create an MLA-formatted PDF
command PandocMarkdownToMla call PandocMultitool("/tmp/nvim-pandoc-mla.pdf", "--template ~/.config/nvim/pandoc/markdown-to-mla.template")
command PandocMarkdownToMlaLivePreview call PandocMultitool("/tmp/nvim-pandoc-mla.pdf", "--template ~/.config/nvim/pandoc/markdown-to-mla.template", 1)
" Function to count the number of pages in a PDF (https://stackoverflow.com/a/36801253)
function MlaPdfStats (inputPath)
	let l:pageCount = system("pdftotext '" .. a:inputPath .. "' - | grep -c $'\f'")
	let l:wordCount = system("pdftotext '" .. a:inputPath .. "' - | wc -w")
	echo "Page Count: " .. l:pageCount
	echo "Word Count: " .. l:wordCount
endfunction
" Function to get the current page and word count of the last-exported MLA pdf
command MlaPdfStats call MlaPdfStats("/tmp/nvim-pandoc-mla.pdf")

" iamcco/markdown-preview: Aesthetic tweaks
let g:mkdp_preview_options = { "disable_filename": 1,  } " Don"t display filename in body
let g:mkdp_theme = "light" " Let Darkreader handle the theming
let g:mkdp_page_title = "${name}"
let g:mkdp_filetypes = [ "markdown", "vimwiki" ] " Also run on Vimwiki files
