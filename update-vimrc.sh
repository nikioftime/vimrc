#!/bin/bash

#copy vimrc to ~/.vimrc
echo "Replacing existing .vimrc"

[ -f ~/.vimrc ] && rm ~/.vimrc
cp $(dirname $0)/.vimrc ~

echo
echo "----------------------------------------"
echo

#check if pathogen needs to be installed
echo "Checking pathogen.vim installation"
if [ ! -f ~/.vim/autoload/pathogen.vim ]
then
   echo "pathogen.vim not found. Installing pathogen.vim"
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
   echo "pathogen.vim installed"
else
   echo "pathogen.vim found!"
fi
echo
echo "----------------------------------------"
echo

#check plugins
echo "Checking plugins"
echo

while read -r NAME REPO; do
   echo "Checking $NAME"
   if [ ! -d ~/.vim/bundle/$NAME ]
   then
      echo "$NAME not found. Installing $NAME"
       cd ~/.vim/bundle
       git clone --recursive $REPO
      echo "$NAME installed"
   else
      echo "$NAME found! Rebasing from master."
       cd ~/.vim/bundle/$NAME
       git pull --rebase
      echo "$NAME updated"
   fi
   echo
done < $(dirname $0)/plugins
echo "----------------------------------------"
echo

echo "Vim install complete!"
