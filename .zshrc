ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

alias be="bundle exec"
alias bower="noglob bower"
alias pdflatex="mkdir -p build; pdflatex -output-directory build"

DISABLE_CORRECTION="true"

DISABLE_AUTO_UPDATE="true" #Stop breaking my shit!

plugins=(git gem rails ruby heroku bundler brew pass npm)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

PATH=$PATH:/usr/local/share/npm/bin
