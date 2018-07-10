#!/bin/bash

echo "===> Clone git repo to /tmp/utility"
git clone https://github.com/james-lin-cy/utility.git /tmp/utility

echo "===> Copy and backup .bash_profile"
if [ -f "$HOME/.bash_profile" ]; then
    mv $HOME/.bash_profile $HOME/.bash_profile.org
fi
cp /tmp/utility/Mac_Usage/.bash_profile $HOME/

echo "===> Copy and backup .vimrc"
if [ -f "$HOME/.vimrc" ]; then
    mv $HOME/.vimrc $HOME/.vimrc.org
fi
cp /tmp/utility/Mac_Usage/.vimrc $HOME/


echo "===> Install brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "===> Install pyenv pipenv"
brew install pyenv pipenv
