# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}"$'\n'"$%b"
 PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%~%{$fg[red]%}]%{$reset_color%}"$'\n'"%{$fg[yellow]%}%n%{$fg[yellow]%}@%{$fg[magneta]%}%M $%b"

bindkey -e 
#### binding ported from .cshrc {{{
alias ls='ls --color=auto' 
export EDITOR=vim
export P4PORT=pf-sj1-ntsw:1667;   
#export TERM=xterm-256color
alias vimdiff='/tools/oss/packages/x86_64-rhel6/vim/8.2-p1/bin/vimdiff'
alias gvimdiff='/tools/oss/packages/x86_64-rhel6/vim/8.2-p1/bin/gvimdiff'
alias zsh='/tools/oss/local/x86_64-rhel6-avago/bin/zsh5.4'
#export SHELL='/tools/oss/local/x86_64-rhel6-avago/bin/zsh5.4'
export TERM=xterm-256color
export P4VER=2017.2;   
export P4CONFIG=.p4env;   
export P4MERGE=/home/buildman/bin/p4merge;  
export P4DIFF="/tools/oss/packages/x86_64-rhel6/vim/8.2-p1/bin/gvimdiff -f -c 'set wrap' -c 'wincmd w' -c 'set wrap' "
export P4DIFF2="/tools/oss/packages/x86_64-rhel6/vim/8.2-p1/bin/gvimdiff -f -c 'set wrap' -c 'wincmd w' -c 'set wrap'  "
export P4USER=sa956222
export RIPGREP_CONFIG_PATH=/home/sa956222/.ripgreprc
export COLORS=~/DIR_COLORS.xterm
export PATH=/tools/bin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/bin/X11:/usr/openwin/bin
export PATH=/home/cadmgr/scripts:$PATH
export PATH=$HOME/bin:$PATH
##Black: 30
##Blue: 34
##Cyan: 36
##Green: 32
##Purple: 35
##Red: 31
##White: 37
##Yellow: 33
##Normal Text: 0
##Bold or Light Text: 1 (It depends on the terminal emulator.)
##Dim Text: 2
##Underlined Text: 4
##Blinking Text: 5 (This does not work in most terminal emulators.)
##Reversed Text: 7 (This inverts the foreground and background colors, so you?ll see black text on a white background if the current text is white text on a black background.)
##Hidden Text: 8
##Directory: di
##File: fi
##Symbolic Link: ln
##Named Pipe (FIFO): pi
##Socket: so
##Block Device: bd
##Black background: 40
##Blue background: 44
##Cyan background: 46
##Green background: 42
##Purple background: 45
##Red background: 41
##White background: 47
##Yellow background: 43
export LS_COLORS='no=00:fi=00:ex=00:di=1;32:ln=01;36:pi=00:bd=0:su=00:ow=0:st=0:tw=0:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.sv=01;31:*.zip=01;31:*.svh=01;31:*.vlist=01;32:*.pl=01;35:*.sva=01;35:*Makefile=01;46:*.tpl=00;43:*.lst=00;45:*.cfg=01;35:'
#### binding ported from .cshrc }}}

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
 setopt    appendhistory     #Append history to the history file (no overwriting)
 setopt    sharehistory      #Share history across terminals
 setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

setopt autocd

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=30
##
### Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey -v '^?' backward-delete-char

############################################################################
# {{{1 vi mode cursor indicator
function zle-keymap-select () 
{
    # change cursor shape
     if [[ -n "$TMUX" ]]; then  # tmux
      case $KEYMAP in
          vicmd)      print -n -- "\ePtmux;\e\e]50;CursorShape=0\x7\e\\";;
          viins|main) print -n -- "\ePtmux;\e\e]50;CursorShape=1\x7\e\\";;
      esac
    else
      case $KEYMAP in 
          vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
          viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
      esac
    fi

    zle reset-prompt
    zle -R
}
function zle-line-init () {
    # change cursor shape
      if [[ -n "$TMUX" ]]; then # tmux
        print -n -- "\ePtmux;\e\e]50;CursorShape=0\x7\e\\"
     else # iTerm2
      case $KEYMAP in 
          vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
          viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
      esac
     fi

    zle reset-prompt
    zle -R
}

function zle-line-finish ()
{
      print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

##terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]

# function insert-mode () { echo "-- INSERT --" }
# function normal-mode () { echo "-- NORMAL --" }

# precmd () {
#     # yes, I actually like to have a new line, then some stuff and then 
#     # the input line
#     print -rP "
# [%D{%a, %d %b %Y, %H:%M:%S}] %n %{$fg[blue]%}%m%{$reset_color%}"

#     # this is required for initial prompt and a problem I had with Ctrl+C or
#     # Enter when in normal mode (a new line would come up in insert mode,
#     # but normal mode would be indicated)
#     PS1="%{$terminfo_down_sc$(insert-mode)$terminfo[rc]%}%~ $ "
# }
# function set-prompt () {
#     case ${KEYMAP} in
#       (vicmd)      VI_MODE="$(normal-mode)" ;;
#       (main|viins) VI_MODE="$(insert-mode)" ;;
#       (*)          VI_MODE="$(insert-mode)" ;;
#     esac
#     PS1="%{$terminfo_down_sc$VI_MODE$terminfo[rc]%}%~ $ "
# }

# function zle-line-init zle-keymap-select {
#     set-prompt
#     zle reset-prompt
# }
# preexec () { print -rn -- $terminfo[el]; }

# zle -N zle-line-init
# zle -N zle-keymap-select
###########################################################################
##
### Change cursor shape for different vi modes.
##
### Use lf to switch directories and bind it to ctrl-o
##lfcd () {
##    tmp="$(mktemp)"
##    lf -last-dir-path="$tmp" "$@"
##    if [ -f "$tmp" ]; then
##        dir="$(cat "$tmp")"
##        rm -f "$tmp"
##        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
##    fi
##}
##bindkey -s '^o' 'lfcd\n'
##
### Edit line in vim with ctrl-e:
##autoload edit-command-line; zle -N edit-command-line
##bindkey '^e' edit-command-line
#plugins=( vi-mode vim-interaction )
#export ARCHFLAGS="-arch x86_64"
#export ZSH="/home/sa956222/.oh-my-zsh"
#ZSH_THEME="3den"
#export ZSH_DISABLE_COMPFIX="true"

# Load aliases and shortcuts if existent.
#[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f ~/tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/tools/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/tools/zsh-autosuggestions/zsh-autosuggestions.zsh
  [[ -s /home/sa956222/.autojump/etc/profile.d/autojump.sh ]] && source /home/sa956222/.autojump/etc/profile.d/autojump.sh

        autoload -U compinit && compinit -u


[ -f "$HOME/.aliases.zshrc" ] && source "$HOME/.aliases.zshrc"

# Load zsh-syntax-highlighting; should be last.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#source $ZSH/oh-my-zsh.sh
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
bindkey '^ ' autosuggest-accept
#source ~/.oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh
autoload zmv
