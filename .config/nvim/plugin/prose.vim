" dkarter/bullets.vim: Only activate in Markdown, Text, and Gitcommit
let g:bullets_enable_in_empty_buffers = 1 " Enable in empty buffers
let g:bullets_enabled_file_types = [ "markdown", "text", "gitcommit" ] " Only enable on Markdown, Text, and Gitcommit

" vimwiki/vimwiki: Setup
let g:vimwiki_list = [{"path": "~/Sync/Notes/", "syntax": "markdown", "ext": ".md", "html_filename_parameterization": 0 }] " Set Vimwiki folder to my Notes folder and use the Markdown extension
let g:vimwiki_global_ext = 0 " Restrict Vimwiki to Notes folder
let g:vimwiki_custom_wiki2html=$HOME."/.config/nvim/pandoc/vimwiki_converter.sh" " Export Markdown syntax

" preservim/vim-pencil: Launch various prose plugins automatically and use hard wrapping
autocmd FileType markdown,vimwiki call pencil#init({"wrap": "soft"}) | call litecorrect#init()

" rhysd/vim-grammarous: Launch automatically when editing markdown, text, or gitcommit files
let g:grammarous#jar_url = "https://www.languagetool.org/download/LanguageTool-5.9.zip" " LanguageTool version 6 is incompatible with rhysd/vim-grammarous (https://github.com/rhysd/vim-grammarous/issues/110)
