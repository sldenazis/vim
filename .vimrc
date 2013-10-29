" Author: Santiago Lopez Denazis ~ sld
" Version: 0.06
" Updated: 2013/10/29
" Licence: same as vim

" <Autocomplete>
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
ia #p #!/bin/env python
ia #P #!/bin/env perl

" <Theme>
set t_Co=256
colo molokai

" <Pathogen>
filetype off " Pathogen needs to run before plugin indent on
" call pathogen#runtime_append_all_bundles(), al parecer esta obsoleto
call pathogen#incubate()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

" <Gvim>
if has("gui_running")
	" Without toolbar
	set guioptions-=T
	" Without scrollbars!
	set guioptions+=LlRrb
	set guioptions-=LlRrb
endif

" i<Syntax>
syntax on
syntax sync minlines=100
syntax sync maxlines=200


" <Folding>
set foldmethod=syntax
set foldnestmax=10
set foldlevelstart=1
set nofoldenable
set foldlevel=1
" Enable floding level for some languages
let javaScript_fold=1       " JavaScript
let perl_fold=1             " Perl
let php_folding=1           " PHP
" let r_syntax_folding=1    " R
" let ruby_fold=1           " Ruby
let sh_fold_enabled=7       " sh: XXX based on functions and if/for/while/case
" let vimsyn_folding='af'   " Vim script
let xml_syntax_folding=1    " XML

" <Misc>
set ts=4
set autoindent
" set smartindent
set nonumber " yep, it's default in gentoo
set showcmd	" display incomplete commands
set encoding=utf-8
set wrap
set textwidth=0
" set expandtab " use spaces instead of tabs

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
	set statusline+=\[A=\%03.3b/H=\%02.2B] " ASCII/Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\%p%% " Right aligned file nav info
endif

" NERDTree in right of screen
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 30 " 30 with 23' display

" Pathogen
" execute pathogen#infect()
set modeline
