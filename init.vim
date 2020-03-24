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
call plug#end()

" Stop autocomplete pooping up a help pane
set completeopt-=preview

" Set colorscheme and lightline colorscheme
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" Disable arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>


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
