# ============================================================
# Bash History
# ============================================================

HISTSIZE=50000
HISTFILESIZE=100000

# No guardar duplicados ni comandos iniciados con espacio
HISTCONTROL=ignoreboth:erasedups

# Comandos separados por líneas
shopt -s cmdhist
shopt -s lithist
shopt -s histappend

# Timestamp
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S  "

# Guardar historial inmediatamente
__bash_history_sync() {
    history -a
    history -n
}

if [[ "${PROMPT_COMMAND:-}" != *"__bash_history_sync"* ]]; then
    PROMPT_COMMAND="__bash_history_sync${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi

