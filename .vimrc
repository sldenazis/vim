" @Author: Santiago Lopez Denazis (SLD)
" @Version: 0.02

" Autoindentado
set autoindent

" Seteo tab en 4 espacios
set ts=4

" Autocompletado
ia ifb if [  ]; then
ia ifc if(){}
ia whileb while [  ]; do
ia forb for x in ; do
ia forc for (i=0; i< ; i++){}
ia #b #!/bin/env bash

" Syntax
syntax on

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
