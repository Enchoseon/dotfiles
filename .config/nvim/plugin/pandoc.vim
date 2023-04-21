" vim-pandoc/vim-pandoc: Set filetype to something MarkdownPreview and Mason will actually detect as Markdown and add ability to execute Pandoc on write and see preview.
autocmd FileType pandoc set filetype=markdown.pandoc " Enable vim-pandoc on Markdown files. Workaround for https://github.com/vim-pandoc/vim-pandoc/issues/34
let g:pandoc#modules#disabled = [ "folding" ] " Disable folding module
function PandocPreview () " Custom function to open a live preview of the current document in Okular. Uses xelatex (dev-texlive/texlive-xetex) to generate the riced PDF.
	let l:command = "Pandoc pdf -o /tmp/vim-pandoc.pdf --pdf-engine=xelatex -H ~/.config/nvim/catppuccin_pandoc.tex --wrap=preserve"
	let g:pandoc#command#autoexec_command = l:command
	let g:pandoc#command#autoexec_on_writes = 1 | execute l:command | :silent !okular "/tmp/vim-pandoc.pdf" &
endfunction
command PandocPreview call PandocPreview()
