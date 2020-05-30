" BASICS 

set nocompatible
let mapleader =  ' '
set number
set relativenumber
" au TermOpen * setlocal nonumber norelativenumber
syntax enable
filetype plugin on
set nowrap
" Allow dirty buffers in the background
set hidden
" Bassically a fuzzy finder
set path+=**
" Stop autocomplete pooping up a help pane
set completeopt-=preview
" use indent files in the /indent directory
filetype plugin indent on

" NAVIGATION

" arrow keys for pane switching
nnoremap <up>    <c-w>k
nnoremap <down>  <c-w>j 
nnoremap <left>  <c-w>h
nnoremap <right> <c-w>l
inoremap <up>    <Esc><c-w>k
inoremap <down>  <Esc><c-w>j 
inoremap <left>  <Esc><c-w>h
inoremap <right> <Esc><c-w>l
tnoremap <up>    <Esc><c-w>k
tnoremap <down>  <Esc><c-w>j 
tnoremap <left>  <Esc><c-w>h
tnoremap <right> <Esc><c-w>l
"
" tab for cycling between last used buffer
nnoremap <tab> <c-^>

" PLUGIN MANAGER

call plug#begin('~/local/share/nvim/plugged')
	Plug 'jeffkreeftmeijer/vim-dim'
	Plug 'vim-scripts/Toggle'
	Plug 'tpope/vim-surround'
	Plug 'dense-analysis/ale'
	Plug 'mattn/emmet-vim'
	Plug 'preservim/nerdtree'
	Plug 'elmcast/elm-vim'
	Plug 'bkad/CamelCaseMotion'
	Plug 'mtth/scratch.vim'
call plug#end()

" PLUGIN SETTINGS

let g:camelcasemotion_key = '<leader>'

" vim is a colourscheme that lets the terminal's colourscheme come through
colorscheme dim
"
" ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
	\ 'css': ['prettier'],
	\ 'scss': ['prettier'],
	"\ 'html': ['html-beautify'],
	\ 'python': ['yapf'],
	\ 'json': ['prettier'],
	\ 'go': ['gofmt', 'goimports']
	\ }

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss EmmetInstall
let g:user_emmet_expandabbr_key = '<C-e>'

" CUSTOM KEYBINDINGS

" Remap ctrl-s to save
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
vnoremap <c-s> <Esc>:w<CR>

" Insert blank lines in normal mode
" The next two lines are copy/paste from SO
" to stop some kind of interference in command mode
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>
"
" " And to make S-Enter work you need to make some changes to how Alacritty
" sends key combos
" - { key: Return,   mods: Shift,   chars: '\x1b[13;2u' }
" - { key: Return,   mods: Control, chars: '\x1b[13;5u' }
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>

" Custom key remaps
nnoremap _ cw_<Esc>
:map <leader>h :noh<CR>
:map <leader>y yyp
:map <leader>t :NERDTreeToggle<CR>
:map <leader>n :NERDTreeRefreshRoot<CR>
:map <leader>r :so $MYVIMRC<CR>
:map <leader>s :Scratch<CR>
:map <leader>bj i`json:"" bson:""`<Esc>4F"a
inoremap <c-z>z <Esc>zzi
:tnoremap <Esc> <C-\><c-n>

" Not sure
command! MakeTags !ctags -R .

" Cursor line only on active splits
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END  

