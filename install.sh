#! /bin/bash
Path=`pwd` 
cd ~
rm -rf .vim
rm -rf .vimrc
rm -rf .vimrc.locl
rm -rf .vimrc.bundles
rm -rf .vimrc.bundles.local
ln -s $Path/vim ~/.vim
ln -s $Path/vimrc ~/.vimrc
ln -s $Path/vimrc.local ~/.vimrc.local
ln -s $Path/vimrc.bundles ~/.vimrc.bundles
ln -s $Path/vimrc.bundles.local ~/.vimrc.bundles.local
