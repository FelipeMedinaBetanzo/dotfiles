set nocompatible
filetype plugin indent on
syntax enable
set encoding=utf-8 hidden autoread
set number relativenumber cursorline signcolumn=yes
set showmatch showcmd wildmenu wildmode=longest:full,full
set ignorecase smartcase incsearch hlsearch
set expandtab shiftwidth=2 softtabstop=2 tabstop=2 smartindent
set splitbelow splitright scrolloff=5 sidescrolloff=8
set nowrap linebreak breakindent
set undofile backupcopy=yes
set updatetime=300 timeoutlen=500
set completeopt=menuone,noinsert,noselect
set mouse=a clipboard=unnamedplus
set termguicolors background=dark
set laststatus=2 showtabline=1
set list listchars=tab:»·,trail:·,extends:›,precedes:‹,nbsp:␣
set fillchars=vert:│,fold:·

let mapleader=" "
let maplocalleader=" "
nnoremap <silent> <Esc> :nohlsearch<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>x :xit<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>n :set number! relativenumber!<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-j> :move .+1<CR>==
nnoremap <A-k> :move .-2<CR>==
vnoremap <A-j> :move '>+1<CR>gv=gv
vnoremap <A-k> :move '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv
inoremap jk <Esc>
command! W w
command! Q q

if has('persistent_undo')
  let s:undo = expand('~/.local/state/vim/undo')
  if !isdirectory(s:undo) | call mkdir(s:undo, 'p', 0700) | endif
  let &undodir = s:undo
endif

augroup cyberdream_core
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=180})
  autocmd BufWritePre * %s/\s\+$//e
augroup END

colorscheme cyberdream-local
set statusline=%#StatusLine#\ %f\ %m%r%h%=%#StatusLineNC#\ %y\ %{&fileencoding?&fileencoding:&encoding}\ [%l:%c]\ %p%%\ 

