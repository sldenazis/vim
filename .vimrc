" @Author: Santiago Lopez Denazis (SLD) (ok, es un rejunte de cosas que encontre por ahi...)
" @Version: 0.03

" <Autocompletado>
" <Bash>
ia ifb if [ ]; then
ia whileb while [  ]; do
ia forb for x in ; do
" <C>
ia ifc if(){}
ia whilec while(){}
ia forc for( i=0; i<; i++ ){}
" <Scripting>
ia #s #!/bin/sh
ia #b #!/bin/bash
ia #p #!/bin/env python
ia #P #!/bin/env perl

" <Theme>
set t_Co=256
colo molokai

" <Gvim>
if has("gui_running")
	" Sin barra de herramientas
	set guioptions-=T
	set number
endif

" <Plegado de código!>
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" <tabs, indentado, etc>
set ts=4
set autoindent
set smartindent
set number
syntax on

" <Varios>
set showcmd	" display incomplete commands
set encoding=utf-8
filetype plugin indent on
set wrap
" set expandtab " esta opcion usa espacios en lugar de tabs

" <Busquedas>
set hlsearch	" colorea los matches
set incsearch	" busqueda incremental
" set ignorecase " searches are case insensitive...
" set smartcase " ...unless they contain at least one capital letter

" <Status Line href="http://spf13.com/post/perfect-vimrc-vim-config-file">
if has('statusline')
	set laststatus=2
	" Broken down into easily includeable segments
	set statusline=%<%f\ " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness, plugin 'fugitive'
	set statusline+=\[%{&ff}/%Y] " filetype
	set statusline+=\[%{getcwd()}] " current dir
	" set statusline+=\[A=\%03.3b/H=\%02.2B] " ASCII/Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\%p%% " Right aligned file nav info
endif
