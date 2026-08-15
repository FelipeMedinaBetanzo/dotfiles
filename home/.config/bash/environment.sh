# ============================================================
# Environment
# ============================================================

export EDITOR="nano"
export VISUAL="$EDITOR"

# Less
export LESS="-R"

# Colores
export CLICOLOR=1

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"

# ~/.local/bin
if [[ -d "$HOME/.local/bin" ]]; then
    case ":$PATH:" in
        *":$HOME/.local/bin:"*) ;;
        *) export PATH="$HOME/.local/bin:$PATH" ;;
    esac
fi

