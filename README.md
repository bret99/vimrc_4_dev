This a .vimrc config file for developing in C++, python3, bash, golang, terraform and nginx config file and html support.

Prerequisites:

1. install valgrind;
2. install clang-tools;
3. install clangd;
4. install cppcheck;
5. install clang-format;
6. install python3-pip;
7. pip3 install bandit;
8. pip3 install yapf (or istall yapf3 from distributive repo);
9. install pylint;
10. install golang (form official site or distributive repo);
11. install golint;
12. install shellcheck;
13. install terraform (form official site or distributive repo);
14. install vim-nox;
15. install Vundle.vim (https://github.com/VundleVim/Vundle.vim);
16. install Paper color vim plugin (https://github.com/NLKNguyen/papercolor-theme): just copy PaperColor.vim to ~/.vim.colors/

After all vim plugins installed one should cd YouCompleteMe directory and run:
1. ./install.py --clangd-completer;
2. ./install.py --go-completer;
3. set background value to dark/light in line 42 in .vimrc file ("dark" as default).

After that value USER in 85 line in .vimrc file should be substituted for actual one.  

Hotkeys one gets:

  F2 - save file;
  F3 - wildmenu for python3 (after <F2> hit): run, code check (bandit), delete current file, format code;
  F4 - wildmenu for C++ (after <F2> hit): run, run with multi-threads option, memory leakage check (valgrind), delete current file, format code;
  F5 - wildmenu for bash (after <F2> hit): run, delete current file;
  F6 - wildmenu for golang (after <F2> hit): run, buld, delete current file, format code;
  F7 -run vertical terminal; 
  F8 -run below horizontal terminal;
  F9 - files bar to work with (nerd tree);
  F10 - exit vim;
  F4 - hot key for emmet autocompletion (line 98 in .vimrc file): F4 + Comma gives html code autocompletion.

Sometimes clangd autocompletion does not work correctly for some reason. If this happens one should:
1. ./install.py --clang-completer;
2. comment lines 109-112 in .vimrc file (as unneeded).
  
