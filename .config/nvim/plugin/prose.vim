" dkarter/bullets.vim: Only activate in Markdown, Text, and Gitcommit
let g:bullets_enable_in_empty_buffers = 1 " Enable in empty buffers
let g:bullets_enabled_file_types = [ "markdown", "text", "gitcommit" ] " Only enable on Markdown, Text, and Gitcommit

" vimwiki/vimwiki: Setup
let g:vimwiki_list = [{"path": "~/Sync/Notes/", "syntax": "markdown", "ext": ".md", "html_filename_parameterization": 0 }] " Set Vimwiki folder to my Notes folder and use the Markdown extension
let g:vimwiki_global_ext = 0 " Restrict Vimwiki to Notes folder
let g:vimwiki_custom_wiki2html=$HOME."/.config/nvim/pandoc/vimwiki_converter.sh" " Export Markdown syntax
