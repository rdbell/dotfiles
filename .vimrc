" Don't retain compatibility with vi. Vundle requirement.
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'endel/actionscript.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'digitaltoad/vim-jade'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'

call vundle#end()            " vundle required
filetype plugin indent on    " vundle required

syntax enable 		    " enable syntax processing
set shell=/bin/bash     " override fish shell
set tabstop=4 	        " number of spaces to show per-tab
set softtabstop=4	    " number of spaces in tab when editing
set shiftwidth=4	    " number of spaces in tab when editing
set expandtab       	" tabs are spaces
set number		        " enable line numbers
set relativenumber	    " enable relative line numbers
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set ic                  " disable case-sensitivity in search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" remap leader key
let mapleader=","

" shortcut for Ag
nnoremap <leader>a :Ag

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Turn off search highlight with ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
nnoremap <space> za

" Tab width = 2 for Jade and Ace files
autocmd FileType jade setlocal sw=2 ts=2 sts=2
autocmd FileType ace setlocal sw=2 ts=2 sts=2

" Tab width for Go files
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Enable JSHint
let g:syntastic_javascript_checkers = ['jshint']
let JSHintUpdateWriteOnly = 1
let g:ycm_register_as_syntastic_checker = 0

" JSBeautify
au BufWrite *.js :call JsBeautify()

" Switch between tabs easily.
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" Switch between horizontal splits easily.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Go specific settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
map <leader>g :GoRun<CR>

" Run webcopy on current file
map <leader>c :!sh -xc 'cat % \| webpaste'<CR>

" Automatically close preview window after autocompletion
let g:ycm_autoclose_preview_window_after_insertion = 1

set backspace=2

" CrtlP should open files in new tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
