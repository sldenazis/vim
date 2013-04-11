" @Author: Santiago Lopez Denazis (SLD) (ok, es un rejunte de cosas que encontre por ahi...)
" @Version: 0.03

" Autocompletado
ia ifb if [  ]; then
ia ifc if(){}
ia whileb while [  ]; do
ia forb for x in ; do
ia forc for (i=0; i< ; i++){}
ia #b #!/bin/bash

" Syntax
syntax on
set number

" Theme
set t_Co=256
colo molokai

if has("gui_running")
	" Sin barra de herramientas
	set guioptions-=T
	set number
endif

" Plegado de código!
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" tabs, indentado
set ts=2
set autoindent
set smartindent

" varias
set showcmd	" display incomplete commands
set encoding=utf-8
filetype plugin indent on
set wrap
" set expandtab " esta opcion usa espacios en lugar de tabs

" Busquedas
set hlsearch	" colorea los matches
set incsearch	" busqueda incremental
" set ignorecase	" searches are case insensitive...
" set smartcase	" ...unless they contain at least one capital letter

" status line
" source: http://spf13.com/post/perfect-vimrc-vim-config-file
if has('statusline')
	set laststatus=2
	" Broken down into easily includeable segments
	set statusline=%<%f\   " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\[%{&ff}/%Y] " filetype
	set statusline+=\[%{getcwd()}] " current dir
	" set statusline+=\[A=\%03.3b/H=\%02.2B] " ASCII/Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\%p%% " Right aligned file nav info
endif
