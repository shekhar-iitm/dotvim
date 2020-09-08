"set verbose=9                   " Max verbosity

set nocompatible                " Vi ke features nahi chahiye must be frst line
filetype off
" set the runtime path to include Vundle and initialize
"""""""""""""""""VUNDLE BEGIN {{{ """"""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"  {{{Plugin start

  Plugin 'L9'   " Needed by FuzzyFinder
  Plugin 'MarcWeber/vim-addon-qf-layout'   " command is \f to format search output
  Plugin 'vhda/verilog_systemverilog.vim'
"  Plugin 'tpope/vim-fugitive'
 " Plugin 'scrooloose/syntastic'

 Plugin 'christoomey/vim-tmux-navigator'


Plugin 'ngemily/vim-vp4'
Plugin 'tpope/vim-unimpaired'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'vim-scripts/highlight.vim'
"Plugin 'xolox/vim-easytags'
"Plugin 'vim-scripts/vim-misc'
Plugin 'vim-scripts/hexHighlight.vim'



  "1 some cool colorschemes  {
    Plugin 'joshdick/onedark.vim'
    "Plugin 'nanotech/jellybeans.vim'   ----- local modified copy in .vim
    Plugin 'tomasr/molokai'
    Plugin 'morhetz/gruvbox'
    Plugin 'junegunn/seoul256.vim'
    Plugin 'altercation/vim-colors-solarized'
    "Plugin 'vim-scripts/grishin-color-scheme'
  " }

  "2 Files/Buffers { 
    Plugin 'mru.vim'
    Plugin 'FuzzyFinder'
    Plugin 'junegunn/fzf.vim'
    "Plugin 'scrooloose/nerdtree'
"    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'jlanzarotta/bufexplorer'
    "Plugin 'vim-scripts/minibufexpl.vim'
    Plugin 'kien/ctrlp.vim'
    "Plugin 'jeetsukumaran/vim-buffergator'
    Plugin 'nelstrom/vim-visual-star-search'

  " }
  "
  "3 For grepping { 
    Plugin 'mileszs/ack.vim'
  "}

  "4 IDE {
    Plugin 'winmanager'
  " }
   
  "5 autocomplete {
    Plugin 'vim-scripts/VisIncr'
    Plugin 'godlygeek/tabular'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'honza/vim-snippets'
   " Plugin 'SirVer/ultisnips'
   Plugin 'garbas/vim-snipmate'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
 "   Plugin 'valloric/youcompleteme'
  "  Plugin 'ycm-core/YouCompleteMe'
    Plugin 'scrooloose/nerdcommenter'
    " this add gc operator for comments combined with action
    Plugin 'tpope/vim-commentary'
    Plugin 'kana/vim-textobj-user'
    "Plugin 'neoclide/coc.nvim'

    
  " }

  "6 visual {
    "Plugin 'Yggdroot/indentLine'
    "Plugin 'vim-airline/vim-airline'   "very heavy 
    Plugin 'pseewald/vim-anyfold'
    Plugin 'matchit.zip'
  "  Plugin 'inkarkat/vim-mark'
    "Plugin 'ap/vim-buftabline'
  "}

  "7 source code {
    "Plugin 'vim-scripts/taglist.vim'
      Plugin 'majutsushi/tagbar'
    "Plugin 'zefei/vim-wintabs'
    "Plugin 'scrooloose/syntastic'  ---- dont support sv 
  " }

  "8 Movement { 
    "Plugin 'tc50cal/vim-terminal' 
    "Plugin 'Shougo/vimshell'
  "}"

  "9 Buffer management { 
    "Plugin 'moll/vim-bbye'
  " }

  " 10 window managmeent {
      Plugin 'ZoomWin'
      "Plugin 'wesq3/vim-windowswap'
  " }
""
""
""
""
"  }}}Plugin end
"" All of your Plugins must be added before the following line

"============================================================================================================================================================================"
" Plugin setting started {{{"
call vundle#end()            " required
filetype plugin indent on    " required by VUNDLE 
" Show syntax highlighting groups for word under cursor

nmap <C-a> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


let g:vp4_prompt_on_write = 1 
let g:vp4_allow_open_depot_file = 1
" For Plugin 'mileszs/ack.vim' {
    if executable('ag')
      "let g:ackprg = "ag --vimgrep  "
      " -w : word boundar , -i ignore case , -L : followthrough , -g "*.sv" , 
      "  -C show context , -tsv : only sv files
      let g:ackprg = "rg --color never   --vimgrep --ignore-file ~sa956222/.ignore"
    endif
    "let g:indentLine_enabled = 1
    let g:ack_autofold_results = 0
    "let g:ack_qhandler = " topleft copen "
    "let g:ack_lhandler = " topleft lopen "
    let g:ackhighlight = 1
    "Use this option to automagically open the file with 'j' or 'k'.
    let g:ackpreview = 0
    " Auto close the Quickfix list after pressing '<enter>' on a list item
    let g:ack_autoclose = 1

    " Any empty ack search will search for the work the cursor is on
    let g:ack_use_cword_for_empty_search = 1

    " Don't jump to first match
    cnoreabbrev Ack Ack!
"} Plugin Ack 

" For Plugin 'tc50cal/vim-terminal' { 
  let g:Terminal_FastMode = 0
" }

"For Plugin 'fholgado/minibufexpl.vim' {
  let g:miniBufExplShowBufNumbers = 0
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplMapWindowNavArrows = 1
  let g:miniBufExplMapCTabSwitchBufs = 1
  let g:miniBufExplModSelTarget = 1
"let g:miniBufExplVSplit = 10 " open in vertical
"let g:miniBufExplSplitToEdge = 0 " open relative to previous window (NERDTree)
" }

"For Plugin 'kien/ctrlp.vim' {
  let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:100,results:100'
  let g:ctrlp_by_filename = 1
  let g:ctrlp_regexp = 1
  "set wildignore+=*/Linux_sv/*,sv.log.*,*.log,*.fsdb,*.vcd,*/simv.daidir/*,*.c,*.cpp,*.html,*.css,tag*     " MacOSX/Linux

  "let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  "let g:ctrlp_custom_ignore = {
  "  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "  \ 'file': '\v\.(exe|so|dll)$',
  "  \ 'link': 'some_bad_symbolic_links',
  "  \ }
" }

 " Plugin 'winmanager' {
  let g:defaultExplorer=0
  "autocmd vimenter * WMToggle
" }

"
"" {{{ winmanager config
"" register the plugins
"let g:NERDTree_title='NERD Tree'
""let g:MiniBufExpl_title='MiniBufExpl'
""
""" set the layout
    "g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'
