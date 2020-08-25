#  Path to oh-my-zsh installation
# -----------------------------------
export ZSH=~/.oh-my-zsh

#  Theme & Plugins
# -----------------
ZSH_THEME="spaceship" #

plugins=(
    alias-tips
    brew #
    bundler
    colored-man-pages
    docker
    docker-compose
    fast-syntax-highlighting #
    fzf
    git
    git-extras
    z
    zsh-autosuggestions #
    zsh-completions #
		fzf-tab #
)


#  Additional Zsh autocompletions
# -----------------------------------
autoload -U compinit -u && compinit -u


#  Oh-My-Zsh entry point
# --------------------------
source $ZSH/oh-my-zsh.sh


#  FZF Setup
# -----------
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-messages"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_BASE="/usr/local/bin/"
export FZF_DEFAULT_OPTS='--height 20 --layout=reverse --border'

# FZF: Switching branches
fzf-gb() {
    local branches branch
    branch=$(git branch --all | grep -v HEAD | fzf +m) &&
        git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# FZF: Deleting branches
fzf-gbd() {
    local branches
    branches=$(git branch -l | sed "s/.* //" | fzf -m ) &&
        echo $branches | xargs git branch -D
}

# FZF: Killing processes
fzf-kill() {
    local pids
    pids=$(ps -ef | fzf -m --header-lines=1 | awk '{print $2}') &&
        echo $pids | xargs kill -9
}

bindkey -r '^t'
bindkey -r '^r'
bindkey '^f' fzf-file-widget
bindkey '^h' fzf-history-widget

#  Development tools
# -------------------
eval "$(direnv hook zsh)"
eval "$(hub alias -s)"

# ASDF version manager setup
. /usr/local/opt/asdf/asdf.sh

# ASDF Plugins
. ~/.asdf/plugins/java/set-java-home.zsh

#  Shell config
# --------------
export DIRENV_LOG_FORMAT=
export EDITOR="vim"
export VISUAL="vim"
export PATH=$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin
export PATH=$PATH:~/Library/Python/3.7/bin

#  Spaceship theme
# -----------------
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_CHAR_SYMBOL="\uf534"
export SPACESHIP_CHAR_COLOR_SUCCESS="white"
export SPACESHIP_PROMPT_SEPARATE_LINE="true"

#  Aliases
# ---------
alias cat="bat"
alias gb="fzf-gb"
alias gbd="fzf-gbd"
alias k="fzf-kill"
alias rake="noglob rake"
alias kafka_monitor="java --add-opens=java.base/sun.nio.ch=ALL-UNNAMED -jar ~/kafdrop/kafdrop-3.8.0.jar --zookeeper.connect=localhost:2181 --schemaregistry.connect=http://localhost:9090 --message.format=AVRO"
alias dl="lazydocker"

#  Shell Hooks
# -------------
chpwd() { ls }

