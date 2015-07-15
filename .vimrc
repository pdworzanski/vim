execute pathogen#infect()
autocmd vimenter * NERDTree
autocmd vimenter * filetype indent plugin on
autocmd vimenter * :20winc>
autocmd vimenter * :set number

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowBookmarks=1

set guitablabel=%t
set mouse=a
set ttymouse=xterm2
set number
set hlsearch
set incsearch
set nowrap
set clipboard=unnamedplus
set cursorline

" Turn off swap/backups
set nobackup
set noswapfile

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Tlist
"let Tlist_Auto_Open=1
let tlist_php_settings='php;c:class;f:function' 
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
"let Tlist_Use_Horiz_Window=1

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_show_visibility = 0
" autocmd VimEnter * nested :call tagbar#autoopen(1)
" autocmd FileType * nested :call tagbar#autoopen(0)

" Code sniffer
""let g:phpqa_codesniffer_args = "--standard=PSR2"
"let g:phpqa_codesniffer_cmd='/home/przemek/.phpbrew/php/php-5.3.29/bin/phpcs'
""let g:phpqa_codesniffer_cmd='/home/polcode/.phpbrew/php/php-5.3.28/bin/phpcs'
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
"let g:phpqa_codesniffer_autorun = 0
let g:phpqa_open_loc = 1

let g:phpcomplete_index_composer_command="php ../composer.phar"
autocmd FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

colorscheme monokai
colorscheme wells-colors
 
let mapleader=";"

map <Leader>n :NERDTreeToggle<CR>
map <Leader>e :NERDTreeFind<CR>

" Reload current file
map <Leader>r :e!<CR>

" Tabs navigation
map <Leader>f gt
map <Leader>d gT

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clear search buffer
nmap <silent> <Leader>, :nohlsearch<CR>

nnoremap <silent> <F3> :TlistToggle<CR>
nnoremap <silent> <F4> :TagbarToggle<CR>

map <Leader>b :CtrlPBuffer<CR>

nnoremap <Leader>s> :!bash<CR>

" copy filename of current buffer
:nmap <Leader>ccc :let @+ = expand("%:t")<CR>

" copy relative path to current buffer
:nmap <Leader>c :let @+ = expand("%")<CR>

" copy full path to current buffer
:nmap <Leader>cc :let @+ = expand("%:p")<CR>

