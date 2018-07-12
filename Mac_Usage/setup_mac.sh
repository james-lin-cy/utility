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

echo "===> Copy and backup .vimrc"
if [ -f "$HOME/.vimrc" ]; then
    mv $HOME/.vimrc $HOME/.vimrc.org
fi
cp /tmp/utility/Mac_Usage/.vimrc $HOME/


echo "===> Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "===> Install pyenv pipenv"
brew install pyenv pipenv

echo "===> Install casks: clyang-welly sublime-text iterm2 sourcetree macs-fan-control"
brew cask install clyang-welly sublime-text iterm2 sourcetree macs-fan-control

echo "===> Make link Sublime Text(subl) to /usr/local/bin/subl"
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

echo "===> Setup Sublime Text"
echo '{
	"font_size": 18,
	"ignored_packages":
	[
		"Vintage"
	],
	"tab_size": 4,
	"translate_tabs_to_spaces": true,
}' > $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings


echo "===> Install brew cask fonts"
brew tap homebrew/cask-fonts
brew cask install font-source-han-sans font-source-code-pro
