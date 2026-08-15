# Dotfiles de Felipe

Configuración personal, portable y sin credenciales.

## Restaurar en un equipo nuevo

```bash
git clone git@github.com:FelipeMedinaBetanzo/dotfiles.git ~/dotfiles
cd ~/dotfiles
./scripts/install.sh
```

El instalador crea una copia de seguridad de cada archivo existente antes de
reemplazarlo. Luego abre una terminal nueva o ejecuta `source ~/.bashrc`.

## Actualizar el respaldo

```bash
cd ~/dotfiles
./scripts/backup.sh
git diff
git add .
git commit -m "Actualizar configuración"
git push
```

## Incluye

- Bash modular
- Vim y Neovim
- WezTerm
- ripgrep
- Preferencias de Codex (`config.toml`)

## No incluye

Tokens, credenciales de Codex, claves SSH privadas, historial, bases de datos,
certificados ni cachés. Las claves SSH deben restaurarse mediante un gestor de
contraseñas o generarse nuevamente.
