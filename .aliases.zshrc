
alias h=history
alias ll="ls -al"
alias l="ls -altr"
alias c=clear
#alias mygrep='find . -name "*.sv*" | xargs rg  '
#alias grepdir='grep --include \*.sv\*  -R '
## path, line, column or match
##red, blue, green, cyan, magenta, yellow, white or black
## fg, bg or style
alias grep=" rg --colors 'match:fg:cyan' --colors 'path:fg:yellow'  --ignore-file $HOME/.ignore"
alias firefox='firefox -P "My Profile" --no-remote &'

#perforce alias
alias pf='p4 filelog '
alias pe='p4 edit '
alias ps'p4 submit '
alias po='p4 opened '
alias pd='p4 diff '

#export VIMRUNTIME=~/.local/usr/local/share/vim/vim82
#export VIM=~/.local/usr/local/share/vim/vim82
#export VIMRUNTIME=/projects/tomahawk4e_mmu_dv2/shekhara/debug/vim/runtime
#export VIM=/projects/tomahawk4e_mmu_dv2/shekhara/debug/vim/runtime
#alias vim 
#alias gv='/usr/bin/gvim'
#alias gn='/tools/bin/gvim'
alias gn='/tools/oss/packages/x86_64-rhel6/vim/8.2-p1/bin/gvim'
alias gv='~/.local/usr/local/bin/gvim'
#alias v=vim
alias v='/tools/oss/packages/x86_64-rhel6/vim/8.2-p1/bin/vim'

alias top=htop
alias opendve='psh dve &'
alias opendvecov='psh dve -cov & '

export ausr=shekhara

alias openverdi='sub psh verdi -guiConf /projects/tomahawk4e_mmu_dv2/$ausr/abc.conf -ssf '
alias mailx='pwd | mail -s "work done at " $ausr'
alias cargo='~/.cargo/bin/cargo'
alias clang='/tools/oss/packages/x86_64-rhel6/llvm/9.0.1/bin/clang'
function cd () { 
  chdir $1
  if [ $? -eq 0 ]; then
    ls 
  fi
}

function  createtemplatetest () { 
  mkdir $1 
  cd $1 
  ln -s ../Makefile Makefile 
  cp ../$2/test.* . 
  p4 add -t symlink Makefile
  p4 add test.sv test.cfg 
  sed -i s/$2/$1/g test.sv 
  cd .. 
}
#
if ((  ${+projclient} )); then
#  echo "default client $projclient"
else 
  export projclient=TH2_mmu_shekhara_269
#  echo "no projclient so setting projclient TH2_mmu_shekhara_269"
fi
alias g='gn --servername $projclient --remote-tab-silent '


#common areas

if (( ${+projectname} )); then
  #echo "projectname is set to $projectname"
else 
  #default project name
  export projectname=tomahawk5
  #  echo "setting new projectname $projectname"
fi
#FIXME 
  #export projectname=tomahawk4gt

if (( ${+projectdir} )); then
  #echo "projectdir is set to $projectdir"
else 
  #default project dir
  export projectdir=tomahawk4e_mmu_dv2
  #export projectdir="tomahawk5_mmu_dv4";
  #  echo "setting new projectdir $projectdir"
fi


export th2ws='/projects/tomahawk2_mmu_dv2/$ausr'
export th3ws='/projects/tomahawk3_mmu_dv2/$ausr'
export td4ws='/projects/trident4_dv2/$ausr'
export th4ws="/projects/tomahawk4_mmu_dv1/$ausr"
export th4ews="/projects/tomahawk4e_mmu_dv2/$ausr"
export th5ws="/projects/tomahawk5_mmu_dv4/$ausr"

export regr_mainsch='/projects/tomahawk4gt_mmu_regr2/ntswmmu3/$projectname/tomahawk4gt_mmu_mainsch'
export regr_results='/projects/ntsw-dv3/regression/$projectname/mmu/'
export rel='/projects/ntsw-dv/release'
alias dev='cd $th4ews'

