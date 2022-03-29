imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>
imap <F8> <Esc>:bel vert ter<CR>
map <F8> <Esc>:bel vert ter<CR>
imap <F7> <Esc>:bel ter<CR>
map <F7> <Esc>:bel ter<CR>
imap <F10> <Esc>:q<CR>
map <F10> <Esc>:q<CR>

set wildmenu
set wcm=<Tab>
map <F3> :emenu Python.<Tab>
map <F4> :emenu C++.<Tab>
map <F5> :emenu Bash.<Tab>
map <F6> :emenu Go.<Tab>
menu C++.c++                   :!g++ --std=c++17 -O % -o %< && ./%< && rm -i ./%< <CR>
menu C++.pthread               :!g++ --std=c++17 -O -pthread % -o %< && ./%< && rm -i ./%< <CR>  
menu Python.python3            :!python3 % <CR>
menu Python.bandit             :!bandit % <CR>
menu Bash.bash                 :!/bin/bash % <CR>
menu C++.valgrind              :!g++ --std=c++17 -O % -o %< && valgrind --leak-check=full ./%< && rm -i ./%< <CR>  
menu C++.delCurrentFile        :!rm % <CR>
menu Python.delCurrentFile     :!rm % <CR>
menu Bash.delCurrentFile       :!rm % <CR>
menu Python.python_fmt         :!yapf3 -i % <CR>
menu C++.cpp_fmt               :!clang-format -i % <CR>
menu Go.go_run                 :!go run % <CR>
menu Go.go_build               :!go build % <CR>
menu Go.delCurrentFile         :!rm % <CR>
menu Go.go_fmt                 :!go fmt % <CR>

set clipboard=unnamedplus

syntax enable
set nu
set ruler
set mouse=c
set listchars=tab:\|\
set list
set nocompatible              

set background=dark
colorscheme PaperColor

set ignorecase
set smartcase
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'hashivim/vim-terraform'
Plugin 'chr4/nginx.vim'
call vundle#end()            

filetype off    
filetype plugin indent on    

set mouse=c
set number
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set guioptions=
syntax on

" indent for global
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

" indent for special file
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent 
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent

" setup for ycm
let g:ycm_global_ycm_extra_conf = '/home/USER/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_python_binary_path = exepath('python3')
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
  \ 'c' : ['re!\w{2}'],
  \ 'cpp' : ['re!\w{2}'],
  \ 'python' : ['re!\w{2}'],
  \ }
let g:ycm_server_python_interpreter = ''

" hotkey for emmet 
let g:user_emmet_leader_key='<F4>'

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif 
map <silent> <F9> : NERDTreeToggle<CR>

" setup for indent line
let g:indentLine_char = '│'
set tags=./tags,tags;$HOME

" let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

" terraform settings
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1
