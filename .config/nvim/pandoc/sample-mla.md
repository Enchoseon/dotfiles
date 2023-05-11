---
title: Why Perfecting My Text-Editing Workflow is Better Than Actually Writing Anything
professor: Professor Depressed Divorcee
class: Foo 1234
date: 20 April 2023
firstName: Joe
lastName: Mama
---

Hey there! Run `:PandocMarkdownToMla` to export this markdown file into a MLA-formatted paper with a proper Works Cited page! Note that `mla.sty` must be installed in your TeX Home folder so that bold, italic, and monospace text works (the installation can be done automatically by the bootstrapping script: `yadm bootstrap`).

After writing a lot of boring papers with the same formatting in LibreOffice over-and-over, the pattern-recognition neurons in my monkey brain fired and I had the idea to write my papers in markup in Neovim. I don't need to see the margins of the exported paper as I type, I don't need to see the header, I don't need to see LibreOffice's menubar or toolbar, *I don't need to see anything other than the text I am editing*. I had previously looked into a Vim motion plugin for LibreOffice, but it wasn't very good—vim motions work for an editor with a monospaced text area like a code editor or a split-view thing like Joplin—they don't work very well in a WYSIWYG editor.

Anyways, creating this workflow was quite a process because I had no knowledge about LaTeX or Pandoc when I wanted to pursue it. It was only through experience gained over time that I was able to get my dream workflow. This is it, this is the highest point, it's all downhill from here.

If you need to get an accurate page count, run `PandocMarkdownToMla` followed by `PandocMarkdownToMlaPageCount`. The PDF file itself can be found at `/tmp/nvim-pandoc-mla.pdf`. Adding arguments and stuff to change the output location would simply be overkill, if I did that I might as well learn Lua and make my own plugin, and I don't want to do that.

Extra-special thanks to Ryan Ayckock, Edward Z. Yang, and Teddy Bradford for their MLA package for LaTeX, which has been packaged into my dotfiles with slight modifications to use the system's Times New Roman font rather than an outdated package for a Times-like font. This also fixes bold, italics, and monospace text not displaying. Do note that `mla.sty` **must** be installed in your Tex Home folder! (It is available in `~/.config/yadm/xelatex/mla.sty` if you wish to install it manually.)

\begin{workscited}
	\bibent
	Neil, Drew, \textit{Practical Vim: Edit Text at the Speed of Thought}, The Pragmatic Bookshelf, 2015.
\end{workscited}
