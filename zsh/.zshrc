# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Zsh configuration file.
stty -ixon <$TTY >$TTY

## Add local files to PATH
PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin

## Loading modules.
load_module() {
  local gh_user="$1"
  local name="$2"
  local extension="$3"
  local filename="$name.$extension"
  local dir="$HOME/.config/zsh/$name"
  local filepath="$dir/$filename"
  mkdir -p "$HOME/.config/zsh"
  if type git >/dev/null && ! [ -f "$filepath" ]; then
    echo "Plugin '$name' is not found, installing..."
    git clone --depth=1 "https://github.com/$gh_user/$name.git" "$dir"
  fi
  if [ -f "$filepath" ]; then
    source "$filepath"
  fi
}

load_module romkatv powerlevel10k zsh-theme
load_module zsh-users zsh-autosuggestions zsh
load_module zsh-users zsh-syntax-highlighting zsh
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
[[ ! -f ~/.config/zsh/.zshalias ]] || source ~/.config/zsh/.zshalias
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

if type direnv >/dev/null; then
  eval "$(direnv hook zsh)"
fi

## Add completion functions to fpath
fpath=( ~/.config/zsh/completions "${fpath[@]}" )

## Variables by default
[ -z "$PAGER" ] && export PAGER=less
[ -z "$MANPAGER" ] && export MANPAGER='nvim +Man!'
[ -z "$SUDO_PROMPT" ] && export SUDO_PROMPT="Enter password: "
export SHELL="$(which zsh)"

## Enabling history.
export SAVEHIST=HISTSIZE=10000
export HISTFILE=~/.config/zsh/.zhistory
setopt histignorealldups
setopt histignorespace
setopt histreduceblanks
setopt share_history
setopt inc_append_history
setopt hist_save_no_dups hist_ignore_dups       # eliminate duplicate entries in history
#setopt correctall 
unsetopt correct_all


## Autocomplete initialization & automatic rehash & manual rehash.
autoload -U compinit && compinit
zstyle ":completion:*" rehash true
setopt nohashdirs
rehash

## Other shell options.
setopt autocd
setopt interactivecomments
zstyle ':completion:*' menu select
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

## Stabilizing title
case $TERM in
  xterm*)
    precmd() { print -Pn "\e]0;$(whoami) [$(print -rD $PWD)] \a"; }
    #precmd() { print -Pn "\e]0;$(whoami) [$(print -rD $PWD)] @ $(hostname)\a"; }
    ;;
esac

function ]() {
git commit -m "$*"
}

## Enables 'cd -$n' command.
setopt autopushd
setopt pushdminus
setopt pushdignoredups
setopt pushdsilent

## Commands options
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
--multi
--height=50%
--layout=reverse
--prompt='λ '
--separator=
--pointer='-'
--marker='+'
--ansi
--tabstop=4
--bind=ctrl-space:toggle,ctrl-p:toggle-preview
--color=fg:#d3c6aa,bg:#1e2327,hl:#e67e80
--color=fg+:#dbbc7f,bg+:#4c3743,hl+:#e67e80
--color=info:#dbbc7f,prompt:#a7c080,pointer:#7fbbb3
--color=marker:#d3c6aa,spinner:#7fbbb3,header:#d699b6"

#--bind=tab:down,btab:up,ctrl-space:toggle,ctrl-p:toggle-preview
#
export FZF_CTRL_R_OPTS="--color=fg:#4b565c"
function ssh() {
  if [ "$#" -ne "0" ]; then
    command ssh "$@"
  else
    tmp_ssh_hostname="$({
    awk -F'[ ,:]' '/^[0-9a-zA-Z]/{sub(/\[/,"",$1); sub(/\]/,"",$1); print $1}' ~/.ssh/known_hosts
    cat ~/.ssh/config | grep -oP '^Host\s+\K[^*]$'
  } | fzf --height=30% --layout=reverse)"
if [ -n "$ZSH_VERSION" ]; then
  print -s "ssh $tmp_ssh_hostname"
else
  history -s "ssh $tmp_ssh_hostname"
fi
ssh $tmp_ssh_hostname
  fi
}

## Key bindings.
bindkey -v
typeset -A key
bindkey '^E' autosuggest-accept
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init () {
  printf '%s' "${terminfo[smkx]}"
}
function zle-line-finish () {
    printf '%s' "${terminfo[rmkx]}"
}
zle -N zle-line-init
zle -N zle-line-finish
fi

ctrl-z-fg() {
fg
}
zle -N ctrl-z-fg
bindkey '^Z' ctrl-z-fg

## Source local config
if [ -f "$HOME/.config/zsh/local.zsh" ]; then
  source "$HOME/.config/zsh/local.zsh"
fi
#stty -ixon  # Disable ^S
#eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# foot staff
precmd() {
    print -Pn "\e]133;A\e\\"
}
function precmd () {
    if ! builtin zle; then
        print -n "\e]133;D\e\\"
    fi
}
function preexec () {
    print -n "\e]133;C\e\\"
}
function clear-screen-keep-sb () {
    print -n ${(pl:LINES-BUFFERLINES::\n:)}
    zle .clear-screen
}
zle -N clear-screen clear-screen-keep-sb

function ddg() {
    local query=$(printf '%s' "$*" | sed 's/ /+/g')
    w3m "https://duckduckgo.com/?kp=-1&kl=wt-wt&q=$query"
}