#common env paths
export projectroot="/projects/$projectdir/$ausr/$projclient/$projectname"
export dv="$projectroot/dv"
export mmu="$projectroot/dv/mmu"
export mmutb="$projectroot/dv/mmu/tb"
export mmubase="$projectroot/dv/mmu/common/mmu_base"
export mmutoptest="$projectroot/dv/mmu/mmu_top/test"
export toptb="$projectroot/dv/top/tb"
export tpl="$projectroot/dv/mmu/doc"
export script="$projectroot/dv/script"
export mmuslam="$projectroot/dv/top/tb/template/mmu_generated_files"
export mmutg="$projectroot/dv/mmu/common/mmutg"
export reg="$projectroot/regsfile"
export sae="$dv/top/tb/sae"
export rtl="$projectroot/rtl"
export rtlthdo="$projectroot/rtl/mmu/thdo"
export rtlreg="$projectroot/rtl/mmu/regsfile"
export cmicdv="$projectroot/ip_cores/cmicd/dv"
export asserttpl="$dv/../doc/mmu/assertions/"
#
export cmn="$projectroot/dv/mmu/common"
export epmod="$projectroot/dv/mmu/common/mmuep_uvm"
export init="$projectroot/dv/mmu/common/mmu_init"
#
function buglabel {
p4 -d "label" label  $1 
cd $dv/../ 
p4 labelsync -l $1 ...
}
function  srca () {
 export projclient=$1 
 source ~/.aliases.zshrc
 cd $dv
}

##common tools path /commands
alias  tpl='psh $dv/script/tplEditor/tplEditor '
#
function  myctags () { 
  cd $mmu 
  if [ $? -eq 0 ]; then
    rm tag* 
    find $mmu $dv/common $toptb/template  /tools/vcs/2019.06-SP1-1/etc/uvm-1.2  $dv/lib/plus_args_handler $dv/lib/nsx_base $dv/lib/nsx_reg $dv/lib/base $dv/lib/crc $dv/lib/base $dv/lib/port_property $dv/lib/uvm/csg_base $dv/lib/uvm/mmu_slam  -name "*.sv*" |tee tag_file.f 
    ctags -aVL tag_file.f 
    ctags -aRV  $reg/fullchip_regsfile/mmu_memories1_tab.svh  $reg/fullchip_regsfile/mmu_reg.svh $rtl/mmu/mmu_param_defs.v  $reg/chip*svh $reg/socregs_def.vh 
  fi
}
if [ "$projclient" != "TH2_mmu_shekhara_269" ]; then
  if [ -f $mmu/tags ]; then 
  else
    echo "creating ctags as they don't exist for projclient $projclient"
    myctags
  fi
