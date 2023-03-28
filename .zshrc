export ZSH="/Users/jorisooms/.oh-my-zsh"

export VISUAL=nvim
export EDITOR=$VISUAL


export TERM="xterm-256color"

SPACESHIP_PROMPT_ADD_NEWLINE=false
ZSH_THEME="spaceship"

export BAT_THEME="Tokyo-Night"

plugins=(git gitignore macos  zsh-z zsh-autosuggestions web-search ruby rails)

source $ZSH/oh-my-zsh.sh

alias vim="$(which nvim)"
alias gs="git status"
alias lip="ifconfig | grep 192"
alias cat="bat"
alias dev="~/Development"

alias lg="lazygit"
alias mdb="ulimit -n 4096 && mongod --config /opt/homebrew/etc/mongod.conf"
alias psrc="nvm use && source ~/Development/__pelckmans/pelckmans_profile"
alias tm="tmux a || tmux"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

mcd () {
  mkdir -p "$@" && cd "$@"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$(yarn global bin)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init - zsh)"
eval "$(starship init zsh)"

export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=~/.local/bin:"$PATH"

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
