" Enk4's .vimrc, main purpose for programming with C# and JavaScript, but
" enhanced to do any popular programming language for experimental purpose.
" This vimrc is currently designed to work on windows environment, but will be
" TO DO:improved in order to be working in all OS.
"
" Copyright: Muhammad 'Enka'
" Last updated:  22/07/2016 10:21:56

" Main Configuration {{{
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

filetype off
set laststatus=2
filetype plugin on

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
" }}}

" Vundle {{{
set rtp+=G:/Work\ App/vim/vimfiles/bundle/Vundle.vim
call vundle#begin('G:/Work\ App/vim/vimfiles/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'myusuf3/numbers.vim'
" Plugin 'xleng/ycm_win_x86'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'OmniSharp/Omnisharp-vim'
Plugin 'sjl/gundo.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-dispatch'
" Plugin 'lilydjwg/colorizer'
Plugin 'Shougo/vimfiler.vim'
" Plugin 'Shougo/unite.vim'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-scripts/closetag.vim'
Plugin 'edsono/vim-matchit'
Plugin 'gabrielelana/vim-markdown'
" Plugin 'ap/vim-css-color'
Plugin 'gko/vim-coloresque'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on
" }}}

" Gui environment {{{
" setting up the environment
if has('gui_running')
	set guioptions-=T	" Remove the toolbar
	set lines=60		" 40 lines of text instead of 24
	" set guifont=Powerline_Consolas:h10
	set guifont=AnonymicePowerline_NF:h11:b
endif

" UTF-8 predefined
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	" setglobal bomb
	set fileencodings=ucs-bom,utf-8,latin1
	
endif

" command to save view
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

" Theme
syntax enable
set termencoding=256
set background=dark
colorscheme solarized

" }}}

" Keymaps {{{
let mapleader = ","

" navigate between split made easy
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" my $ is too far
nnoremap q $
nnoremap $ q
nnoremap dq d$
nnoremap vq v$

" word wrapping navigation
nnoremap k gk
nnoremap j gj


" map current date timestamp
inoremap <F5> <C-R>=strftime("%c")<CR>
nnoremap <F5> :pu=strftime('%c')<CR>

" switch background between light and dark
map <leader>bg :let &background = (&background == "dark"? "light":"dark")<CR>

" Shortcuts Change working directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Shortcuts helpers to edit mode
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :table %%

" }}}

"Plugin {{{
" All configuration of plugins, including keymapping goes here. For standard
" vim operation keymap, see Keymaps

" Airline {{{
let g:airline_powerline_fonts=1
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ctrlp#show_adjacent_modes=1
let g:airline#extensions#wordcount#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#branch#format=1
let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  nmap <leader>- <Plug>AirlineSelectPrevTab
  nmap <leader>+ <Plug>AirlineSelectNextTab

" }}}

" number {{{
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
set number
" }}}

" nerd-commenter {{{
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" }}}

" indent guides {{{
let g:indent_guides_start_level=2
set ts=2 sw=2 et
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_HTML_checkers = ['eslint']
let g:syntastic_HTML_eslint_exec = 'eslint_d'
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" }}}

" YouCompleteMe - Supertab {{{
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" }}}

" ultisnips {{{
" let g:UltiSnipsExpandTrigger="<c-;>"
let g:UltiSnipsExpandTrigger="<C-Enter>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:ultiSnipsJumpBackwardTrigger="<c-l>"
let g:UltiSnipsEditSplit="vertical"

" }}}

" NerdTree {{{
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
map <C-e> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
" }}}

" Devicons {{{
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#002b36')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#002b36')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#002b36')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#002b36')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#002b36')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#002b36')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#002b36')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#002b36')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#002b36')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#002b36')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#002b36')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#002b36')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#002b36')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#002b36')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#002b36')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#002b36')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#002b36')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#002b36')

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif
"}}}

" Tagbar {{{
nmap <F7> :TagbarToggle<CR> " Invoke tagbar

" }}}

" Fugitive {{{
if isdirectory(expand("G:/Work App/Vim/vimfiles/bundle/vim-Fugitive/"))
	nnoremap <silent> <leader>gs :Gstatus<CR>
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gl :Glog<CR>
	nnoremap <silent> <leader>gp :Git push<CR>
	nnoremap <silent> <leader>gr :Gread<CR>
	nnoremap <silent> <leader>gw :Gwrite<CR>
	nnoremap <silent> <leader>ge :Gedit<CR>
endif
" }}}

" CtrlP"{{{
if isdirectory(expand("G:/Work App/Vim/vimfiles/bundle/ctrlp.vim/"))
	let g:ctrlp_working_path_mode = 'ra'
	" nnoremap <silent> <D-t> :CtrlP<CR>
endif
"}}}

" Omnisharp {{{
" let g:OmniSharp_selector_ui = 'ctrlp'

" }}}

"end of plugin }}}
