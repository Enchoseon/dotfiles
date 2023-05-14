# =========
# Powerline
# =========
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
USE_POWERLINE="true" # Use Powerline

# =======
# Aliases
# =======

# Coreutils
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color --side-by-side --minimal"
alias cp="cp -i" # Confirm before overwriting something
alias df="df -h" # Human-readable sizes
alias free='free -m' # Show sizes in MB

# Ranger
alias nas="ranger ${HOME}/Sync/NAS" # ... in my NAS directory
alias notes="ranger ${HOME}/Sync/Notes/Personal" # ... in my [personal] notes directory
alias school="ranger '${HOME}/Sync/Notes/School/Spring 2023'" # ... in my school directory

# Quick Notes
alias n="vi ${HOME}/Sync/Notes/Personal/Quicknote.md"

# Todo.txt
alias todo="vi -c ':set filetype=todotxt' ${HOME}/Sync/Notes/todo.txt" # Edit Todo.txt in Neovim
alias topydo="${HOME}/Scripts/venv/bin/topydo" # Launch topydo
alias t="${HOME}/Scripts/venv/bin/topydo columns" # Launch topydo columns TUI

# Auto Editor
alias auto-editor="${HOME}/Scripts/venv/bin/auto-editor --ffmpeg-location '/usr/bin/ffmpeg' --no-open"

# Emacs
alias enw="emacs -nw"

# Quitly Close Terminal Emulator
alias :q="exit"

# =======
# Exports
# =======

# Add PNPM support
export PNPM_HOME=~/.local/share/pnpm
export PATH="$PNPM_HOME:$PATH"

# Neovim as default editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# Prefer Dolphin Filepicker over GNOME (maybe this should be a global environment variable? or maybe that would create problems...)
export GTK_USE_PORTAL=1

# =============
# Shell Options
# =============

setopt correct # Auto correct mistakes
setopt extendedglob # Extended globbing. Allows using regular expressions with *
setopt nocaseglob # Case insensitive globbing
setopt rcexpandparam # Array expension with parameters
setopt nocheckjobs # Don't warn about running processes when exiting
setopt numericglobsort # Sort filenames numerically when it makes sense
setopt nobeep # No beep
setopt appendhistory # Immediately append history instead of overwriting
setopt histignorealldups # If a new command is a duplicate, remove the older one
setopt autocd # if only directory path is entered, cd there.
setopt inc_append_history # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace # Don't save commands that start with space

# ===========
# Namespacing
# ===========

# Completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true # Automatically find new executables in path 
zstyle ':completion:*' insert-tab pending # Don't perform completion when pasting with tabs
zstyle -e ':completion:*:approximate:*' \
	max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)' # Fuzzy completion

# Performant Completions
zstyle ':completion:*' accept-exact '*(N)' 
zstyle ':completion:*' use-cache on # Proxy list of results
zstyle ':completion:*' cache-path ~/.zsh/cache # proxy list of results

# Ignore CVS Files & Directories
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# =======
# History
# =======

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//\/[&.;]} # Don't consider certain characters part of the word

# ====================================
# Portage Completation + Gentoo Prompt 
# ====================================

autoload -U compinit promptinit
compinit
promptinit
prompt gentoo

# ===========
# Keybindings
# ===========

bindkey -e

# Make keyboard keys function as expected
bindkey '^[[2~' overwrite-mode # Insert key
bindkey '^[[3~' delete-char # Delete key
bindkey '^[[C'  forward-char # Right key
bindkey '^[[D'  backward-char # Left key
bindkey '^[[5~' history-beginning-search-backward # Page up key
bindkey '^[[6~' history-beginning-search-forward # Page down key
bindkey '^[[7~' beginning-of-line # Home key
bindkey '^[[H' beginning-of-line # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
	bindkey "${terminfo[khome]}" beginning-of-line # Home key
fi
bindkey '^[[8~' end-of-line # End key
bindkey '^[[F' end-of-line # End key
if [[ "${terminfo[kend]}" != "" ]]; then
	bindkey "${terminfo[kend]}" end-of-line # End key
fi

# Navigate words with Ctrl + Arrow Keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word # Ctrl + Backspace to delete previous word
bindkey '^[[Z' undo # Shift + Tab to undo last action

# =======
# Theming
# =======

# Theme
autoload -U compinit colors zcalc
compinit -d
colors

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

# =======
# Plugins
# =======

# Fish-like syntax highlighting (AUR Package: `zsh-syntax-highlighting`)
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fish history search (AUR Package: `zsh-history-substring-search`)
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
# Bind UP and DOWN arrow keys to zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ======
# Prompt
# ======

emulate -L zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh # Fish-like autosuggestions (AUR Package: `zsh-autosuggestions`)

# Determine terminal capabilities.
{ if ! zmodload zsh/langinfo zsh/terminfo ||
	[[ $langinfo[CODESET] != (utf|UTF)(-|)8 || $TERM == (dumb|linux) ]] ||
	(( terminfo[colors] < 256 )); then
	# Don't use the powerline config. It won't work on this terminal.
	local USE_POWERLINE=false
	# Define alias `x` if our parent process is `login`.
	local parent
	if { parent=$(</proc/$PPID/comm) } && [[ ${parent:t} == login ]]; then
		alias x='startx ~/.xinitrc'
	fi
fi } 2>/dev/null

# ================
# Powerlevel Again
# ================

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244' # Use 256 colors and UNICODE

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
