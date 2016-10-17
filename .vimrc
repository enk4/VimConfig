" --------------------------------------------------------------------------
" Enk4~'s vimrc.
" Used mainly for javascript, html, and CSS editing; Note-taking and writing
" blog using markdown (for hexo blog).
"
" This vimrc is currently designed to work on windows environment, but will be
" developed to suite other OS as well (especially linux, since I don't have
" MacOS as working environmnet).
" Update 1:
" - Separate the .vimrc to .vimrc.plugin, .vimrc.bundle, and .vimrc.keymap.
" - add comments to clear the purpose of each script within the .vimrc files.
"
" Copyright: Muhammad 'Enka~'
" Last updated: 8/15/2016 1:33:18 AM
" --------------------------------------------------------------------------

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
:set viewdir=~\vim_view
:set undodir=~\vim_undo

filetype off
set laststatus=2
filetype plugin on
filetype indent on

" --------------------------------
" Fonts etc.
" --------------------------------
if has('gui_running')
  set guioptions-=T     " no toolbar and tear off configuration
  set lines=40          " set total lines of the vim to [x].
  " set guifont=AnonymicePowerline_NF:h11
  set guifont=FuraMonoForPowerline_NF:h10
  " set guifont=Monoid_NF:h8
  " set guifont=MesloLGMDZ_NF:h10
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

" -------------------------------
" Set fold configuration
" -------------------------------
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}

" -------------------------------
" set trailing whitespace.
" -------------------------------

set list
set listchars=tab:>\ ,trail:•,extends:#,nbsp:.
set expandtab       " change tab into spaces.

" -------------------------------
" Search related configuration
" -------------------------------

set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase

" -------------------------------
" other configurations
" -------------------------------

set linespace=0    " set the linespace between fonts to [x]

" ------------------------------
" Splitting setting
" ------------------------------
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
colorscheme gruvbox

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

augroup pencil
  autocmd!
  autocmd FileType markdown,text call pencil#init({'wrap': 'soft'})
augroup end
