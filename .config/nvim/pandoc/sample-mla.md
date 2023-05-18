---
title: Markdown to MLA PDF Demo
professor: Professor Depressed Divorcee
class: Foo 1234
date: 20 April 2023
firstName: Joe
lastName: Mama
---

This is a demo of my Markdown $\to$ MLA-formatted PDF workflow in Neovim! Run `:PandocMarkdownToMla` to export this Markdown file to `/tmp/nvim-pandoc-mla.pdf`, or do `:PandocMarkdownToMlaLivePreview` to open `/tmp/nvim-pandoc-mla.pdf` in your default PDF reader and convert on every write (auto-refreshing is assumed to be done by the PDF reader). The tools used in the conversion are XeLaTeX, Pandoc, Neovim, and [vim-pandoc](https://github.com/vim-pandoc/vim-pandoc).

Need to know the page and word count? Run `:PandocMarkdownToMla` followed by `:MlaPdfStats`. [noice.nvim](https://github.com/folke/noice.nvim) will redirect the console echo output to the [nvim-notify](rcarriga/nvim-notify) notification manager for super-convenient viewing.

Special thanks to Ryan Aycock, Edward Z. Yang, and Teddy Bradford for their MLA package for LaTeX, which has been put into my dotfiles (`.config/yadm/xelatex/mla.sty`) with slight modifications to:
1. Use the system's Times New Roman font rather than an outdated package for a Times-like font, fixing bold, italic, and monospace text—but **only** if `mla.sty` is in the TeX home dir!
2. Provide the `title`, `professor`, `class`, `date`, `firstName`, and `lastName` variables, which can be set through a YAML header. *(Secret bonus variable: `mla.linespread`)*

\begin{workscited}
	\bibent
	Neil, Drew, \textit{Practical Vim: Edit Text at the Speed of Thought}, The Pragmatic Bookshelf, 2015.
\end{workscited}
