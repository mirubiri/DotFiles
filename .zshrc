#  1. Path to oh-my-zsh installation
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
)


#  2. Additional Zsh autocompletions
# -----------------------------------
autoload -U compinit -u && compinit -u


#  3. Oh-My-Zsh entry point
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

# FZF: Killig processes
fzf-kill() {
    local pids
    pids=$(ps -ef | fzf -m --header-lines=1 | awk '{print $2}') &&
        echo $pids | xargs kill -9
}

#  Development tools
# -------------------
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
eval "$(hub alias -s)"


#  Shell config
# --------------
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -t"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH=$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin
export PATH=$PATH:~/Library/Python/3.7/bin


#  Aliases
# ---------
alias cat="bat"
alias e="emacsclient -t"
alias gb="fzf-gb"
alias gbd="fzf-gbd"
alias k="fzf-kill"
alias ls="exa"
alias rake="noglob rake"


#  Shell Hooks
# -------------
chpwd() { ls }
