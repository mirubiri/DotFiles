# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(fzf zsh-completions fast-syntax-highlighting zsh-autosuggestions brew colored-man-pages docker docker-compose bundler alias-tips git git-extras z)

#  Adittional Zsh autocompletions 
# --------------------------------
autoload -U compinit -u && compinit -u

#  Oh-My-Zsh entry point
# -----------------------
source $ZSH/oh-my-zsh.sh

#  FZF Setup
# -----------
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-messages"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_BASE="/usr/local/bin/"
export FZF_DEFAULT_OPTS='--height 10 --layout=reverse --border'

fzf-gb() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
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
alias gb="fzf-gb"
alias ls="exa"
alias e="emacsclient -t"
alias rake="noglob rake"

#  Shell Hooks
# -------------
chpwd() {
    ls
}
