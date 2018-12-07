#! /bin/sh 

export CSEARCHINDEX="$HOME/.index" 
export TREE="$HOME/path_to_tree" 

git=/usr/local/bin/git

cindex=$HOME/.go/bin/cindex 

mailto=tooniz@gmail.com

cd $TREE 

$git status; $git pull

$cindex $TREE || { 

    echo "pwd: $(pwd) cindex failed!"

    exit 1 

} 

chmod ugo+r $CSEARCHINDEX 
