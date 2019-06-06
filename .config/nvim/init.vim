set hidden  " makes vim work like every other multiple-file editor on the planet
" tab handling
set tabstop=2
set shiftwidth=2
set expandtab " replace tabs with spaces
" splits
set splitbelow  " open new split pane below and right
set splitright
" Включение поддержки русского языка
set keymap=russian-jcukenwin
set iminsert=0 " set latin by default; <C-^> toggles 0 and 1
set imsearch=0
" longlines
set wrap  " to wrap long lines visually (without \n)
set linebreak  " wrap only at space characters
set textwidth=0  " disable wrap with \n from left margin
set wrapmargin=0  " disable wrap with \n from right margin
set pastetoggle=<F10>  " F10 toggles :set paste and :set nopaste
set number  " show line numbers to distinguish between wrapped long line and physical one
" smartcase search
set ignorecase  " should be on for smartcase
set smartcase  " ignore case if lowercase

let g:loaded_python_provider = 1  " disable Python 2
"let g:loaded_python3_provider = 1
"let g:loaded_ruby_provider = 1

let maplocalleader = "\<space>"
let mapleader = "\<space>"
" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee > /dev/null %
" 
nnoremap <C-j> <C-w>j|  " spare typing while moving between splits
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" Tab navigation like Firefox.
nnoremap <S-tab> :bprevious<CR>
nnoremap <tab>   :bnext<CR>

augroup abbreviations
  autocmd!
  autocmd FileType javascript :iabbrev <buffer> conlog console.log("%c ", "color: #1520ed; font-weight: bold;");
augroup END

call plug#begin()

Plug 'tpope/vim-fugitive' " git support
autocmd BufReadPost fugitive://* set bufhidden=delete  " clear auto-created buffers
set diffopt=filler,vertical  " use vertical split for diffs

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
noremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<cr>

" Plug 'nixprime/cpsm'
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s; and git ls-files -co --exclude-standard']  " ignore files in .gitignore
nnoremap <leader>p :CtrlPBuffer<cr>

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
let g:javascript_plugin_jsdoc = 1

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1  " list buffers as tabs
let g:airline#extensions#keymap#enabled = 0  " disable keymap status
"let g:airline#extensions#tabline#buffer_nr_show = 1  " add buffer numbers

Plug 'lifepillar/vim-solarized8'
set termguicolors  " enable true color

Plug 'jceb/vim-orgmode'

Plug 'tpope/vim-speeddating'  " required for orgmode
Plug 'vim-scripts/utl.vim'  " required for orgmode
let g:utl_cfg_hdl_scm_http_system = "silent !xdg-open '%u'"

Plug 'mileszs/ack.vim'
" Use 'ag' instead of 'ack'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Don't jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Ember *.hbs template syntax highlight
Plug 'joukevandermaas/vim-ember-hbs'

"Plug 'majutsushi/tagbar'
"nnoremap <F8> :TagbarToggle<CR>

"Plug 'tweekmonster/startuptime.vim'
call plug#end()

" config solarized scheme
set background=dark
colorscheme solarized8

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
