" ==== Call config files =====
" This .vimrc file is used 
" only to combine everything
" ============================

if filereadable(expand("~/vimConfig/.vimrc.config"))
    source ~/vimConfig/.vimrc.config
endif
