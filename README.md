<div align="center">
	<h1>Encho's Dotfiles</h1>
	<p>Prose and code at the speed of thought.</p>
	<em><strong>REMINDER: CAVEAT EMPTOR</strong></em>
</div>

# Installation

## Semi-Automatic

Using [Yadm](https://yadm.io) *(note: this will overwrite any existing dotfiles that are in the way)*:
```bash
yadm clone https://github.com/Enchoseon/dotfiles --no-bootstrap
yadm checkout ~
yadm bootstrap
```

> Bootstrap Script Location: `.config/yadm/bootstrap`

The bootstrap script is an additional bash file that can be ran after cloning the dotfiles (`yadm bootstrap`). It interactively walks the user through things that couldn't be done by a simple clone (e.g. copying Firefox userChrome.css to active profile).

These are the steps it walks through:
1. Install [Arkenfox](https://github.com/arkenfox/user.js) + user-overrides.js
2. Install [Cascade](https://github.com/andreasgrafen/cascade) + userChrome.css
3. Update/Install all Zsh Plugins ([powerlevel10k](https://github.com/romkatv/powerlevel10k) + [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) + [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) + [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting))
4. Update/Install [topydo](https://github.com/topydo/topydo) + [auto editor](https://github.com/WyattBlue/auto-editor) + [whoogle](https://github.com/benbusby/whoogle-search#pip) into a Python virtual environment in `~/Scripts` (aliases are already set up in `~/.zshrc`)
5. Update/Install Neovim Plugins using Vim Plug (Vim Plug is assumed to already be installed)
6. Install [mla.sty](https://github.com/Enchoseon/dotfiles/#mla-paper) into TeX home directory

## Manual

The safer alternative—in case you aren't me—is to copy-and-paste only what you want into your own dotfiles and push those changes to your own repo in order to perpetuate their endless cycle of aimless and mundane existence in the dotfile ecosystem.

I spend most of my time in Neovim and Firefox, so most of the interesting stuff is in [`.config/nvim/`](https://github.com/Enchoseon/dotfiles/tree/master/.config/nvim) and [`.config/yadm/firefox/`](https://github.com/Enchoseon/dotfiles/tree/master/.config/yadm/firefox). You may want to manually copy over the `.config/yadm/` folder to use some of its convenience features as well. Most of the files needed for the bootstrap script to function are contained within `.config/yadm` and the folder can be safely deleted after bootstrapping.

Be careful about copying over things at random. For example, copying over my git config without understanding it could mean breaking cloning from GitHub if you don't have SSH keys set up. This isn't a serious problem, removing the lines from the config file will restore everything, but I can't guarantee that every problem will be as easy or reversible.

# Ricing

![Screenshot of my desktop with an impractical number of windows open to showcase my tiling setup](./.config/yadm/images/01.webp)

As you can see, my desktop isn't that complicated, which is kinda the point. It's so not-complicated that uploading my human-unreadable KDE and KWin config would've been more complicated than just making this list:
1. **Desktop Environment**: KDE
2. **Window Manager:** KWin + Bismuth
3. **Global Theme:**
	- **Plasma & Application Style:** Breeze
	- **Colors:** Catppuccin Mocha
	- **Window Decorations:** Bismuth
	- **Fonts:**
		- **General / Small / Toolbar / Menu / Window Title:** Noto Sans
		- **Fixed Width:** JetBrainsMono Nerd Font Mono
	- **Icons:** Tela (Dark)
	- **Cursors:** Adwaita
	- **Splash Screen:** None
4. **Wallpaper:** `#1e1e2e`

# The Big Picture

I use a lot of different tools in my day-to-day life that don't even have dotfiles to store here. Think of this list as my "meta-dotfiles".

- **Lecture and Notes**: [Neovim](https://github.com/neovim/neovim) + [Syncthing](https://github.com/syncthing/syncthing) + [Markor](https://github.com/gsantner/markor)
- **Flashcards**: [Anki](https://github.com/ankitects/anki) + [Ankidroid](https://github.com/ankidroid/Anki-Android)
- **Lecture Videos**: [Auto Editor](https://auto-editor.com/)
- **Writing**: [LibreOffice Writer (Suite)](https://github.com/libreoffice)
- **Spell & Grammer Check**: [LanguageTool](https://github.com/languagetool-org/languagetool)
- **Metasearch**: [SearXng](https://github.com/searxng/searxng)
- **Music**: [Cmus](https://github.com/cmus/cmus) + [Nicotine+](https://github.com/nicotine-plus/nicotine-plus)
- **To-do List**: [Todo.txt](https://github.com/todotxt/todo.txt) + [Simpletask](https://github.com/mpcjanssen/simpletask-android)
- **Email**: [Claws Mail](https://git.claws-mail.org/)
- **Pomodoro**: [Potato Redux](https://github.com/Enchoseon/potato-redux)
- **Ad-Blocking**: [uBlock Origin](https://github.com/gorhill/uBlock) + [hBlock](https://github.com/hectorm/hblock)
- **Multi-Button Mouse**: [Piper](https://github.com/libratbag/piper) + KDE Keyboard Daemon (it's just a GUI for [x11-misc/xkeyboard-config](https://packages.gentoo.org/packages/x11-misc/xkeyboard-config))

*See my (even more) opinionated [blog post](https://enchoseon.com/productivity-tools) explaining how and why I use these tools in excruciating detail.*

# Licenses & Redistribution

This repository stores and redistributes some binaries/scripts (e.g. every zsh plugin I use) so that bootstrapping is just a simple and reproducible clone. Many of these binaries/scripts haven't been updated in 2 years (and hopefully shouldn't need to be!) However, a convenient way to update all of them is currently lacking.

## Zsh

### [Catppuccin for zsh-syntax-highlighting](https://github.com/catppuccin/zsh-syntax-highlighting)

- Location: `.config/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh`
- LICENSE: [MIT License](https://github.com/catppuccin/zsh-syntax-highlighting/blob/main/LICENSE)

```
MIT License

Copyright (c) 2021 Catppuccin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

- Location: `.config/.zsh/zsh-autosuggestions/*`
- LICENSE: [MIT License](https://github.com/zsh-users/zsh-autosuggestions/blob/master/LICENSE)

```
Copyright (c) 2013 Thiago de Arruda
Copyright (c) 2016-2021 Eric Freese

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
```

### [Zsh History Substring Search](https://github.com/zsh-users/zsh-history-substring-search)

- Location: `.config/.zsh/zsh-history-substring-search/*`
- LICENSE: [BSD-3-Clause License](https://github.com/zsh-users/zsh-history-substring-search/blob/master/zsh-history-substring-search.zsh)

```
Copyright (c) 2009 Peter Stephenson
Copyright (c) 2011 Guido van Steen
Copyright (c) 2011 Suraj N. Kurapati
Copyright (c) 2011 Sorin Ionescu
Copyright (c) 2011 Vincent Guerci
Copyright (c) 2016 Geza Lore
Copyright (c) 2017 Bengt Brodersen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

 * Redistributions in binary form must reproduce the above
   copyright notice, this list of conditions and the following
   disclaimer in the documentation and/or other materials provided
   with the distribution.

 * Neither the name of the FIZSH nor the names of its contributors
   may be used to endorse or promote products derived from this
   software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
```

### [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

- Location: `.config/.zsh/zsh-syntax-highlighting/*`
- LICENSE: [BSD-3-Clause License](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/COPYING.md)

```
Copyright (c) 2010-2020 zsh-syntax-highlighting contributors All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    Neither the name of the zsh-syntax-highlighting contributors nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

### [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

- Location: `.config/.zsh/powerlevel10k/*`
- LICENSE: [MIT License](https://github.com/romkatv/powerlevel10k/blob/master/LICENSE)

```
Copyright (c) 2009-2014 Robby Russell and contributors (see https://github.com/robbyrussell/oh-my-zsh/contributors)
Copyright (c) 2014-2017 Ben Hilburn <bhilburn@gmail.com>
Copyright (c) 2019 Roman Perepelitsa <roman.perepelitsa@gmail.com> and contributors (see https://github.com/romkatv/powerlevel10k/contributors)

MIT LICENSE

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

## Firefox

### [Arkenfox User.js](https://github.com/arkenfox/user.js)

- Location: `.config/yadm/firefox/user.js/*`
- LICENSE: [MIT License](https://github.com/arkenfox/user.js/blob/master/LICENSE.txt)

```
MIT License

Copyright (c) 2020 arkenfox

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### [Cascade](https://github.com/andreasgrafen/cascade)

- Location: `.config/yadm/firefox/chrome/*`
- LICENSE: [MIT License](https://github.com/andreasgrafen/cascade/blob/main/LICENSE)

```
MIT License

Copyright (c) 2022 Andreas Grafen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## LaTeX

### [mla-paper](https://ctan.org/pkg/mla-paper)

- Location: `.config/yadm/xelatex/mla.sty`
- LICENSE: [LPPL 1.3c](https://ctan.org/license/lppl1.3c)

```
The LaTeX Project Public License

LPPL Version 1.3c 2008-05-04

Copyright 1999 2002-2008 LaTeX3 Project

Everyone is allowed to distribute verbatim copies of this license document, but modification of it is not allowed.
PREAMBLE

The LaTeX Project Public License (LPPL) is the primary license under which the LaTeX kernel and the base LaTeX packages are distributed.

You may use this license for any work of which you hold the copyright and which you wish to distribute. This license may be particularly suitable if your work is TeX-related (such as a LaTeX package), but it is written in such a way that you can use it even if your work is unrelated to TeX.

The section “WHETHER AND HOW TO DISTRIBUTE WORKS UNDER THIS LICENSE”, below, gives instructions, examples, and recommendations for authors who are considering distributing their works under this license.

This license gives conditions under which a work may be distributed and modified, as well as conditions under which modified versions of that work may be distributed.

We, the LaTeX3 Project, believe that the conditions below give you the freedom to make and distribute modified versions of your work that conform with whatever technical specifications you wish while maintaining the availability, integrity, and reliability of that work. If you do not see how to achieve your goal while meeting these conditions, then read the document “cfgguide.tex” and “modguide.tex” in the base LaTeX distribution for suggestions.
DEFINITIONS

In this license document the following terms are used:

“Work”
    Any work being distributed under this License. 
“Derived Work”
    Any work that under any applicable law is derived from the Work. 
“Modification”
    Any procedure that produces a Derived Work under any applicable law – for example, the production of a file containing an original file associated with the Work or a significant portion of such a file, either verbatim or with modifications and/or translated into another language. 
“Modify”
    To apply any procedure that produces a Derived Work under any applicable law. 
“Distribution”
    Making copies of the Work available from one person to another, in whole or in part. Distribution includes (but is not limited to) making any electronic components of the Work accessible by file transfer protocols such as FTP or HTTP or by shared file systems such as Sun's Network File System (NFS). 
“Compiled Work”
    A version of the Work that has been processed into a form where it is directly usable on a computer system. This processing may include using installation facilities provided by the Work, transformations of the Work, copying of components of the Work, or other activities. Note that modification of any installation facilities provided by the Work constitutes modification of the Work. 
“Current Maintainer”
    A person or persons nominated as such within the Work. If there is no such explicit nomination then it is the “Copyright Holder” under any applicable law. 
“Base Interpreter”
    A program or process that is normally needed for running or interpreting a part or the whole of the Work.

    A Base Interpreter may depend on external components but these are not considered part of the Base Interpreter provided that each external component clearly identifies itself whenever it is used interactively. Unless explicitly specified when applying the license to the Work, the only applicable Base Interpreter is a “LaTeX-Format” or in the case of files belonging to the “LaTeX-format” a program implementing the “TeX language”.

CONDITIONS ON DISTRIBUTION AND MODIFICATION

    Activities other than distribution and/or modification of the Work are not covered by this license; they are outside its scope. In particular, the act of running the Work is not restricted and no requirements are made concerning any offers of support for the Work.
    You may distribute a complete, unmodified copy of the Work as you received it. Distribution of only part of the Work is considered modification of the Work, and no right to distribute such a Derived Work may be assumed under the terms of this clause.
    You may distribute a Compiled Work that has been generated from a complete, unmodified copy of the Work as distributed under Clause 2 above, as long as that Compiled Work is distributed in such a way that the recipients may install the Compiled Work on their system exactly as it would have been installed if they generated a Compiled Work directly from the Work.
    If you are the Current Maintainer of the Work, you may, without restriction, modify the Work, thus creating a Derived Work. You may also distribute the Derived Work without restriction, including Compiled Works generated from the Derived Work. Derived Works distributed in this manner by the Current Maintainer are considered to be updated versions of the Work.
    If you are not the Current Maintainer of the Work, you may modify your copy of the Work, thus creating a Derived Work based on the Work, and compile this Derived Work, thus creating a Compiled Work based on the Derived Work.
    If you are not the Current Maintainer of the Work, you may distribute a Derived Work provided the following conditions are met for every component of the Work unless that component clearly states in the copyright notice that it is exempt from that condition. Only the Current Maintainer is allowed to add such statements of exemption to a component of the Work.
        If a component of this Derived Work can be a direct replacement for a component of the Work when that component is used with the Base Interpreter, then, wherever this component of the Work identifies itself to the user when used interactively with that Base Interpreter, the replacement component of this Derived Work clearly and unambiguously identifies itself as a modified version of this component to the user when used interactively with that Base Interpreter.
        Every component of the Derived Work contains prominent notices detailing the nature of the changes to that component, or a prominent reference to another file that is distributed as part of the Derived Work and that contains a complete and accurate log of the changes.
        No information in the Derived Work implies that any persons, including (but not limited to) the authors of the original version of the Work, provide any support, including (but not limited to) the reporting and handling of errors, to recipients of the Derived Work unless those persons have stated explicitly that they do provide such support for the Derived Work.
        You distribute at least one of the following with the Derived Work:
            A complete, unmodified copy of the Work; if your distribution of a modified component is made by offering access to copy the modified component from a designated place, then offering equivalent access to copy the Work from the same or some similar place meets this condition, even though third parties are not compelled to copy the Work along with the modified component;
            Information that is sufficient to obtain a complete, unmodified copy of the Work.
    If you are not the Current Maintainer of the Work, you may distribute a Compiled Work generated from a Derived Work, as long as the Derived Work is distributed to all recipients of the Compiled Work, and as long as the conditions of Clause 6, above, are met with regard to the Derived Work.
    The conditions above are not intended to prohibit, and hence do not apply to, the modification, by any method, of any component so that it becomes identical to an updated version of that component of the Work as it is distributed by the Current Maintainer under Clause 4, above.
    Distribution of the Work or any Derived Work in an alternative format, where the Work or that Derived Work (in whole or in part) is then produced by applying some process to that format, does not relax or nullify any sections of this license as they pertain to the results of applying that process.
        A Derived Work may be distributed under a different license provided that license itself honors the conditions listed in Clause 6 above, in regard to the Work, though it does not have to honor the rest of the conditions in this license.
        If a Derived Work is distributed under a different license, that Derived Work must provide sufficient documentation as part of itself to allow each recipient of that Derived Work to honor the restrictions in Clause 6 above, concerning changes from the Work.
    This license places no restrictions on works that are unrelated to the Work, nor does this license place any restrictions on aggregating such works with the Work by any means.
    Nothing in this license is intended to, or may be used to, prevent complete compliance by all parties with all applicable laws.

NO WARRANTY

There is no warranty for the Work. Except when otherwise stated in writing, the Copyright Holder provides the Work “as is”, without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The entire risk as to the quality and performance of the Work is with you. Should the Work prove defective, you assume the cost of all necessary servicing, repair, or correction.

In no event unless required by applicable law or agreed to in writing will The Copyright Holder, or any author named in the components of the Work, or any other party who may distribute and/or modify the Work as permitted above, be liable to you for damages, including any general, special, incidental or consequential damages arising out of any use of the Work or out of inability to use the Work (including, but not limited to, loss of data, data being rendered inaccurate, or losses sustained by anyone as a result of any failure of the Work to operate with any other programs), even if the Copyright Holder or said author or said other party has been advised of the possibility of such damages.
MAINTENANCE OF THE WORK

The Work has the status “author-maintained” if the Copyright Holder explicitly and prominently states near the primary copyright notice in the Work that the Work can only be maintained by the Copyright Holder or simply that it is “author-maintained”.

The Work has the status “maintained” if there is a Current Maintainer who has indicated in the Work that they are willing to receive error reports for the Work (for example, by supplying a valid e-mail address). It is not required for the Current Maintainer to acknowledge or act upon these error reports.

The Work changes from status “maintained” to “unmaintained” if there is no Current Maintainer, or the person stated to be Current Maintainer of the work cannot be reached through the indicated means of communication for a period of six months, and there are no other significant signs of active maintenance.

You can become the Current Maintainer of the Work by agreement with any existing Current Maintainer to take over this role.

If the Work is unmaintained, you can become the Current Maintainer of the Work through the following steps:

    Make a reasonable attempt to trace the Current Maintainer (and the Copyright Holder, if the two differ) through the means of an Internet or similar search.
    If this search is successful, then enquire whether the Work is still maintained.
        If it is being maintained, then ask the Current Maintainer to update their communication data within one month.
        If the search is unsuccessful or no action to resume active maintenance is taken by the Current Maintainer, then announce within the pertinent community your intention to take over maintenance. (If the Work is a LaTeX work, this could be done, for example, by posting to comp.text.tex.)
        If the Current Maintainer is reachable and agrees to pass maintenance of the Work to you, then this takes effect immediately upon announcement.
        If the Current Maintainer is not reachable and the Copyright Holder agrees that maintenance of the Work be passed to you, then this takes effect immediately upon announcement.
    If you make an “intention announcement” as described in 2b. above and after three months your intention is challenged neither by the Current Maintainer nor by the Copyright Holder nor by other people, then you may arrange for the Work to be changed so as to name you as the (new) Current Maintainer.
    If the previously unreachable Current Maintainer becomes reachable once more within three months of a change completed under the terms of 3b) or 4), then that Current Maintainer must become or remain the Current Maintainer upon request provided they then update their communication data within one month.

A change in the Current Maintainer does not, of itself, alter the fact that the Work is distributed under the LPPL license.

If you become the Current Maintainer of the Work, you should immediately provide, within the Work, a prominent and unambiguous statement of your status as Current Maintainer. You should also announce your new status to the same pertinent community as in 2b) above.
WHETHER AND HOW TO DISTRIBUTE WORKS UNDER THIS LICENSE

This section contains important instructions, examples, and recommendations for authors who are considering distributing their works under this license. These authors are addressed as “you” in this section.
Choosing This License or Another License

If for any part of your work you want or need to use *distribution* conditions that differ significantly from those in this license, then do not refer to this license anywhere in your work but, instead, distribute your work under a different license. You may use the text of this license as a model for your own license, but your license should not refer to the LPPL or otherwise give the impression that your work is distributed under the LPPL.

The document “modguide.tex” in the base LaTeX distribution explains the motivation behind the conditions of this license. It explains, for example, why distributing LaTeX under the GNU General Public License (GPL) was considered inappropriate. Even if your work is unrelated to LaTeX, the discussion in “modguide.tex” may still be relevant, and authors intending to distribute their works under any license are encouraged to read it.
A Recommendation on Modification Without Distribution

It is wise never to modify a component of the Work, even for your own personal use, without also meeting the above conditions for distributing the modified component. While you might intend that such modifications will never be distributed, often this will happen by accident – you may forget that you have modified that component; or it may not occur to you when allowing others to access the modified version that you are thus distributing it and violating the conditions of this license in ways that could have legal implications and, worse, cause problems for the community. It is therefore usually in your best interest to keep your copy of the Work identical with the public one. Many works provide ways to control the behavior of that work without altering any of its licensed components.
How to Use This License

To use this license, place in each of the components of your work both an explicit copyright notice including your name and the year the work was authored and/or last substantially modified. Include also a statement that the distribution and/or modification of that component is constrained by the conditions in this license.

Here is an example of such a notice and statement:

  %% pig.dtx
  %% Copyright 2005 M. Y. Name
  %
  % This work may be distributed and/or modified under the
  % conditions of the LaTeX Project Public License, either version 1.3
  % of this license or (at your option) any later version.
  % The latest version of this license is in
  %   http://www.latex-project.org/lppl.txt
  % and version 1.3 or later is part of all distributions of LaTeX
  % version 2005/12/01 or later.
  %
  % This work has the LPPL maintenance status “maintained”.
  % 
  % The Current Maintainer of this work is M. Y. Name.
  %
  % This work consists of the files pig.dtx and pig.ins
  % and the derived file pig.sty.

Given such a notice and statement in a file, the conditions given in this license document would apply, with the “Work” referring to the three files “pig.dtx”, “pig.ins”, and “pig.sty” (the last being generated from “pig.dtx” using “pig.ins”), the “Base Interpreter” referring to any “LaTeX-Format”, and both “Copyright Holder” and “Current Maintainer” referring to the person “M. Y. Name”.

If you do not want the Maintenance section of LPPL to apply to your Work, change “maintained” above into “author-maintained”. However, we recommend that you use “maintained”, as the Maintenance section was added in order to ensure that your Work remains useful to the community even when you can no longer maintain and support it yourself.
Derived Works That Are Not Replacements

Several clauses of the LPPL specify means to provide reliability and stability for the user community. They therefore concern themselves with the case that a Derived Work is intended to be used as a (compatible or incompatible) replacement of the original Work. If this is not the case (e.g., if a few lines of code are reused for a completely different task), then clauses 6b and 6d shall not apply.
Important Recommendations

Defining What Constitutes the Work
    The LPPL requires that distributions of the Work contain all the files of the Work. It is therefore important that you provide a way for the licensee to determine which files constitute the Work. This could, for example, be achieved by explicitly listing all the files of the Work near the copyright notice of each file or by using a line such as:

        % This work consists of all files listed in manifest.txt.

    in that place. In the absence of an unequivocal list it might be impossible for the licensee to determine what is considered by you to comprise the Work and, in such a case, the licensee would be entitled to make reasonable conjectures as to which files comprise the Work. 
```
