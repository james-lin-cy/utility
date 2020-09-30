#!/bin/bash

xcode-select -p
XCODE=$?
if [ ${XCODE} -ne 0 ]; then
  xcode-select --install
  echo "Start to install xcode commandline tool"
  exit ${XCODE}
fi

echo "===> Clone git repo to /tmp/utility"
git clone https://github.com/james-lin-cy/utility.git /tmp/utility
GIT_CLONE=$?
if [ ${GIT_CLONE} -ne 0 ]; then
  echo "git clone failure, error: ${GIT_CLONE}"
  exit ${GIT_CLONE}
fi

echo "===> Copy and backup .bash_profile"
if [ -f "${HOME}/.bash_profile" ]; then
    mv ${HOME}/.bash_profile ${HOME}/.bash_profile.org
	cp /tmp/utility/Mac_Usage/.bash_profile ${HOME}/
fi


echo "===> Copy and backup .vimrc"
if [ -f "${HOME}/.vimrc" ]; then
    mv ${HOME}/.vimrc ${HOME}/.vimrc.org
fi
cp /tmp/utility/Mac_Usage/.vimrc ${HOME}/

echo "===> Copy and backup .myrc"
MY_RC="${HOME}/.myrc"
if [ -f "${MY_RC}" ]; then
    mv "${MY_RC}" "${MY_RC}.org"
fi
cp /tmp/utility/Mac_Usage/.myrc ${HOME}/

echo "===> Install & setup oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
MY_ZSH_THEME="${HOME}/.oh-my-zsh/themes/my.zsh-theme"
if [ -f "${MY_ZSH_THEME}" ]; then
    mv "${MY_ZSH_THEME}" "${MY_ZSH_THEME}.org"
fi
cp /tmp/utility/Mac_Usage/my.zsh-theme ${MY_ZSH_THEME}
cp /tmp/utility/Mac_Usage/.zshrc ${HOME}

echo "===> Install brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "===> Install pyenv pipenv"
brew install pyenv pipenv

echo "===> Install casks: welly visual-studio-code iterm2 sourcetree macs-fan-control spotify"
brew cask install welly visual-studio-code iterm2 sourcetree macs-fan-control spotify

echo "========> Setup VS Code"
VSCODE_USER_FOLDER="${HOME}/Library/Application Support/Code/User/"
VSCODE_KEYBIND="${VSCODE_USER_FOLDER}keybindings.json"
if [ -f "${VSCODE_KEYBIND}" ]; then
    mv "${VSCODE_KEYBIND}" "${VSCODE_KEYBIND}.org"
fi
VSCODE_SETTINGS="${VSCODE_USER_FOLDER}settings.json"
if [ -f "${VSCODE_SETTINGS}" ]; then
    mv "${VSCODE_SETTINGS}" "${VSCODE_SETTINGS}.org"
fi
cp "/tmp/utility/VSCode/*" "${VSCODE_USER_FOLDER}"

echo "===> Install brew cask fonts"
brew tap homebrew/cask-fonts
brew cask install font-source-han-sans font-source-code-pro
