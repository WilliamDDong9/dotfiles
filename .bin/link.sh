#! /bin/bash

set -e

# add new packages here
# (folders in .dotfiles whose contents should be linked into ~/)
pkgs="bash git etc editors"

script_dir="$( cd $( dirname ${BASH_SOURCE[0]} ) && pwd )"
dots_dir=$script_dir/..
home_dir=$dots_dir/..

pushd $dots_dir >/dev/null
for pkg in $pkgs; do
    set +e
    for f in `ls -A $pkg`; do
        rm -r $home_dir/$f 2>/dev/null 
    done
    set -e
    stow $pkg
done
popd >/dev/null
