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
menu Exec.java                :!cd $(pwd) && javac % && java %< && rm *.class <CR>
menu Exec.c++                 :!g++ --std=c++17 -O % -o %< && ./%< && rm ./%< <CR>
menu Exec.pthread             :!g++ --std=c++17 -O -pthread % -o %< && ./%< && rm -i ./%< <CR>  
menu Exec.python3             :!python3 % <CR>
menu Exec.bash                :!/bin/bash % <CR>
"menu Exec.latex               :!pdflatex -output-directory=/home/desktop/my_pro/latex % && rm ./%<.log ./%<.aux <CR>
menu Exec.valgrind            :!g++ --std=c++17 -O % -o %< && valgrind --leak-check=full ./%< && rm -i ./%< <CR>  
" menu Exec.browser             :!firefox % <CR>  
menu Exec.delCurrentFile      :!rm % <CR>
" menu Exec.ada                 :!gnatmake -d -D /home/desktop/ada_pro/ % -o %< && ./%< && rm ./%<.ali ./%/o <CR>
" menu Exec.node                :!node % <CR>  
map <F9> :emenu Exec.<Tab>

set clipboard=unnamedplus

syntax enable
filetype on
set nu
set ruler
set mouse=c
set listchars=tab:\|\
set list
set nocompatible              " be iMproved, required
filetype off                  " required

set background=dark
colorscheme PaperColor

set ignorecase
set smartcase
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" all plugin
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'lervag/vimtex'
Plugin 'hashivim/vim-terraform'
Plugin 'chr4/nginx.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()        " enable this line after the installation of glaive
filetype plugin indent on    " required

" custom setting
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
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python3'
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
  \ 'c' : ['re!\w{2}'],
  \ 'cpp' : ['re!\w{2}'],
  \ 'python' : ['re!\w{2}'],
  \ }

" autoformat
" augroup autoformat_settings
 " autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
 " autocmd FileType python AutoFormatBuffer yapf
" augroup END

" hotkey for emmet 
let g:user_emmet_leader_key='<F4>'

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <silent> <F5> : NERDTreeToggle<CR>


" setup for indent line
let g:indentLine_char = '│'
set tags=./tags,tags;$HOME
"source ~/cscope_maps.vim

"Отключаем автоматическое открытие окна Quickfix
 let g:vimtex_quickfix_mode = 1

" autocomplete latex with ycm
  if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
  endif
  au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme


" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

" Terraform settings
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1
