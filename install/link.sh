#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo "creating symlinks"
linkables=$( ls -1 -d **/*.symlink )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
		echo "creating symlink for $file"
		if [ -f $target ] || [ -d $target ];
		then
			echo "$target exists! No symlink created."
		else
			ln -s $DOTFILES/$file $target
		fi
done
