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
let mapleader=','
let g:mapleader=','

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
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '.git', 'tags', 'cscope*']

" -------------------------------------------------------
" Tagbar setting
" -------------------------------------------------------
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus=1

" -------------------------------------------------------
" Cscope setting
" -------------------------------------------------------
function! LoadCscope()
    let db=findfile("cscope.out", ".;")
    if (!empty(db))
	let path=strpart(db, 0, match(db, "/cscope.out$"))
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
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py '
let g:ycm_filetype_whitelist={
	    \ "c":1,
	    \ "cpp":1,
	    \ "h":1,
	    \ "sh":1,
	    \ "zsh":1,
	    \ }
set completeopt=menu,menuone,noinsert,noselect
let g:ycm_semantic_triggers={
	    \ 'c,h': ['->', '.'],
	    \ 'cpp,hpp,cuda,objcpp': ['->', '.', '::'],
	    \ }

let g:ycm_confirm_extra_conf=0
let g:ycm_use_clangd=0 

" diagnostic
let g:ycm_show_diagnostics_ui=0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0

" trigger
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_min_num_identifier_candidate_chars=2
let g:ycm_auto_trigger=1

" UI
let g:ycm_add_preview_to_completeopt=0
let g:ycm_max_num_candidates=50
let g:ycm_autoclose_preview_window_after_completion=1

" Others
let g:ycm_use_ultisnips_completer=1
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_complete_in_strings=0
let g:ycm_seed_identifiers_with_syntax=0
let g:ycm_cache_omnifunc=0
let g:ycm_disable_for_files_larger_than_kb=1000
