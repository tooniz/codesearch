#! /bin/sh 

export P4PORT="p4_port" 
export P4CLIENT="p4_client"
export CSEARCHINDEX="$HOME/.index" 
export TREE="$HOME/path_to_tree" 
export LSF_SERVERDIR="/usr/local/lsf/etc" 
export LSF_LIBDIR="/usr/local/lsf/lib" 
 
p4=/usr/local/bin/p4 

cindex=$HOME/bin/cindex 

mailto=tooniz@gmail.com

qsub="/usr/local/bin/qsub --projectMode direct -I -q QUEUE -P PROJECT"

cd $TREE

$p4 -d `/bin/pwd` sync ... || { 
    echo "pwd: $(pwd)" | mail -s "p4 sync failed!" $mailto 
    exit 1 
}

$qsub $cindex -no-follow-symlinks || { 
    echo "pwd: $(pwd)" | mail -s "cindex failed!" $mailto 
    exit 1 
}

chmod ugo+r $CSEARCHINDEX 