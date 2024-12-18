" BASICS 

" Appearance
set termguicolors
set background="dark"
set signcolumn
set nocursorline
set number
set relativenumber
set nowrap
set shell=zsh

set nocompatible
set noswapfile
let mapleader =  ' '
au TermOpen * setlocal nonumber norelativenumber

syntax enable
filetype plugin on

" Allow dirty buffers in the background
set hidden

" Bassically a fuzzy finder
set path+=**

" Stop autocomplete pooping up a help pane
set completeopt-=preview

" use indent files in the /indent directory
filetype plugin indent on

" set splits to open on right by default
set splitright
set splitbelow

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
"
" Tab navigation wi 2th nubmers
nnoremap <leader>1 1gt 
nnoremap <leader>2 2gt 
nnoremap <leader>3 3gt 
nnoremap <leader>4 4gt 
nnoremap <leader>5 5gt 
nnoremap <leader>6 6gt 
nnoremap <leader>7 7gt 
nnoremap <leader>8 8gt 
nnoremap <leader>9 9gt 

" tab for cycling between last used buffer
nnoremap <tab> <c-^>

" file explorer (Nerd tree like, but built in)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = -20

" PLUGIN MANAGER

call plug#begin('~/local/share/nvim/plugged')
	Plug 'itchyny/lightline.vim'
	Plug 'vim-scripts/Toggle'
	Plug 'vim-scripts/ReplaceWithRegister'
	Plug 'numToStr/Comment.nvim'
	Plug 'tpope/vim-surround'
	Plug 'dense-analysis/ale'
	Plug 'elmcast/elm-vim'
	Plug 'bkad/CamelCaseMotion'
	Plug 'gcmt/taboo.vim'
	Plug 'preservim/nerdtree'
	Plug 'bluz71/vim-nightfly-guicolors'
	Plug 'github/copilot.vim'
	Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme nightfly
let g:lightline = { 'colorscheme': 'nightfly' }

" PLUGIN SETTINGS
"
lua require('Comment').setup()
"
" Taboo
let g:taboo_tab_format = " %N:%f%m "
let g:taboo_renamed_tab_format = " [%N:%l]%m "

" Camel Case Motion
let g:camelcasemotion_key = '<leader>'

" ale
" Set the dialet for sqlfluff to BigQuery
let g:ale_fix_on_save = 1
let g:ale_fixers = {
	\ 'css': ['prettier'],
	\ 'scss': ['prettier'],
	\ 'html': ['prettier'],
	\ 'python': ['yapf'],
	\ 'json': ['prettier'],
	\ 'sql': ['sqlfluff'],
	\ 'go': ['gofmt', 'goimports']
	\ }

let g:ale_linters = {
  \ 'go': ['gopls'],
  \ 'sql': ['sqlfluff'],
  \}


" Gopls options for linting with Ale - found this example in the source code
" https://github.com/dense-analysis/ale/pull/3571/commits/26b92f73b5e0f54b0053cf2bd69b79f4f01afe91
let g:ale_go_gopls_init_options = {'ui.diagnostic.analyses': {
        \ 'composites': v:false,
        \ }}


" emmet
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,scss EmmetInstall
" let g:user_emmet_expandabbr_key = '<C-e>'

" NERDTree
:let g:NERDTreeWinSize=22

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

" open a terminal in a 40 char-width vsplit and go straight into insert mode
:map <leader>t :vsplit term://zsh<CR> :vertical resize 40<CR>i
:map <leader>z :vertical resize 40<CR>
:map <leader>r :so $MYVIMRC<CR>
:map <leader>s :Scratch<CR>
:map <leader>bj i`json:"" bson:""`<Esc>4F"a
:map <leader>f :NERDTreeToggle<CR>
:map <leader>n :NERDTreeRefreshRoot<CR>
:map <leader>0 "0p

inoremap <c-z>z <Esc>zzi
:tnoremap <Esc> <C-\><c-n>

" Not sure
command! MakeTags !ctags -R .

" Cursor line only on active splits
" augroup CursorLineOnlyInActiveWindow
 " autocmd!
 " autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
 " autocmd WinLeave * setlocal nocursorline
"augroup END  

