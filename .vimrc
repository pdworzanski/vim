execute pathogen#infect()
autocmd vimenter * NERDTree
autocmd vimenter * filetype indent plugin on
autocmd vimenter * filetype plugin on
autocmd vimenter * :20winc>
autocmd vimenter * :set number

:command -nargs=0 Evi tabe ~/.vimrc

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowBookmarks=1
"let NERDTreeMapOpenInTab='\r'
"let NERDTreeMapOpenInTab='<ENTER>'

set guitablabel=%t
set ttymouse=xterm2
set mouse=a
set number
set hlsearch
set incsearch
set nowrap
set clipboard=unnamedplus
set cursorline
set splitright
set autoread

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
let tlist_ant_settings='ant;p:Project;r:Property;t:Target'
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
"let Tlist_Use_Horiz_Window=1

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_show_visibility = 1
let g:tagbar_compact = 0
" autocmd VimEnter * nested :call tagbar#autoopen(1)
" autocmd FileType * nested :call tagbar#autoopen(0)

" Code sniffer
"let g:phpqa_codesniffer_args = "--standard=PSR2"
" Turn off warrnings
let g:phpqa_codesniffer_args = "--standard=PSR2 -n"
let g:phpqa_codesniffer_cmd='/usr/bin/phpcs'

"let g:phpqa_codesniffer_cmd='/home/przemek/.phpbrew/php/php-5.3.29/bin/phpcs'
""let g:phpqa_codesniffer_cmd='/home/polcode/.phpbrew/php/php-5.3.28/bin/phpcs'
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_open_loc = 1

let g:phpcomplete_index_composer_command='/usr/local/bin/composer'
"let g:phpcomplete_index_composer_command="php ../composer.phar"
autocmd FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

colorscheme monokai
colorscheme wells-colors
 
let mapleader=";"

map <Leader>n :NERDTreeToggle<CR>
map <Leader>e :NERDTreeFind<CR>zz

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

" copy filename of current buffer without extension
:nmap <Leader>cccc :let @+ = expand("%:t:r")<CR>

" copy filename of current buffer
:nmap <Leader>ccc :let @+ = expand("%:t")<CR>

" copy relative path to current buffer
:nmap <Leader>c :let @+ = expand("%")<CR>

" copy full path to current buffer
:nmap <Leader>cc :let @+ = expand("%:p")<CR>

" auto open quickfix after :grep & :make
augroup QuickFixAutoload
autocmd QuickFixCmdPost [^l]* nested botright cwindow
autocmd QuickFixCmdPost    l* nested botright lwindow
augroup END

" CtrlP open in new tab on enter key
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_bufpath_mod = ''

let g:symfony_app_console_caller= "php"
let g:symfony_app_console_path= "app/console"
map <Leader>o :execute ":!"g:symfony_enable_shell_cmd<CR>

" first set path
set path+=**

" jump to a twig view in symfony
function! s:SfJumpToView()
    mark C
    normal! ]M
    let end = line(".")
    normal! [m
    try
        call search('v[^.:]+.html.twig', '', end)
        normal! gf
    catch
        normal! g`C
        echohl WarningMsg | echomsg "Template file not found" | echohl None
    endtry
endfunction
com! SfJumpToView call s:SfJumpToView()

" Change default PHP manual shortcut
let g:php_manual_online_search_shortcut = '<C-S-k>'

set wildignore+=*/web/css/*,*/web/js/*

" let g:dbgPavimPort = 9009
"let g:dbgPavimBreakAtEntry = 0

" Sort existing use statements alphabetically
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

" Automatically adds the corresponding use statement for the name under the cursor

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" Expands the name under the cursor to its fully qualified name.

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>cf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>cf :call PhpExpandClass()<CR>
