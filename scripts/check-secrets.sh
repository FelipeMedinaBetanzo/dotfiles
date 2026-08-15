#!/usr/bin/env bash
set -Eeuo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_dir"

pattern='(api[_-]?key|access[_-]?token|client[_-]?secret|password|passwd|BEGIN (RSA |OPENSSH )?PRIVATE KEY)'

if git grep -Ein "$pattern" -- ':!scripts/check-secrets.sh'; then
  printf '\nPosible secreto encontrado. Revisa antes de publicar.\n' >&2
  exit 1
fi

printf 'No se detectaron patrones comunes de secretos.\n'

