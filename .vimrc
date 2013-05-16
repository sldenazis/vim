" Author: Santiago Lopez Denazis (SLD)
" Version: 0.04
" Updated: 2013/05/15
" Licence: +GPLv3

" <Autocompletado>
" <Bash>
ia ifb if [ ]; then
ia whileb while [ ]; do
ia forb for x in ; do
" <C>
ia ifc if(){}
ia whilec while(){}
ia forc for( i=0; i<; i++ ){}
" <Scripting>
ia #s #!/bin/sh
ia #b #!/bin/bash
ia #p #!/usr/bin/bin/python
ia #P #!/usr/bin/perl

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
set foldmethod=syntax " basado en sintaxis
set foldnestmax=10
set foldlevelstart=1
set nofoldenable
set foldlevel=1

" Habilito el plegado para varios lenguajes
let javaScript_fold=1		" JavaScript
let perl_fold=1				" Perl
let php_folding=1			" PHP
let r_syntax_folding=1		" R
let ruby_fold=1				" Ruby
let sh_fold_enabled=1		" sh
let vimsyn_folding='af'		" Vim script
let xml_syntax_folding=1	" XML

" <tabs, indentado, etc>
set ts=4
set autoindent
" set smartindent
set number
syntax on

" <Varios>
set showcmd	" display incomplete commands
set encoding=utf-8
" filetype plugin indent on
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
	" set statusline+=%{fugitive#statusline()} " Git Hotness, plugin 'fugitive'
	set statusline+=\[%{&ff}/%Y] " filetype
	set statusline+=\[%{getcwd()}] " current dir
	" set statusline+=\[A=\%03.3b/H=\%02.2B] " ASCII/Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\%p%% " Right aligned file nav info
endif

" Pathogen
" execute pathogen#infect()
