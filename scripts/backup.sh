#!/usr/bin/env bash
set -Eeuo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

files=(
  .bashrc
  .vimrc
  .config/bash/aliases.sh
  .config/bash/completion.sh
  .config/bash/environment.sh
  .config/bash/functions.sh
  .config/bash/fzf.sh
  .config/bash/history.sh
  .config/bash/init.sh
  .config/bash/options.sh
  .config/bash/prompt.sh
  .config/nvim/init.vim
  .config/ripgrep/config
  .config/wezterm/wezterm.lua
  .codex/config.toml
)

for relative_path in "${files[@]}"; do
  source_path="$HOME/$relative_path"
  target_path="$repo_dir/home/$relative_path"

  if [[ -f "$source_path" ]]; then
    mkdir -p "$(dirname "$target_path")"
    cp -- "$source_path" "$target_path"
    printf 'Actualizado: %s\n' "$relative_path"
  fi
done

printf '\nRevisa los cambios con: git -C %q diff\n' "$repo_dir"

