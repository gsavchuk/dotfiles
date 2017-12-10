set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'pangloss/vim-javascript'
" Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode=0  " do not go upper the current dir

Plugin 'tpope/vim-unimpaired'  " ]q [q mappings for fim-fugitive
" clojure plugins
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'  " exntended highlighting
Plugin 'tpope/vim-repeat'  " required by vim-sexp
Plugin 'tpope/vim-surround'  " surround by parentheses, brackets, quotes, XML tags, and more
Plugin 'guns/vim-sexp'
nnoremap <Space> <Nop>|  " set space as <LocalLeader>
let maplocalleader=" "

Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'  " use ag instead of ack

" Plugin 'yggdroot/indentline'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=2
set shiftwidth=2
set expandtab " replace tabs with spaces
set hidden  " makes vim work like every other multiple-file editor on the planet

" enable solarized
syntax enable
set background=dark
colorscheme solarized

" Включение поддержки русского языка
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
set mouse-=a

set wrap  " to wrap long lines visually (without \n)
set linebreak  " wrap only at space characters
set textwidth=0  " disable wrap with \n from left margin
set wrapmargin=0  " disable wrap with \n from right margin
set pastetoggle=<F10>  " F10 toggles :set paste and :set nopaste
set number  " show line numbers to distinguish between wrapped long line and physical one

" splits
set splitbelow  " open new split pane below and right
set splitright
nnoremap <C-J> <C-W><C-J>|  " spare typing while moving between splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set ignorecase  " should be on for smartcase
set smartcase  " ignore case if lowercase
filetype plugin indent on  " required for vim-clojure-static

" rainbow_parentheses plugin config
" always rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ctrlp plugin config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']  " ignore files in .gitignore

let g:airline#extensions#tabline#enabled = 1  " list buffers as tabs
let g:airline_powerline_fonts = 1  " use powerline symbols (powerline-fonts pkg. must be installed)
set laststatus=2  " enable powerline by default

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Tab navigation like Firefox.
nnoremap <S-tab> :bprevious<CR>
nnoremap <tab>   :bnext<CR>
