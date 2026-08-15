# ============================================================
# Bash behaviour
# ============================================================

# ** puede recorrer directorios recursivamente
shopt -s globstar

# cd corrige pequeños errores tipográficos
shopt -s cdspell

# mkdir/cd más cómodos
shopt -s autocd 2>/dev/null || true

# Incluir archivos ocultos en glob
shopt -s dotglob

# Actualizar tamaño de terminal
shopt -s checkwinsize

# TAB no distingue mayúsculas
bind 'set completion-ignore-case on'

# Mostrar opciones de inmediato
bind 'set show-all-if-ambiguous on'

# Colorear coincidencias
bind 'set colored-stats on'
bind 'set visible-stats on'

# Completar directorios con /
bind 'set mark-directories on'

# Flechas buscan según lo escrito
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Alt + flecha izquierda/derecha mueve por palabras
bind '"\e[1;3D": backward-word'
bind '"\e[1;3C": forward-word'

