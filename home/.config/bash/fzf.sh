# ============================================================
# FZF
# ============================================================

export FZF_DEFAULT_OPTS="
--height=60%
--layout=reverse
--border
--info=inline
"

# Usar fd para búsquedas si está disponible
if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Fedora instala estos bindings con el paquete fzf
for file in \
    /usr/share/fzf/shell/key-bindings.bash \
    /usr/share/doc/fzf/shell/key-bindings.bash
do
    [[ -r "$file" ]] && source "$file" && break
done