"let g:winManagerWindowLayout='BufExplorer,FileExplorer'
"
"" handler for NERDTree
"function! NERDTree_Start()
"    exec 'NERDTree'
"endfunction
"function! NERDTree_IsValid()
"endfunction
"function! NERDTree_Refresh()
"endfunction
"function! NERDTree_Resize()
"endfunction

"" handler for MiniBufExpl
"function! MiniBufExpl_Start()
"    exec 'MBEOpen'
"endfunction
"function! MiniBufExpl_IsValid()
"endfunction
"function! MiniBufExpl_Refresh()
"endfunction
"function! MiniBufExpl_Resize()
"endfunction
let g:winManagerWidth = 50
"" }}} winmanager config

" Plugin AnyFold {{{
  autocmd FileType * AnyFoldActivate
" Plugin Anyfold }}}"

" Plugin Taglist {{{
"let Tlist_Use_Right_Window = 1
"let g:NERDTreeMouseMode=3 
"let g:NERDTreeDirArrows=0
" Plugin Taglist }}}

" Plugin fuzzy {{{
    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
    
    "command! -bang -nargs=* Rg
    "  \ call fzf#vim#grep(
    "  \   'rg --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1,
    "  \   <bang>0 ? fzf#vim#with_preview('up:60%')
    "  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    "  \   <bang>0)
    
    
    
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case  '.(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)
    
    command!      -bang -nargs=* Ag         
      \ call fzf#vim#grep(
      \   'ag  --color --smart-case '.(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)
" Plugin fuzzy }}}

