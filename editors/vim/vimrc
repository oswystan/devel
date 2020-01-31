"#######################################################
"
" 1. Get vundle by this:
"    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" 2. Run:BundleInstall
"
" 3. vim-go need to download src from : http://gopm.io
"    then you need to modify the file: ./container/intsets/popcnt_amd64.s 
"
" 4. vim-godef needs godef binary, it can be found in github.com
"
"#######################################################
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
set laststatus=2
set statusline=%<%f%m\ \[%{&ff}:%{&fenc}]\ %c/%l/%L\ %p%%\ \ %=%{strftime('%Y-%m-%d\ %H:%M:%S\ %a\ W%V')}\ 

Bundle 'gmarik/vundle'
Bundle 'c.vim'
Bundle 'a.vim'
Bundle 'taglist.vim'
Bundle 'winmanager'
Bundle 'flazz/vim-colorschemes'
Bundle 'vim-misc'
Bundle 'xolox/vim-colorscheme-switcher'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'fatih/vim-go'
Bundle 'dgryski/vim-godef'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'vim-cscope'
Bundle 'vim-scripts/DrawIt'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

filetype on
filetype plugin indent on

au BufNewFile,BufRead */bin/*
	\ if match(getline(1), 'env node') > 0
	\|  setf javascript
	\|endif

" configurations 
set ignorecase
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4
set incsearch
set hlsearch
set cursorline
set nu

syntax on

" color scheme
set t_Co=256
let g:molokai_original=1
let g:rehash256=1
colorscheme molokai

let g:C_FormatDate = '%F'
let g:C_FormatTime = '%T'
let g:C_FormatYear = '%Y'

" key mapping
let mapleader=","
nmap <leader>n :set number!<CR>
nmap <leader>x :wq<CR>
nmap <leader>z :q!<CR>
nmap <leader>w :NERDTreeToggle<CR>
nmap <leader>m :!make<CR>
nmap <leader>bd :bdelete!<CR>
nmap <leader>a :bp<CR>
nmap <leader>f :bn<CR>
nmap <leader>l :ls<CR>
nmap <C-h> :vertical res +1<CR>
nmap <C-l> :vertical res -1<CR>
nmap <C-p> :cs find f 
vmap <leader>e :Tabularize /=<CR>
vmap <leader>c :Tabularize /:<CR>

au filetype c,cpp,java,sh,javascript,python nmap <leader>t :TlistToggle<CR>
au filetype javascript nmap <leader>f :call JsBeautify()<CR>

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" trim spaces at end of line
au filetype javascript,c,cpp,h,sh,markdown,php autocmd BufWritePre * :%s/\s\+$//e
au filetype sh autocmd BufUnload * :!chmod u+x %

" for tagbar
let g:tagbar_left = 1
let g:tagbar_width = 30
"let g:tagbar_compact = 1
let g:tagbar_type_go = { 
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" for golang environment
autocmd FileType go nmap <F5> :TagbarToggle<CR>
let g:godef_same_file_in_same_window=1
let g:godef_split=1
let g:go_fmt_command="goimports"
au filetype go nmap <leader>p :GoImports<CR>
au filetype go nmap <leader>l :GoLint<CR>
au filetype go nmap <leader>r :GoRun<CR>
au filetype go nmap <leader>re :GoReferrers<CR>
au filetype go nmap <leader>c :GoCallees<CR>
au filetype go nmap <leader>d :GoDoc<CR>
au filetype go nmap <leader>b :GoBuild<CR>
au filetype go nmap <leader>i :GoInfo<CR>
au filetype go nmap <leader>f :GoFiles<CR>
au filetype go nmap <leader>e :GoErrCheck<CR>
au filetype go nmap <leader>t :TagbarToggle<CR>

" download go packages
"     go get -d github.com/golang/tools
"     go install golang.org/x/tools/cmd/guru
"     go install golang.org/x/tools/cmd/gorename
"     go install golang.org/x/tools/cmd/goimports

" this only works on mac osx system
let s:__os__=system('uname -s')
if match(s:__os__,'Darwin') == 0
    let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
endif
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_confirm_extra_conf=0

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"#######################################################
