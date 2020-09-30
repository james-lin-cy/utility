# enables color in the terminal bash shell
export CLICOLOR=1
# sets up the color scheme for list
export LSCOLORS=ExFxCxDxBxegedabagacad
# enables color for iTerm
# export TERM=xterm-color
# export TERM="xterm-color"
export term=screen-256color
PS1='[\[\e[0;33m\]\A\[\e[0m\]][MBP12]:\[\e[0;34m\]\W\[\e[0m\]\$ '
# sets up proper alias commands when called
alias ll='ls -alh'
alias la='ls -a'
alias ls="ls -GFv"
alias vi='vim'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# for python
if [ ! -z $(which pyenv) ]; then
    PATH="$HOME/.pyenv/shims:$PATH"
fi
if [ ! -z $(which pipenv) ]; then
    export PIPENV_VENV_IN_PROJECT=1
fi

source ${HOME}/.myrc