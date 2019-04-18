"========================================================
" Let Vundle manage plugins
"========================================================
set nocompatible               
filetype off                   " required
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
filetype plugin indent on    " required

"========================================================
" Normal setting
"========================================================
" always show status bar
set ls=2

" incremental search
set incsearch
" highlight search results
set hlsearch

set smartindent
set shiftwidth=4
set splitright
set splitbelow
set backspace=2
set clipboard=unnamed

" syntax highlight on
syntax on

" show line number
set nu

" set leader key
let mapleader = ','
let g:mapleader = ','

" set encoding
set encoding=utf-8

"========================================================
" Auto insert header
"========================================================

autocmd BufNewFile *.c exec ":call AddHeader()"
autocmd BufNewFile *.cc exec ":call AddHeader()"
autocmd BufNewFile *.h exec ":call AddHeader()"
map <F9> :call AddHeader()<cr>'s
function AddHeader()
    call append(0, "//*********************************************************************************")
    call append(1, "//")
    call append(2, "//  ".fnamemodify(getcwd(), ':t')." ".expand("%:t"))
    call append(3, "//")
    call append(4, "//  Created by Pingfeng on ".strftime("%m/%d/%y").".")
    call append(5, "//")
    call append(6, "//  Description: ")
    call append(7, "//")
    call append(8, "//*********************************************************************************")
    echohl WarningMsg | echo "Succeeded in adding copyright." | echohl None
endfunction
"========================================================
" Plugins initialization
"========================================================

" NERDTREE
Bundle 'scrooloose/nerdtree'
" TAGBAR
Bundle 'majutsushi/tagbar'
" YCM
Bundle 'Valloric/YouCompleteMe'

" -------------------------------------------------------
" NERDTree setting
" -------------------------------------------------------
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '.git', 'tags', 'cscope*']

" -------------------------------------------------------
" Tagbar setting
" -------------------------------------------------------
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" -------------------------------------------------------
" Cscope setting
" -------------------------------------------------------
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

" set keymap , '<C-_>' meaning 'CTRL + SHIFT + -"
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" -------------------------------------------------------
" YCM setting
" -------------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py '
" disable syntax checker
let g:ycm_show_diagnostics_ui = 0
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

let g:ycm_min_num_of_chars_for_completion = 1
set completeopt=longest,menu

" autoycm with language
let g:ycm_semantic_triggers =  {
	    \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{1}'],
	    \ 'cs,lua,javascript': ['re!\w{1}'],
	    \ }
" autoycm with filetype
let g:ycm_filetype_whitelist = {
	    \ "c":1,
	    \ "cpp":1,
	    \ "python":1,
	    \ "sh":1,
	    \ }

