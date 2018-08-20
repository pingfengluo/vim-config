## Install

* backup your vimrc && update
```
 mv ~/.vim ~/.vim.bk
 mv ~/.vimrc ~/.vimrc.bk
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 git clone https://github.com/pingfengluo/vim-config vim-config
 cp vim-config/.vimrc ~/.vimrc
```
* open VIM in Terminal, then in commandline mode using "BundleInstall" to intstall plugins

* after run "BundleInstall" in VIM commandline, go to YCM (in .vim directory) then run below command to get submodules

```
 git submodule update --init --recursive
```

## Features

* autocomplete

* useful keymap

* config VIM as IDE

* manage all plugins in a elegant way
