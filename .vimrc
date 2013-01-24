" @Author: Santiago Lopez Denazis (SLD)
" @Version: 0.01

" Autoindentado
set autoindent

" Seteo tab en 4 espacios
set ts=4

" Autocompletado
ia forb for x in ; do
ia forc for (i=0; i< ; i++){}
ia #b #!/bin/env bash
ia ifb [  ]; then
ia ifc if(){}
ia whileb while [  ]; do

" Syntax
syntax on

" Theme
set t_Co=256
colo molokai

if has("gui_running")
	" Sin barra de herramientas
	set guioptions-=T
	set nu
endif
