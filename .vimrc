" Don't retain compatibility with vi. Vundle requirement.
set nocompatible
filetype off

"set term=builtin_ansi

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'Raimondi/delimitMate'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'endel/actionscript.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'digitaltoad/vim-pug'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'yosssi/vim-ace'
Plugin 'keith/swift.vim'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mhinz/vim-mix-format'
Plugin 'rking/ag.vim'

" vim-plug
if has('nvim')
  call plug#begin()
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  call plug#end()
endif

let g:deoplete#enable_at_startup = 1
" deoplete <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

call vundle#end()            " vundle required
filetype plugin indent on    " vundle required

syntax enable 		    " enable syntax processing
set shell=/bin/bash     " override zsh
set tabstop=2 	        " number of spaces to show per-tab
set softtabstop=2	    " number of spaces in tab when editing
set shiftwidth=2	    " number of spaces in tab when editing
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

" easier indentation
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" shortcut for Ag
nnoremap <leader>a :Ag

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Turn off search highlight with ctrl+n
nnoremap <c-n> :nohlsearch<cr>

" space open/closes folds
nnoremap <space> za

" Tab width = 2 for Jade and Ace files
autocmd Filetype jade setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype pug setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype ace setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype ace setlocal ts=2 sw=2 sts=0 expandtab
autocmd FileType html,html.tmpl,gohtml setlocal ts=2 sw=2 expandtab

" Tab width for Go files
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Disable syntax highlighting on long lines
set synmaxcol=240

" AirBNB ESLint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = ['--fix']
set autoread
au VimEnter *.js au BufWritePost *.js checktime

" CSS Linting
let g:syntastic_css_checkers = ['csslint']

" JSON/CSS/HTML Beautify
au BufWrite *.json :call JsonBeautify()
au BufWrite *.css :call CSSBeautify()
au BufWrite *.html :call HtmlBeautify()
au BufWrite *.html.tmpl :call HtmlBeautify()

" Indenting for yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Mix format on save
let g:mix_format_on_save = 1

" Nerdtree tabs
"let g:nerdtree_tabs_open_on_console_startup = 1
"let g:NERDTreeWinPos = "right"

" Switch between tabs easily.
" map <C-l> gt
" map <C-h> gT

" Switch between horizontal splits easily.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$\|node_modules\|vendor',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Go specific settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
map <leader>b :GoBuild<CR>
"map <leader>r :GoRun<CR>
map <leader>r :60split<CR><C-w>j:terminal gomon .<CR><C-w>k
map <leader>d :GoDef<CR>

" Run webcopy on current file
map <leader>c :!sh -xc 'cat % \| webpaste'<CR>

" Automatically close preview window after autocompletion
let g:ycm_autoclose_preview_window_after_insertion = 1

" set ycm python path
"let g:ycm_server_python_interpreter = '/usr/bin/python3'
"let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
let g:ycm_server_python_interpreter = '/usr/local/bin/python'
if has('nvim')
  let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
endif

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" YCM Go
let g:ycm_gocode_binary_path = "$GOPATH/bin/gocode"
let g:ycm_godef_binary_path = "$GOPATH/bin/godef"

" Don't complete strings (slows down vim with go files)
let g:ycm_complete_in_strings = 0

set backspace=2

" NPM start
nnoremap <leader>j :!clear && npm start<CR>

" Don't overwrite register when pasting
xnoremap p pgvy

autocmd filetype crontab setlocal nobackup nowritebackup

if has('nvim')
  " Terminal escape
  :tnoremap <Esc> <C-\><C-n>
endif

" This allows buffers to be hidden if you've modified a buffer.
set hidden

" To open a new empty buffer
" This replaces :tabnew
"nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <C-l> :bnext<CR>

" Move to the previous buffer
nmap <C-h> :bprevious<CR>

" Open :badd prompt with <C-t>
nnoremap <leader>t :badd

colorscheme ron
