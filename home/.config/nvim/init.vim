" Neovim shares the clean Vim configuration; no LazyVim and no plugin framework.
set runtimepath^=~/.vim
source ~/.vimrc

if has('nvim')
  set inccommand=split
  set pumblend=8
  set winblend=4
  lua vim.diagnostic.config({virtual_text=true, signs=true, underline=true, update_in_insert=false, severity_sort=true})
endif

