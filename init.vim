" Remap escape
:imap jj <Esc>

" Line numbers
set number
set relativenumber

" Allow dirty buffers in the background
set hidden

" Disable line wrapping
set nowrap

" Bassically a fuzzy finder
set path+=**

" Plugin manager
call plug#begin('~/local/share/nvim/plugged')
	Plug 'itchyny/lightline.vim'
	Plug 'arcticicestudio/nord-vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'vim-scripts/Toggle'
call plug#end()

" Stop autocomplete pooping up a help pane
set completeopt-=preview

" Set colorscheme and lightline colorscheme
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" arrow keys for pane switching
nnoremap <up>    <c-w>k
nnoremap <down>  <c-w>j 
nnoremap <left>  <c-w>h
nnoremap <right> <c-w>l
inoremap <up>    <c-w>k
inoremap <down>  <c-w>j 
inoremap <left>  <c-w>h
inoremap <right> <c-w>l

" tab for cycling between last used buffer
nnoremap <tab> <c-^>

" GO PLUGIN
let g:go_auto_type_info = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1  
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_fields = 1
let g:go_auto_type_info = 0

" Not sure
set nocompatible
syntax enable
filetype plugin on
command! MakeTags !ctags -R .

" Remap ctrl-s to save
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
vnoremap <c-s> <Esc>:w<CR>

" Insert blank lines in normal mode
" The next two lines are copy/paste from SO
" to stop some kind of interference in command mode
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>
" " And to make S-Enter work you need to make some changes to how Alacritty
" sends key combos
" - { key: Return,   mods: Shift,   chars: '\x1b[13;2u' }
" - { key: Return,   mods: Control, chars: '\x1b[13;5u' }
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>

" ignore variables (Go/Elm)
nnoremap _ cw_<Esc>






