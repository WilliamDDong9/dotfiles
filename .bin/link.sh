#! /bin/bash

set -e

# add new packages here
# (folders in .dotfiles whose contents should be linked into ~/)
pkgs="bash git etc editors"


script_dir="$( cd $( dirname ${BASH_SOURCE[0]} ) && pwd )"
dots_dir=$script_dir/../


pushd $dots_dir >/dev/null
for pkg in $pkgs; do
    for f in `ls -A $pkg`; do
	rm -r $HOME/$f 2> /dev/null
    done
    stow $pkg
done
popd >/dev/null
