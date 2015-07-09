" Don't retain compatibility with vi. Vundle requirement.
set nocompatible
filetype off

" Adjust vim's runtime path to include vundle location and init vundle.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle packages
Plugin 'gmarik/vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs' 
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
Plugin 'digitaltoad/vim-jade'
Plugin 'flazz/vim-colorschemes'
Plugin 'Yggdroot/indentLine'
Plugin 'yosssi/vim-ace'
Plugin 'jeroenbourgois/vim-actionscript'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'bling/vim-airline'

call vundle#end()

" Enable JSHint
let g:syntastic_javascript_checkers = ['jshint']

" Now we can turn our filetype functionality back on
filetype plugin indent on

" Configure indentation
set expandtab
set shiftwidth=4
set softtabstop=4
let g:indentLine_char = '┆'
let g:indentLine_color_term = 57 

" Set tabwidth to 4 for Ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Enable line numbers
set number

" Change the color of highlighted matching entities to be more readabale
highlight MatchParen cterm=bold ctermfg=black

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Disable case-sensitivity in searches
set ic

" Color scheme
let g:hybrid_use_Xresources = 1 
set background=dark
" colorscheme monokai
hi Normal ctermbg=none

" Switch between tabs easily.
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" CtrlP key remapping
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Folds
" set foldmethod=syntax
" set foldnestmax=10
" set nofoldenable
" set foldlevel=0
" set foldlevelstart=0
" nnoremap <space> za
" vnoremap <space> zf

" Go specific settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
map <C-g> :GoRun<CR>

" Automatically open NERDTree tabs on start
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

" Prevent long lines from slowing down vim
set synmaxcol=480

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
