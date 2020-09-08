let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
nnoremap <silent>  :CtrlP
nmap o <Plug>ZoomWin
nmap  :ZoomWin
noremap  g
nnoremap ,ps :!p4 submit  %
nnoremap ,pr :!p4 revert %
nnoremap ,pd :!p4 diff %
nnoremap ,pe :!p4 edit %
nnoremap ,pf :!p4 filelog %
nnoremap ,pa :!p4 add %
noremap ,q :bd
noremap ,t :tabnew
noremap ,v :vsp
noremap ,s :sp
noremap ,a :q
nmap /?c "zyw:tabnew" LAck ".@z." $mmu/common $mmu/mmu_sch_common"
nmap /? "zyw:tabnew:exe " LAck ".@z."    "  
vnoremap /? y:tabnew:LAck """
vmap [% [%m'gv``
vmap ]% ]%m'gv``
vmap a% [%v]%
nmap bb :BufExplorer
noremap cmd/ q/
noremap cmd q:
nmap fmc :FufMruCmd
nmap fm :FufMruFile
nmap fj :FufJumpList
nmap fq :FufQuickfix
nmap fz :FZF
nmap fb :Buffers  
nmap fcwd :FufFileWithFullCwd
nmap fc :FufChangeList
nmap fd :FufDir
nmap fh :History
nmap ft :Tags
nmap ff :Files 
nmap gx <Plug>NetrwBrowseX
nnoremap gf :sp  gf
nmap mm :MRU
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
imap jj  
iabbr mydisp m_log.normal($psprintf("abcxyz"));
iabbr ddisp $display("debug123 file %s line %d",`__FILE__,`__LINE__);
cnoreabbr Ack Ack!
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set autoread
set background=dark
set backspace=2
set complete=.,w,b,u,i
set encoding=utf-8
set noequalalways
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set formatoptions=tcqr
set guioptions=aegirLt
set guitablabel=%!GuiTabLabel()
set helplang=en
set history=700
set hlsearch
set incsearch
set mouse=a
set path=.,/usr/include,,,**
set ruler
set runtimepath=~/.vim,~/.vim/bundle/Vundle.vim,~/.vim/bundle/L9,~/.vim/bundle/vim-addon-qf-layout,~/.vim/bundle/verilog_systemverilog.vim,~/.vim/bundle/onedark.vim,~/.vim/bundle/molokai,~/.vim/bundle/gruvbox,~/.vim/bundle/seoul256.vim,~/.vim/bundle/vim-colors-solarized,~/.vim/bundle/mru.vim,~/.vim/bundle/FuzzyFinder,~/.vim/bundle/fzf.vim,~/.vim/bundle/bufexplorer,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/ack.vim,~/.vim/bundle/winmanager,~/.vim/bundle/VisIncr,~/.vim/bundle/tabular,~/.vim/bundle/vim-anyfold,~/.vim/bundle/matchit.zip,~/.vim/bundle/ZoomWin,/tools/oss/packages/x86_64-rhel6/vim/7.4.410/share/vim/vimfiles,/tools/oss/packages/x86_64-rhel6/vim/7.4.410/share/vim/vim74,/tools/oss/packages/x86_64-rhel6/vim/7.4.410/share/vim/vimfiles/after,~/.vim/after,~/.vim/bundle/Vundle.vim,~/.fzf,~/.vim/bundle/Vundle.vim/after,~/.vim/bundle/L9/after,~/.vim/bundle/vim-addon-qf-layout/after,~/.vim/bundle/verilog_systemverilog.vim/after,~/.vim/bundle/onedark.vim/after,~/.vim/bundle/molokai/after,~/.vim/bundle/gruvbox/after,~/.vim/bundle/seoul256.vim/after,~/.vim/bundle/vim-colors-solarized/after,~/.vim/bundle/mru.vim/after,~/.vim/bundle/FuzzyFinder/after,~/.vim/bundle/fzf.vim/after,~/.vim/bundle/bufexplorer/after,~/.vim/bundle/ctrlp.vim/after,~/.vim/bundle/ack.vim/after,~/.vim/bundle/winmanager/after,~/.vim/bundle/VisIncr/after,~/.vim/bundle/tabular/after,~/.vim/bundle/vim-anyfold/after,~/.vim/bundle/matchit.zip/after,~/.vim/bundle/ZoomWin/after
set scrolloff=2
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,winsize,blank,buffers,curdir,folds,help,options,tabpages
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set smarttab
set softtabstop=2
set splitright
set noswapfile
set tabstop=2
set tags=/projects/tomahawk4e_mmu_dv2/shekhara/sa_th4e_mmu_top_llcbfc_edge_0526/tomahawk4e/dv/mmu/tags
set ttimeout
set ttimeoutlen=50
set visualbell
set wildmenu
set wildmode=longest,list,full
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 ~/.vimrc
argglobal
silent! argdel *
argadd .vimrc
set lines=60 columns=269
winpos 2 53
edit ~/.vimrc
set splitbelow splitright
set nosplitbelow
wincmd t
set winheight=1 winwidth=1
argglobal
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
set foldcolumn=3
setlocal foldcolumn=3
setlocal foldenable
set foldexpr=b:anyfold_ind_buffer[v:lnum-1]
setlocal foldexpr=b:anyfold_ind_buffer[v:lnum-1]
setlocal foldignore=#
set foldlevel=10000
setlocal foldlevel=10000
setlocal foldmarker={{{,}}}
setlocal foldmethod=expr
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=MinimalFoldText()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 537 - ((28 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
537
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
