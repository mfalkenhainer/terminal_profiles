# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fwalch"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Vars
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/Users/mfalkenhainer/.local/bin:$PATH"

export CODE="$HOME/code"
export FE="$CODE/application-frontend"
export BE="$CODE/application-backend"

export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"


export MY_NGROK_DOMAIN=""

# Aliases

## Github
alias gs='git status'
alias gb='git branch'
alias gl='git log'
alias gd='git diff'
alias git-cleanup="git fetch --prune && git branch -D $(git for-each-ref --format '%(if:equals=gone)%(upstream:track,nobracket)%(then)%(refname:short)%(end)' refs/heads/)"

## LS
alias la='ls -a1'
alias ll='ls -al'

# Other
alias ezsh='nvim ~/.zshrc && omz reload'
alias restart-nginx='{ sudo nginx -s stop || echo "nginx not running?" } && sudo nginx'
alias start-ngrok='ngrok http --domain='

alias aws-creds-staging='$(aws-sso-creds --profile staging export)'
alias aws-creds-prod='$(aws-sso-creds --profile production export)'
alias reset-aws-creds='export AWS_ACCESS_KEY_ID=;AWS_ACCESS_KEY=;export AWS_SECRET_ACCESS_KEY=;export AWS_SESSION_TOKEN='
alias be-enter='docker exec -it application-backend-application-backend-1 bash'
alias be-up='make compose-up-dev'
alias be-down='make compose-down-dev'

alias diffview='nvim -c ":DiffviewOpen"'
