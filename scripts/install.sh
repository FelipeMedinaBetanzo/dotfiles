#!/usr/bin/env bash
set -Eeuo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
backup_dir="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

while IFS= read -r -d '' source_path; do
  relative_path="${source_path#"$repo_dir/home/"}"
  target_path="$HOME/$relative_path"

  mkdir -p "$(dirname "$target_path")"

  if [[ -e "$target_path" || -L "$target_path" ]]; then
    mkdir -p "$backup_dir/$(dirname "$relative_path")"
    cp -a -- "$target_path" "$backup_dir/$relative_path"
  fi

  cp -- "$source_path" "$target_path"
  printf 'Instalado: %s\n' "$relative_path"
done < <(find "$repo_dir/home" -type f -print0)

printf '\nListo. Respaldo previo: %s\n' "$backup_dir"
printf 'Abre una terminal nueva o ejecuta: source ~/.bashrc\n'

