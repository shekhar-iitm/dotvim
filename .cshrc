# Default user .cshrc file
# 
# Usage:  Copy this file to a user's home directory and edit it to
# customize it to taste.  It is run by csh each time it starts up.
#
# Modified 981209 jsin
# Modified 981001 djo based on originals from dhynson 
#

source /tools/bin/common.cshrc
alias ls 'ls --color=auto' 
setenv EDITOR vim
setenv PAGER less
setenv LPDEST lp
setenv TERM vt100
set history=1000                        # save last 200 commands
#set histdup=erase
set savehist=(1000 merge)
#alias postcmd       "history -S; history -M"
#export PROMPT_COMMAND='history -a'
set nobeep
#set prompt = "\n%{\033[1;31m%}%n@%m%{\033[0m%} %{\033[1;20m%}%~%{\033[0m%} \n%{\033[1;35m%}%D %w %T (%h)%{\033[0m%} "
set prompt = "\n%{\033[0;00m%}%n@%m%{\033[0m%} %{\033[1;20m%}%~%{\033[0m%} \n%{\033[0;00m%}%D %w %T (%h)%{\033[0m%} "
set filec
# List matches when autocompleting
set autolist=true
#
# # enable spelling correction
#set correct=all
set autoexpand
#limit coredumpsize 0 

# not need to use following cause more confusion
#set complete = enhance

setenv RIPGREP_CONFIG_PATH  /home/sa956222/.ripgreprc
set COLORS=~/DIR_COLORS.xterm
#setenv VIMRUNTIME /home/shekhara/vim72
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
setenv LS_COLORS 'no=00:fi=00:ex=00:di=1;32:ln=01;36:pi=00:bd=0:su=00:ow=0:st=0:tw=0:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.sv=01;31:*.zip=01;31:*.svh=01;31:*.vlist=01;32:*.pl=01;35:*.sva=01;35:*Makefile=01;46:*.tpl=00;43:*.lst=00;45:*.cfg=01;35:'
##
# Source other rc files after this line.

#bindkey -b M-o complete-word-fwd
bindkey -b M-i complete-word-back
#xmodmap -e "pointer = 1 3 2"

#######################################
#PERSONAL CUSTOMIZATION BELOW THIS LINE
#######################################
setenv PRINTER          prtsjca059;   
setenv LPDEST           $PRINTER;   
setenv P4PORT   pf-sj1-ntsw:1667;   
#setenv    P4PORT      pf-sj1-ntsw.sj.broadcom.com:1667
#setenv    P4PORT      pf-sj1-ntswproxy.sj.broadcom.com:1667
#setenv    P4PORT      pf-sj1-ntswproxy.lvn.broadcom.net:1667
#setenv P4VER    2012.2;   
setenv P4VER    2017.2;   
setenv P4CONFIG .p4env;   
setenv P4MERGE  /home/buildman/bin/p4merge;  
setenv P4DIFF tkdiff
setenv P4DIFF2 tkdiff
setenv P4USER sa956222
#setenv P4CLIENT TH3_TOMAHAWK3_dlchen_mmu_rtl_06012016
#setenv TERM xterm-256color
setenv TERM xterm-256color

#source ~/.aliases
##cd /projects/tomahawk2_mmu_dv2/shekhara/
#if ( -f ~/.fzf.csh ) then
#  source ~/.fzf.csh
#endif
setenv PATH /tools/bin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/bin/X11:/usr/openwin/bin
setenv PATH /home/cadmgr/scripts:${PATH}
setenv PATH ${HOME}/bin:${PATH}
#    set path=( \
#          ~/bin \
#          /home/cadmgr/scripts \
#          ./ \
#          /bin \
#          /tools/bin \
#          /tools/oss/packages/i686-rhel3/gcc/3.3.3/bin \
#          /usr/local/bin \
#          /etc \
#          /usr/bin \
#          /usr/sbin \
#          /sbin \
#         )
         #/usr/tools/bin \
          #/usr/ucb \
          #/local/bin \
          #/usr/ccs/bin \
          #/usr/dt/bin \
          #/usr/openwin/bin \
            #    /tools/gnu/bin \
