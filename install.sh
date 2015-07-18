#!/bin/bash

ThisDir=$(dirname $0 | xargs realpath --relative-to ~)
Bak=bak_$(date +%Y-%m-%d_%H-%M)

function install()
{
    mv $2 $2.$Bak
    ln -s $ThisDir/$1 $2
}

cd ~
install vimrc .vimrc
if [[ -d .vim ]]; then
    mv .vim .vim.$Bak
    mkdir .vim
    mkdir .vim/bundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
echo "Look at ~/.vimrc for instructions to install Vundle"
echo " * Start vim and execute :VundleInstall"
echo " * Enter .vim/bundle/YouCompleteMe, RTFM, and execute ./install.sh --clang-completer"

install gitconfig .gitconfig
install gitk .gitk

