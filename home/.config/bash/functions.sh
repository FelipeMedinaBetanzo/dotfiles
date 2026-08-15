# ============================================================
# Functions
# ============================================================

# Crear directorio y entrar inmediatamente
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extraer archivos automáticamente
extract() {

    if [[ ! -f "$1" ]]; then
        echo "Archivo no encontrado: $1"
        return 1
    fi

    case "$1" in

        *.tar.bz2) tar xjf "$1" ;;
        *.tar.gz)  tar xzf "$1" ;;
        *.tar.xz)  tar xJf "$1" ;;
        *.tar.zst) tar --zstd -xf "$1" ;;
        *.bz2)     bunzip2 "$1" ;;
        *.gz)      gunzip "$1" ;;
        *.tar)     tar xf "$1" ;;
        *.zip)     unzip "$1" ;;
        *.7z)      7z x "$1" ;;

        *)
            echo "Formato no reconocido: $1"
            return 1
            ;;

    esac
}

# Encontrar un proceso
psf() {
    ps aux | grep -i --color=always "$1" | grep -v grep
}

# Buscar archivos
ff() {

    if command -v fd >/dev/null 2>&1; then
        fd "$1"
    else
        find . -iname "*$1*"
    fi
}

# Buscar texto
rgf() {

    if command -v rg >/dev/null 2>&1; then
        rg --hidden --glob '!.git' "$@"
    else
        grep -R "$@" .
    fi
}

# Puerto ocupado
port() {

    if [[ -z "${1:-}" ]]; then
        echo "Uso: port 8080"
        return 1
    fi

    ss -tulpn | grep ":$1 "
}

# Información rápida del sistema
sysinfo() {

    echo
    echo "HOST"
    echo "--------------------------------"
    hostnamectl

    echo
    echo "CPU"
    echo "--------------------------------"
    lscpu | grep -E 'Model name|CPU\(s\)|Thread|Core'

    echo
    echo "RAM"
    echo "--------------------------------"
    free -h

    echo
    echo "DISCOS"
    echo "--------------------------------"
    lsblk

    echo
    echo "RED"
    echo "--------------------------------"
    ip -br addr
}

# Buscar y entrar a directorio usando fzf
cdf() {

    command -v fzf >/dev/null || {
        echo "fzf no está instalado"
        return 1
    }

    local dir

    if command -v fd >/dev/null 2>&1; then
        dir=$(fd --type d --hidden --exclude .git | fzf)
    else
        dir=$(find . -type d 2>/dev/null | fzf)
    fi

    [[ -n "$dir" ]] && cd "$dir"
}

# Mostrar certificados TLS
tlscheck() {

    if [[ -z "${1:-}" ]]; then
        echo "Uso: tlscheck dominio.com"
        return 1
    fi

    openssl s_client \
        -connect "$1:443" \
        -servername "$1" \
        </dev/null 2>/dev/null |
        openssl x509 \
            -noout \
            -subject \
            -issuer \
            -dates
}

