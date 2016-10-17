" Enk4's .vimrc, main purpose for programming with C# and JavaScript, but
" enhanced to do any popular programming language for experimental purpose.
" This vimrc is currently designed to work on windows environment, but will be
" TO DO:improved in order to be working in all OS.
"
" Copyright: Muhammad 'Enka'
" Last updated:  22/07/2016 10:21:56

" ====== Main Configuration ======
" These are config for vim to run
" this .vimrc correctly.
" ================================

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" --------------------------------
" setting the swap and backup file
" directory.
" --------------------------------
:set dir=~\vim_swap
:set backupdir=~\vim_backup

filetype off
set laststatus=2
filetype plugin on
filetype indent on

" --------------------------------
" Fonts etc.
" --------------------------------
if has('gui_running')
  set guioptions-=T
  set lines=60
  set guifont=AnonymicePowerline_NF:h11:b
endif

" --------------------------------
" Directly set the UTF-8 encoding
" --------------------------------

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" ------ All the settings -------
" save view for the folding
" -------------------------------

autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

" -------------------------------
" set current working directory
" without setting auto check dir
" This is necessary for vimshell
" to works.
" -------------------------------

autocmd BufEnter * silent! lcd %:p:h

set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
set linespace=0
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
set expandtab
set list
set listchars=tab:>\ ,trail:•,extends:#,nbsp:.
set splitbelow
set splitright

" ======== Vundle-bundles ========
" You shall add all vundle plugins
" in .vimrc.bundle file.
" ================================

if filereadable(expand("~/.vimrc.bundle"))
  source ~/.vimrc.bundle
endif

" == Theme & GUI configuration ==
" These GUI configurations are 
" used to define all settings
" regarding the themes and colors
" ===============================

syntax on
set termencoding=256
set background=dark
colorscheme solarized

" =========== Keymaps ============
" All keymaps are kept at separate
" file. Put all configurations of 
" command key-remapping there.
" ================================

if filereadable(expand("~/.vimrc.keymap"))
  source ~/.vimrc.keymap
endif

" =========== Plugin =============
" All plugins are kept at separate
" file. Put all the configuration 
" of plugins there.
" ================================

if filereadable(expand("~/.vimrc.plugin"))
  source ~/.vimrc.plugin
endif
