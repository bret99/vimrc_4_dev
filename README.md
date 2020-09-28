Just delete your .vimrc and clone this one.
Hotkeys you get:
<F2> save file (equal :wq)
<F7>run vertical terminal 
<F8>run below horizontal terminal
<F5> files bar to work with (nerd tree)
<F9> open wildmenu for chosing what to do with file (after <F2> hit): either to compile or run .cpp or .py or run valgrind or delete file you're workin' with.
<F6> open wildmenu for chosing code formatter (python_fmt for python files, cpp_fmt for c++, c, java files).
<F10> exit vim.

Of course one need to preinstall valgrind, clang-tools, vim-nox, terraform, yapf and so on you know.
Also one should cd YouCompleteMe dir and "install.py --clangd-completer" and "install.py --java-compliter"; pip3 install yamllint.
And clone Paper color (color scheme) to .vim/color dir (line 29 in .vimrc).
As a result you get imho the lightest and the fastest universal IDE for coding in c++, python3, bash, java. One may add functionality for node or smth like this.
