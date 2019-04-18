## Features
* config VIM as IDE

* autocomplete

* useful keymap

* manage all plugins in a elegant way


## Install
* backup your vimrc && update
```
 mv ~/.vim ~/.vim.bk
 mv ~/.vimrc ~/.vimrc.bk
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 git clone https://github.com/pingfengluo/vim-config vim-config
 cp vim-config/.vimrc ~/.vimrc
```
* open VIM in Terminal, then in VIM commandline mode using "BundleInstall" command to intstall plugins

* install YCM

```
 cd ~/.vim/bundle/YouCompleteMe
 git submodule update --init --recursive
./install.py --clang-completer
```
* now enjoy yourself with VIM

