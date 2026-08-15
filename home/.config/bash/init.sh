# ============================================================
# Modular Bash configuration
# ============================================================

for config in \
    environment \
    history \
    options \
    completion \
    fzf \
    aliases \
    functions \
    prompt
do

    file="$HOME/.config/bash/${config}.sh"

    [[ -r "$file" ]] && source "$file"

done

unset config file

