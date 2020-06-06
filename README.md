Just delete your .vimrc and clone this one.
Hotkeys you get:
<F2> save file (equal :wq)
<F5> files bar to work with (nerd tree)
<F9> open wildmenu 4 chosing what to do with file (after <F2> hit): either to compile or run .cpp or .py or run valgrind or delete file you're workin' with.
<F10> exit vim.

Of cource one need to preinstall valgrind, clang-tools, vim-nox and so on you know.
Also one should cd YouCompleteMe dir and "install.py --clangd-completer".
And clone Paper color (color scheme) to .vim/color dir (line 29 in .vimrc).
As a result you get imho the lightest and the fastest universal IDE for coding in c++, python3 and bash. One may add functionality for node or smth like this.