" Plugin quickfixlist {{{
    let g:vim_addon_qf_layout = {}
    "let g:vim_addon_qf_layout.quickfix_formatters = [ 'NOP', 'vim_addon_qf_layout#DefaultFormatter', 'vim_addon_qf_layout#FormatterNoFilename', 'vim_addon_qf_layout#Reset' ]
    let g:vim_addon_qf_layout.quickfix_formatters = [ 'NOP', 'vim_addon_qf_layout#DefaultFormatter' , 'vim_addon_qf_layout#FileFormatter' , 'vim_addon_qf_layout#Reset' ]
    let g:vim_addon_qf_layout.lhs_cycle = '<buffer> \f'
    let g:vim_addon_qf_layout.file_name_align_max_width = 60
" Plugin quickfixlist }}}

let g:fuf_modesDisable=[]
let g:fuf_mrufile_maxItem = 30
let g:fuf_mrucmd_maxItem = 50

" Plugin matchwords {{{"
let b:match_ignorecase=1
let b:match_words=
  \ '\<begin\>:\<end\>,' 
"  \ '\<if\>:\<else\>,' .
"  \ '\<module\>:\<endmodule\>,' .
"  \ '\<class\>:\<endclass\>,' .
"  \ '\<program\>:\<endprogram\>,' .
"  \ '\<clocking\>:\<endclocking\>,' .
"  \ '\<property\>:\<endproperty\>,' .
"  \ '\<sequence\>:\<endsequence\>,' .
"  \ '\<package\>:\<endpackage\>,' .
"  \ '\<covergroup\>:\<endgroup\>,' .
"  \ '\<primitive\>:\<endprimitive\>,' .
"  \ '\<specify\>:\<endspecify\>,' .
"  \ '\<generate\>:\<endgenerate\>,' .
"  \ '\<interface\>:\<endinterface\>,' .
"  \ '\<function\>:\<endfunction\>,' .
"  \ '\<task\>:\<endtask\>,' .
"  \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
"  \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
"  \ '`ifdef\>:`else\>:`endif\>,'
" Plugin matchwords }}}"
"
"
"
"
" Plugin setting ended }}}"
"============================================================================================================================================================================"
" mapping start {{{
"
    :let mapleader = ","
  
    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

    imap      jj     <Esc> 
    "nnoremap  gf     :sp <CR> gf
    noremap  <C-]>   g<C-]>
    noremap   cmd    q:
    noremap   cmd/   q/
    noremap   <Leader>a      :q<CR>
    noremap   <Leader>s      :sp<CR>
    noremap   <Leader>v      :vsp<CR>
    noremap   <Leader>t      :tabnew<CR>
    noremap   <Leader>q      :bd<CR>
    nmap <C-t> :tabp<CR>
    "noremap   a      :q<CR>
    "noremap   s      :sp<CR>
    "noremap   v      :vsp<CR>
    "noremap   t      :tabnew<CR>
    "noremap   q      :bd<CR>
    
    nmap <C-Up> [e
    nmap <C-Down> ]e
    vmap <C-Up> [egv
    vmap <C-Down> ]egv
   " tab movements
    map <C-S-]> gt
    map <C-S-[> gT
    map <C-0> :tablast<CR>
    map <C-1> 1gt
    map <C-2> 2gt
    map <C-3> 3gt
    map <C-4> 4gt
    map <C-5> 5gt
    map <C-6> 6gt
    map <C-7> 7gt
    map <C-8> 8gt
    map <C-9> 9gt
    
    "search
    "vnoremap  <Leader>/   y:tabnew<CR>:LAck "<C-R>""
    "nmap      <Leader>/  "zyaw:tabnew<CR>:exe " LAck ".@z."    "  
   vnoremap  <Leader>/   y:tabnew<CR>:LAck "<C-R>"" $mmu
   nmap      <Leader>/   yaw:tabnew<CR>:LAck <C-R>" $mmu
   nmap      <Leader>/c  yaw:tabnew<CR>:LAck <C-R>" $mmu/common $mmu/mmu_sch_common $mmu/mmu_qsch $mmu/mmu_mainsch
    vnoremap  <Leader>s   y:Ack "<C-R>"" $mmu
    nmap      <Leader>s  yaw:Ack <C-R>"  $mmu
    nmap      <Leader>sc yaw:Ack <C-R>" $mmu/common $mmu/mmu_qsch $mmu/mmu_mainsch $mmu/mmu_sch_common

    "plugins 
    nmap  <Leader>mm :MRU<CR>
    nmap  <Leader>bb :BufExplorer<CR>
    nmap  <Leader>ff :Files 
    nmap  <Leader>ft :Tags<CR>
    nmap  <Leader>fh :History<CR>
    nmap  <Leader>fd :FufDir<CR>
    nmap  <Leader>fc :FufChangeList<CR>
    nmap  <Leader>fcwd :FufFileWithFullCwd<CR>
    nmap  <Leader>fb :Buffers<CR>  
    nmap  <Leader>fz :FZF<CR>
    nmap  <Leader>fq :FufQuickfix<CR>
    nmap  <Leader>fj :FufJumpList<CR>
    nmap  <Leader>fm :FufMruFile<CR>
    nmap  <Leader>fmc :FufMruCmd<CR>
    nmap  <Leader><C-z> :ZoomWin<CR>
    "nmap ff :FufFile<CR>

    "perforce
    nnoremap <Leader>pa :!p4 add %<CR>
    nnoremap <Leader>pf :!p4 filelog %<CR>
    nnoremap <Leader>pe :!p4 edit %<CR>
    nnoremap <Leader>pd :!p4 diff %
    nnoremap <Leader>pr :!p4 revert %
    nnoremap <Leader>ps :!p4 submit  %

    nnoremap <Leader>f :Vp4Filelog <CR> 
    nnoremap <Leader>d :Vp4Diff  
    nnoremap <Leader>p :Vp4   
    
    "autoclose tags
    ""inoremap ( ()<Left>
    ""inoremap { {}<Left>
    ""inoremap [ []<Left>
    ""inoremap " ""<Left>
    
    " unused mappings
    "vnoremap /? y:Clfx <CR>:bufdo grepadd <C-R>"<CR>
    "nmap tn :let t:tl=''
    "nmap GR "zyw:exe " grep -r ".@z." . "  
    "nmap SSA :mksession! ~/sessions/
    "nmap fb :FufBuffer<CR>
    "nmap ft :FufTag<CR>
    "nmap ftf :FufTaggedFile<CR>
    "nmap ftc :FufTagWithCursorWord<CR>
    "nmap GA "zyw:exe " grep -r ".@z." --include \\*.sv --include \\*.svh --include \\*.sva  * "  
    "nmap GA "zyw:exe " Ack ".@z." --file-search-regex='\.sv[ha]*$' "
    "nmap <Tab> :tabn<CR> : conflicts with jump list don't use
    ""map INSHEAD :so ~/.vim/header.sv<CR>:exe "2," . 15 . "g/File:.*/s//File:         " .expand("%")<CR>:exe "2," . 15 . "g/Created:.*/s//Created:      " .strftime("%d-%m-%Y")<CR>
    "nmap GM "zyw:exe " Ack ".@z."   $mmu/mmu_ebpts/env $mmu/common $mmu/mmu_sch_common $mmu/mmu_mainsch $mmu/mmu_epmodel"  
    "nmap GE "zyw:exe " grep -r ".@z." --include \\*.sv --include \\*.svh --include \\*.sva  $mmu/mmu_ebpts $mmu/common $mmu/mmu_sch_common "  
    "nmap GM "zyw:exe " grep -r ".@z." --include \\*.sv --include \\*.svh --include \\*.sva  $mmu/mmu_ebpts $mmu/common $mmu/mmu_sch_common $mmu/mmu_mainsch $mmu/mmu_epmodel"  
    "nmap GA "zyw:exe " grep -r ".@z." --include \\*.sv --include \\*.svh  $mmu <CR> : cw <CR>"  
    "nmap GR "zyw:exe " vimgrep  ".@z." % "
    "nmap GRA "zyw:exe " vimgrep  ".@z." * "
    "nmap GRR "zyw:exe " grep -r ".@z." $rtlthdo/*.vpp " <CR>
" mapping end }}}
"============================================================================================================================================================================"
"""""""""""""""""VUNDLE END }}} """"""""""""""""""""""""
""Abbreviation {{{
    :iab ddisp $display("debug123 file %s line %d",`__FILE__,`__LINE__);
    :iab mydisp m_log.normal($psprintf("abcxyz"));
""    }}}

"if &term =~ "xterm"
"	set bg=light
"  set t_kb=
"  :fixdel                       " Fix the backspace key
"  if has("terminfo")
"    set t_Co=8
"    set t_Sf=[3%p1%dm
"    set t_Sb=[4%p1%dm
"  else
"    set t_Co=8
"    set t_Sf=[3%dm
"    set t_Sb=[4%dm
"  endif
"endif

":leftabove cwindow

""augroup myvimrc
""    autocmd!
""    autocmd QuickFixCmdPost [^l]* leftabove cwindow
""    autocmd QuickFixCmdPost l*    lwindow
""augroup END

  "w	scan buffers from other windows
	"b	scan other loaded buffers that are in the buffer list
	"u	scan the unloaded buffers that are in the buffer list
	"U	scan the buffers that are not in the buffer list
	"k	scan the files given with the 'dictionary' option
	"kspell  use the currently active spell checking |spell|
	"k{dict}	scan the file {dict}.  Several "k" flags can be given,
		"patterns are valid too.  For example:
			":set cpt=k/usr/dict/*,k~/spanish
   "s	scan the files given with the 'thesaurus' option
	"s{tsr}	scan the file {tsr}.  Several "s" flags can be given, patterns
		"are valid too.
	"i	scan current and included files
	"d	scan current and included files for defined name or macro
		"|i_CTRL-X_CTRL-D|
	"]	tag completion
	"t	same as "]"
set complete=.,w,b,u,i,t

"" basic setting {{
"more characters will be sent to the screen for redrawing
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
set ttyfast
set ttymouse=xterm2
"time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=50
"make backspace behave properly in insert mode
set backspace=indent,eol,start
"display incomplete commands
set showcmd
"hide buffers instead of closing them even if they contain unwritten changes
"set hidden
set nolist
set wrap 
" diff wrap by default
"autocmd FilterWritePre * if &diff | setlocal wrap | endif
"autocmd BufReadPre,BufNewFile,FileReadPre,FilterReadPre *  set wrap  
"autocmd BufReadPost,BufNewFile,FileReadPost,FilterReadPost *  set wrap  
"au VimEnter * if &diff | execute 'windo set wrap' | endif


set linebreak
set tw=0                        " Textwidth for auto wrapping
"searches are case insensitive unless they contain at least one capital letter
set noignorecase
set smartcase


"new splits will be at the bottom or to the right side of the screen
"set splitbelow
set splitright

set path+=**
"set guifont=ProggyCleanTT\ 12
"set guifont=monospace\ 9
"set guifont=monospace\ 9
set guifont=DejaVu\ Sans\ Mono\ \ 9
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set autoread
set mouse=a
set encoding=utf-8
set ruler   "Always show current position
"set cursorcolumn  " good for indenting
set cursorline  " good for indenting
" Show matching brackets when text indicator is over them
"set statusline=%=%m\ %c\ %P\ %f
"ignoer whitespaces in diff
set diffopt+=iwhite

set showmatch 
set foldmethod=manual
set foldlevel=10000
set foldcolumn=3
se autochdir
set noea
set autoindent
"set smartindent doesn't work with verilog_systemverilog but useful for space
"indenting
set nobackup
set noswapfile
set nowb
set bs=2                        " Backspace option (must)
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab 
set softtabstop=2               " Makes the spaces feel like real tabs
set scrolloff=2                 " always show two lines above and below cursor
set formatoptions+=r                       " Auto-format comments while typing
set hls                         " Highlight search pattern matches
set incsearch                   " Search as you type (very useful)
set sm                          " Show matching brackets when typing
set history=700                  " keep 50 lines of command line history
set visualbell                  " No beeps please
set nu
set relativenumber
set wildmode=longest,list,full
set wildmenu
" }}}


" Filetype settings {{{
filetype indent on
filetype plugin on
syntax enable


		"bold
		"underline
		"undercurl	not always available
		"strikethrough	not always available
		"reverse
		"inverse		same as reverse
		"italic
		"standout
		"nocombine	override attributes instead of combining them
		"NONE		no attributes used (used to reset it)
			"Red		LightRed	DarkRed
			"Green	LightGreen	DarkGreen	SeaGreen
			"Blue	LightBlue	DarkBlue	SlateBlue
			"Cyan	LightCyan	DarkCyan
			"Magenta	LightMagenta	DarkMagenta
			"Yellow	LightYellow	Brown		DarkYellow
			"Gray	LightGray	DarkGray
			"Black	White
			"Orange	Purple		Violet

"" Error , TODO , 
match TODO /SHEK/
" Then EITHER (define your own colour scheme):
"hi mystringGreen   guifg=Green
"hi mystringRed     guifg=Red
"hi mystringCyan    guifg=Cyan
"hi mystringBlue    guifg=Blue
"hi mystringMagenta guifg=Magenta
"hi mystringOrange  guifg=Orange
"hi mystringPurple  guifg=Purple

if !exists("autocommands_loaded")
	  let autocommands_loaded = 1
    au filetype           make        set noexpandtab
    au BufRead,BufNewFile *.cfg       set filetype=perl 
    au BufRead,BufNewFile *.tpl       set filetype=webmacro 
    au BufRead,BufNewFile *.vh,*.sv,*.svh,*.svi,*.sva,*.vpp,*.v  set filetype=verilog_systemverilog    | 
    "au BufRead,BufNewFile *.vh,*.sv,*.svh,*.svi,*.sva,*.vpp,*.v  match mystringString /`mmu_info\|`uvm_info\|`mmu_error\|`mmu_warning\|`REGISTER_PLUS_ARG\|get_plus_arg_reg\|`mmu_get_plus_arg_reg/ |
    "au BufRead,BufNewFile *.vh,*.sv,*.svh,*.svi,*.sva,*.vpp,*.v  2match mystringRed /\$\w*\|>\|<\|?\|+/               |
    "au BufRead,BufNewFile *.vh,*.sv,*.svh,*.svi,*.sva,*.vpp,*.v  3match mystringCyan /===\|==\|=/               |
    au BufRead,BufNewFile,BufReadPost *.vh,*.sv,*.svh,*.svi,*.sva,*.vpp,*.v  syn match mystringString /`mmu_info\|`uvm_info\|`mmu_error\|`mmu_warning/ |
    au BufRead,BufNewFile,BufReadPost *.vh,*.sv,*.svh,*.svi,*.sva,*.vpp,*.v  syn match mystringRed /\$\w*\|>\|<\|?\|+/               |
    au BufRead,BufNewFile,BufReadPost *.vh,*.sv,*.svh,*.svi,*.sva,*.vpp,*.v  syn match mystringCyan /===\|==\|=/               |
    au BufRead,BufNewFile,BufReadPost *.vh,*.sv,*.svh,*.svi,*.sva,*.vpp,*.v  syn match mystringPurple /`REGISTER_PLUS_ARG\|get_plus_arg_reg\|`mmu_get_plus_arg_reg/               |
    au BufRead,BufNewFile *.vr,*.vrh  set cindent
    au BufRead,BufNewFile *zschrc   set filetype=zsh
    au BufRead,BufNewFile .aliases.zshrc   set filetype=zsh
    au BufRead,BufNewFile .zshrc   set filetype=zsh
	endif

autocmd bufwritepost .vimrc source ~/.vimrc

"search for visual partial line selection and grep it , so that look at it in quickfix file
autocmd FileType qf wincmd H

autocmd FileType qf :vertical resize 140
autocmd FileType qf :resize 10000
"autocmd FileType qf :call vim_addon_qf_layout#Cycle()
"autocmd FileType qf :call  vim_addon_qf_layout#Quickfix()
" Only open a filename without dir in qf
autocmd FileType qf :call vim_addon_qf_layout#ReformatWith(g:vim_addon_qf_layout.quickfix_formatters[1])
"autocmd FileType qf :call vim_addon_qf_layout#DefaultFormatter()
"let b:vim_addon_qf_layout_cycle_id = 1
"autocmd FileType qf :exec ' :call vim_addon_qf_layout#Cycle()'
set ssop+=resize,winpos,winsize,blank,buffers,curdir,folds,help,options,tabpages

" Filetype settings }}}

" colorscheme {{{
set bg=dark                     " Background colour
"":colorscheme xoria256
":colorscheme desert
"":colorscheme wombat
":colorscheme koehler
":colorscheme grishin
":colorscheme molokai
colorscheme jellybeans
"colorscheme abc
":colorscheme morning
":colorscheme zellner
set bg=
set bg=dark                     " Background colour
" colorscheme }}}
"""
""""""""""""""





" Tweaks for browsing Netrw {{{
let g:netrw_banner=0        " disable annoying banner
"				=0: re-using the same window
"				=1: horizontally splitting the window first
"				=2: vertically   splitting the window first
"				=3: open file in new tab
"				=4: act like "P" (ie. open previous window)
let g:netrw_browse_split=0  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"Netrw }}}

"""""""""""""" {{{ function begin 


"load large files more efficiently for ex socregs_def.vh
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowrite (file is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
endif 



"function ClearQuickfixList()
"  call setqflist([])
"endfunction
"command! Clfx cexpr []
"nmap cf :Clfx<cr>


"{{{ save session when exiting vim 
"    function! MakeSession()
"      let b:sessiondir = $HOME . "/.vim/sessions"  " . getcwd()
"      if (filewritable(b:sessiondir) != 2)
"        exe 'silent !mkdir -p ' b:sessiondir
"        redraw!
"      endif
"      let b:filename = b:sessiondir . '/'.$cclient.'.vim'
"      exe "mksession! " . b:filename
"    endfunction
"
"    function! LoadSession()
"      let b:sessiondir = $HOME . "/.vim/sessions"  " .  getcwd()
"      let b:sessionfile = b:sessiondir . '/'.$cclient.'.vim' "  b:sessiondir . "/" . $cclient ".vim"
"      if (filereadable(b:sessionfile))
"        exe 'source ' b:sessionfile
"      else
"        echo "No session loaded."
"      endif
"    endfunction
""au VimEnter * nested :call LoadSession()
"au VimEnter * :call LoadSession()
"au VimLeave * :call MakeSession()
"}}} save session when exiting vim 
"""""""""""""" }}} function end 

"	function GuiTabLabel()
"
"	  let bufnrlist = tabpagebuflist(v:lnum)
"	  let label = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
"		let filename = fnamemodify(label,':h')
"		if strlen(filename) >=8 
"			let ret = filename[0:5].".."
"		else 
"			let ret = filename 
"		return ret
"
"	endfunction
"
"	set guitablabel=%{GuiTabLabel()}
"function! GuiTabLabel()
"  "return exists('t:tl') ? t:tl : 'tab'
"	  let bufnrlist = tabpagebuflist(v:lnum)
"  let label = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
"	let filename = fnamemodify(label,':h')
"	if strlen(filename) >=8 
"		let ret = filename[0:5].".."
"	else 
"		let ret = filename 
"	return ret
"
"endfunction
":set guitablabel=%{GuiTabLabel()}
"I use this solution instead of Habi's as this one still keeps the default features of putting a '+' symbol in the tab to indicate the files being modified, as well as a count of the number of windows in the tab. So it basically works the same as the default tab labelling but just uses file names, not full paths.
function! GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let label = '+'
            break
        endif
    endfor

    " Append the number of windows in the tab page if more than one
    "let wincount = tabpagewinnr(v:lnum, '$')
    "if wincount > 1
    "    let label .= wincount
    "endif
    if label != ''
        let label .= ' '
    endif

    " Append the buffer name (not full path)
    return label . "%t"
endfunction

  set guitablabel=%!GuiTabLabel()
":set go+=e

" Use tags they are awesome to jump to definition
set tags=$mmu/tags
"green
hi mystringString   guifg=#99ad6a
hi mystringRed     guifg=Red
hi mystringCyan    guifg=Cyan
hi mystringBlue    guifg=Blue
hi mystringMagenta guifg=Magenta
hi mystringOrange  guifg=Orange
hi mystringPurple  guifg=Purple
hi mystringGray  guifg=Gray
""""""""""""""""profile vim begin {{{ 
""Vim has a built-in profile set of commands. See :h profile.
""
""You would open up vim, and then run the following
""
"":profile start profile.log
""This sets up the file profile.log to be the log file. If it already exists, it will be overwritten. We now need to tell vim what to profile
""
"":profile func *
"":profile file *
""This says to profile all functions and all script files. Overkill, perhaps. Now, you should do things that make vim act slowly. They are being profiled in the background. Once you have concluded, end the profiling.
""
"":profile pause
""And quit vim. Now, read the profile.log file and see what's slow. Note that this is for slow running inside of vim. If vim is slow to start up (a different problem), you should start vim with
""
""vim --startuptime log.txt
"
""""""""""""""""profile vim  end }}}
":topleft cwindow
":topleft copen 1
