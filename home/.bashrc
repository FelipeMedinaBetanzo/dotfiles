# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


# =========================================================
# FELIPE BASH CONFIG
# =========================================================

# ---------- HISTORY ----------
HISTSIZE=10000
HISTFILESIZE=20000

# No guardar comandos duplicados o espacios iniciales
HISTCONTROL=ignoreboth:erasedups

# Agregar al historial, no sobrescribirlo
shopt -s histappend

# Guardar historial después de cada comando
PROMPT_COMMAND="history -a; history -n${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# Fecha en history
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S  "


# ---------- BASH BEHAVIOUR ----------

# Corregir errores pequeños al usar cd
shopt -s cdspell

# ** incluye subdirectorios
shopt -s globstar

# Ignorar mayúsculas/minúsculas al completar
bind 'set completion-ignore-case on'

# Mostrar opciones inmediatamente si hay varias
bind 'set show-all-if-ambiguous on'

# Completar con TAB aunque haya varias coincidencias
bind 'TAB:menu-complete'

# Flecha arriba/abajo busca según lo escrito
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


# ---------- COLORS ----------

export CLICOLOR=1

alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -lah --icons=auto --group-directories-first'
alias la='eza -a --icons=auto --group-directories-first'
alias lt='eza --tree --level=2 --icons=auto'

alias cat='bat --paging=never'

alias grep='grep --color=auto'


# ---------- NAVIGATION ----------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cls='clear'


# ---------- SYSTEM ----------

alias sys='systemctl'
alias sysu='systemctl --user'

alias jctl='journalctl'
alias ports='ss -tulpn'

alias dfh='df -h'
alias duh='du -h'

alias reload='source ~/.bashrc'


# ---------- FEDORA ----------

alias update='sudo dnf upgrade --refresh'
alias install='sudo dnf install'
alias search='dnf search'

alias pods='podman ps'
alias podsa='podman ps -a'
alias images='podman images'


# ---------- GIT ----------

alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias glog='git log --graph --decorate --oneline --all'

# >>> FELIPE BASH CONFIG >>>

if [[ -r "$HOME/.config/bash/init.sh" ]]; then
    source "$HOME/.config/bash/init.sh"
fi

# <<< FELIPE BASH CONFIG <<<

alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