fi
#
alias openvdb='sub psh dve -cov -full64 -covdir '
alias curspace='projrpt $projectdir'
#
alias runtest=' psh roc -uvm   -nc "-ucli -do $HOME/fsdb1.tcl" '
##alias runregr 'cd $tpl ; sub time psh regress -t \!$_release -bench=\!$ -cov_code -cov_func'
#alias runregr ' sub time psh regress -uvm   -t \!$ '
#alias mmutopcmp 'cd $toptb/mmu_top/ ; sub time psh make mmu_top_partcomp'
#
#alias ebptsrtlchk 'cd $rtl/shared ; p4 sync -n clsch/... pksch/... ebshp/... prt_sch/... eipts/... ;  cd $rtl/mmu ; p4 sync -n ebpts/... ptsch/... regsfile/mmu_ebpts.regs regsfile/mmu_ptsch.regs regsfile/mdf/mmu_ptsch.ppl regsfile/mdf/mmu_ebpts* '
#alias ebptsrtlsync 'cd $rtl/shared ; p4 sync clsch/... pksch/... ebshp/... prt_sch/... eipts/... ;  cd $rtl/mmu ; p4 sync ebpts/... ptsch/... regsfile/mmu_ebpts.regs regsfile/mmu_ptsch.regs regsfile/mdf/mmu_ptsch.ppl regsfile/mdf/mmu_ebpts* '
#alias ebptsrtlmake ' cd $rtl/shared/clsch ; psh make;  cd $rtl/shared/pksch ; psh make; cd $rtl/shared/ebshp ; psh make;cd $rtl/shared/eipts ; psh make; cd $rtl/mmu/ebpts ; psh make; cd $rtl/mmu/ptsch ; psh make '
#
#alias mainrtlchk  'ebptsrtlchk ; cd $rtl/mmu ; p4 sync -n mtro/... qsch/... ppsch/... ; cd regsfile ; p4 sync -n mmu_ppsch*  mmu_qsch*  mmu_mtro*  mdf/mmu_ppsch*  mdf/mmu_mtro*  mdf/mmu_qsch*   '
#alias mainrtlsync  'ebptsrtlsync ; cd $rtl/mmu ; p4 sync mtro/... qsch/... ppsch/... ; cd regsfile ; p4 sync  mmu_ppsch*  mmu_qsch*  mmu_mtro*  mdf/mmu_ppsch*  mdf/mmu_mtro*  mdf/mmu_qsch*  '
#alias mainrtlmake  'ebptsrtlmake;  cd $rtl/mmu/mtro ; psh make ;  cd $rtl/mmu/ppsch ; psh make ;    cd $rtl/mmu/qsch ; psh make ;'
#
#alias maindvchk 'cd $dv/mmu ; p4 sync -n mmu_ebpts/... mmu_qsch/... mmu_epmodel/... mmu_mainsch/... mmu_ppsch/... mmu_mtro/... mmu_sch_common/... common/mmu_sch/... common/mmuep_uvm/... common/mmu_toq/... common/mmu_init/mmu_qsch/... common/mmu_init/mmu_mtro/... common/mmu_init/mmu_ppsch/...  common/mmu_init/mmu_ptsch/... common/mmu_init/mmu_sch/... common/mmu_init/mmu_ebpts/...'
#alias maindvupd 'cd $dv/mmu ; p4 sync mmu_ebpts/... mmu_qsch/... mmu_epmodel/... mmu_mainsch/... mmu_ppsch/... mmu_mtro/... mmu_sch_common/... common/mmu_sch/... common/mmuep_uvm/... common/mmu_toq/... common/mmu_init/mmu_qsch/... common/mmu_init/mmu_mtro/... common/mmu_init/mmu_ppsch/...  common/mmu_init/mmu_ptsch/... common/mmu_init/mmu_sch/... common/mmu_init/mmu_ebpts/... '
#
#alias checkupdtb 'cd $dv ; p4 sync -n common/... top/tb/sae/... top/tb/template/... ;  ' 
#alias checkupdsch 'cd $dv ; p4 sync -n mmu/common/... mmu/mmu_ebpts/... mmu/mmu_sch_common/... mmu/doc/... mmu/tb/...;  '
#
#alias genlst 'cd $tpl ; psh trac -project TOMAHAWK3 -regress -fc_summary\!$'  # for fc summary
##psh make thdo : to generate lst file
#
#
#alias cmpnrun 'cmptb \!$; runtest 1'
#
#alias runtestdve 'psh roc -nu 1 -nc "+dump_top +dump_on " '
#
##alias openverdi 'sub psh verdi +ignorefileext+c -nologo -f *.xl -ssf \!$ &'
#export NOVAS_GUICONF /home/sa956222/novas.conf 
##export NOVAS_RC /home/sa956222/bin/novas_sav.rc 
##alias wave '/tools/bin/bsub -q sj-Intsw -R rhel60 -Is "psh verdi  -ssf \!$  -sswr ../thdo_io.rc -rcFile ../novas.rc -ssr ../thdo.ses -autoalias -nologo " &'
#alias wave '/tools/bin/bsub -q sj-Intsw -R rhel60 -Is "psh verdi  -ssf \!$  -autoalias -nologo -rcFile ~/ebpts.rc -ssr ~/verdi.ses " &'
##alias wave1 '/tools/bin/bsub -q sj-Intsw -R rhel60 -Is "psh verdi  -ssf \!$  -sswr ../thdo_io.rc  -autoalias -nologo " &'
#alias wave1 '/tools/bin/bsub -q sj-Intsw -R rhel60 -Is "psh verdi  -ssf \!$    -autoalias -nologo " &'
#
#
#
#
#alias my_term 'bsub -q sj-Intsw -R rhel60 konsole &'
#
#alias vncdbl 'vncserver -depth 24 -geometry 3780x1050'
#alias vncsing 'vncserver -depth 24 -geometry 1890x1050'
#alias vnclaptop 'vncserver -depth 24 -geometry 1366x768'
#alias lsf_sun 'bsub -I -R ultra -q sj-Intsw'
#alias bsub64 ' bsub -I -R r64bit -q sj-M32ntsw-emulation'
#alias bsub64a ' bsub -I -R r64bit -q sj-ntsw'
#alias bsubi ' /tools/bin/bsub -q sj-Intsw -R rhel60 -Is '
#alias showmounts 'ypcat -k auto_projects | sort'
#
### vncserver -kill :<id>
#alias my_verdi 'psh sub verdi  +ignorefileext+c -chmod 777 -nologo -ssy -ssv -autoalias -sv -lib work -ssf \!$ '
#alias my_vericom 'psh sub vericom +ignorefileext+c -chmod 777 -ssy -ssv -autoalias -sv -f \!$'
#alias my_run "psh roc -num 1 -nc '-ucli -do ~/fsdb.tcl'" 
#
#alias vlist 'vncserver -list'
#alias vkill 'vncserver -kill :\!$'
#alias myterm 'xterm -sl 10000 -bg black -fg white &'
#
#
##  Testbench - psh make mmu_<blockname>_partcomp MY_SV_OPT="+define+THDI_COVER_OFF"
##  Test      - psh make partcomp_test MY_SV_OPT="+define+THDI_COVER_OFF"
#

