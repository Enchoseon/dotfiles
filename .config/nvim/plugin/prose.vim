" iamcco/markdown-preview: Aesthetic tweaks
let g:mkdp_preview_options = { "disable_filename": 1,  } " Don"t display filename in body
let g:mkdp_theme = "light"
let g:mkdp_page_title = "${name}"
let g:mkdp_filetypes = [ "markdown", "vimwiki" ] " Also run on Vimwiki files

" dkarter/bullets.vim: Only activate in Markdown, Text, and Gitcommit
let g:bullets_enable_in_empty_buffers = 1 " Enable in empty buffers
let g:bullets_enabled_file_types = [ "markdown", "text", "gitcommit" ] " Only enable on Markdown, Text, and Gitcommit

" vimwiki/vimwiki: Setup
let g:vimwiki_list = [{"path": "~/Sync/Notes/", "syntax": "markdown", "ext": ".md" }] " Set Vimwiki folder to my Notes folder and use the Markdown extension
let g:vimwiki_global_ext = 0 " Restrict Vimwiki to Notes folder

" preservim/vim-pencil: Launch various prose plugins automatically and use hard wrapping
autocmd FileType markdown,vimwiki call pencil#init({"wrap": "soft"}) | call litecorrect#init()
