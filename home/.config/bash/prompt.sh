# ============================================================
# Prompt
# ============================================================

# ANSI
RESET="\[\e[0m\]"
BOLD="\[\e[1m\]"

RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"

# Branch Git
__git_branch() {

    git rev-parse --is-inside-work-tree \
        >/dev/null 2>&1 || return

    local branch

    branch=$(git symbolic-ref \
        --short HEAD 2>/dev/null ||
        git rev-parse --short HEAD 2>/dev/null)

    [[ -n "$branch" ]] &&
        printf " %s %s%s" "$MAGENTA" "$branch" "$RESET"
}

# Estado Git
__git_state() {

    git rev-parse --is-inside-work-tree \
        >/dev/null 2>&1 || return

    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
        printf " %s●%s" "$YELLOW" "$RESET"
    else
        printf " %s✓%s" "$GREEN" "$RESET"
    fi
}

__build_prompt() {

    local exit_code=$?

    local status

    if (( exit_code == 0 )); then
        status="${GREEN}✓${RESET}"
    else
        status="${RED}✗ ${exit_code}${RESET}"
    fi

    local user_color="$CYAN"

    if [[ $EUID -eq 0 ]]; then
        user_color="$RED"
    fi

    PS1="\n"

    PS1+="╭─ "
    PS1+="${user_color}\u${RESET}"
    PS1+="@"
    PS1+="${BLUE}\h${RESET}"

    PS1+="  "
    PS1+="${GREEN}\w${RESET}"

    PS1+="$(__git_branch)"
    PS1+="$(__git_state)"

    PS1+="  ${status}"

    PS1+="\n"

    if [[ $EUID -eq 0 ]]; then
        PS1+="╰─ ${RED}ROOT ❯${RESET} "
    else
        PS1+="╰─ ${CYAN}❯${RESET} "
    fi
}

if [[ "${PROMPT_COMMAND:-}" != *"__build_prompt"* ]]; then
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;}__build_prompt"
fi

