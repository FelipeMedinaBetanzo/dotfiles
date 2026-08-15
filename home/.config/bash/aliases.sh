# ============================================================
# Aliases
# ============================================================

# -----------------------------
# Navegación
# -----------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias cls='clear'

# -----------------------------
# LS / EZA
# -----------------------------

if command -v eza >/dev/null 2>&1; then

    alias ls='eza --group-directories-first --icons=auto'
    alias ll='eza -lah --group-directories-first --icons=auto --git'
    alias la='eza -a --group-directories-first --icons=auto'
    alias l='eza -lh --group-directories-first --icons=auto'

    alias tree='eza --tree --icons=auto'
    alias tree2='eza --tree --level=2 --icons=auto'
    alias tree3='eza --tree --level=3 --icons=auto'

else

    alias ls='ls --color=auto'
    alias ll='ls -lah'
    alias la='ls -A'

fi

# -----------------------------
# BAT
# -----------------------------

if command -v bat >/dev/null 2>&1; then
    alias cat='bat --paging=never'
    alias catp='bat'
fi

# -----------------------------
# GREP
# -----------------------------

alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'

# -----------------------------
# Fedora
# -----------------------------

alias update='sudo dnf upgrade --refresh'
alias install='sudo dnf install'
alias remove='sudo dnf remove'
alias search='dnf search'
alias pkg='dnf info'

# -----------------------------
# systemd
# -----------------------------

alias sys='systemctl'
alias sysu='systemctl --user'

alias sysstart='sudo systemctl start'
alias sysstop='sudo systemctl stop'
alias sysrestart='sudo systemctl restart'
alias sysstatus='systemctl status'

alias jctl='journalctl'
alias jfollow='journalctl -f'
alias jboot='journalctl -b'

# -----------------------------
# Networking
# -----------------------------

alias ports='ss -tulpn'
alias listening='ss -lntup'
alias ips='ip -br address'
alias routes='ip route'
alias connections='nmcli connection show'

# -----------------------------
# Disco / memoria
# -----------------------------

alias dfh='df -hT'
alias duh='du -h'
alias mem='free -h'
alias disks='lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINTS'

# -----------------------------
# Procesos
# -----------------------------

alias psg='ps aux | grep -v grep | grep -i'

# -----------------------------
# Git
# -----------------------------

alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'

alias gc='git commit'
alias gcm='git commit -m'

alias gp='git push'
alias gpl='git pull'

alias gb='git branch'
alias gba='git branch -a'

alias gd='git diff'
alias gds='git diff --staged'

alias gl='git log --oneline --decorate'
alias glog='git log --graph --oneline --decorate --all'

alias gco='git checkout'
alias gsw='git switch'

# -----------------------------
# Podman
# -----------------------------

if command -v podman >/dev/null 2>&1; then

    alias p='podman'
    alias ps='podman ps'
    alias psa='podman ps -a'

    alias pi='podman images'

    alias plogs='podman logs'
    alias pexec='podman exec -it'

    alias pstats='podman stats'

fi

# -----------------------------
# Utilidades
# -----------------------------

alias reload='source ~/.bashrc'

alias path='echo "$PATH" | tr ":" "\n"'

alias now='date "+%Y-%m-%d %H:%M:%S"'

alias weather='echo "Usa tu herramienta meteorológica favorita :P"'

