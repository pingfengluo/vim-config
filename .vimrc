"========================================================
" let Vundle manage plugin
set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
filetype plugin indent on    " required

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set nu

" set leader key
let mapleader = ','
let g:mapleader = ','

"========================================================



"========================================================
" Vim-plug initialization
" TAGBAR
Bundle 'majutsushi/tagbar'
" NERDTREE
Bundle 'scrooloose/nerdtree'
" YCM
Bundle 'Valloric/YouCompleteMe'

"========================================================



"========================================================
" -------------------------------
" Tagbar
" -------------------------------
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" -------------------------------
" NERDTree
" -------------------------------
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" -------------------------------
" CSCOPSE
" -------------------------------
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()
set cscopequickfix=s-,c-,d-,i-,t-,e-

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" -------------------------------
" YCM
" -------------------------------
let g:ycm_global_ycm_extra_conf = '/User/luopingfeng/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" disable syntax checker
let g:ycm_show_diagnostics_ui = 0
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>


"========================================================
