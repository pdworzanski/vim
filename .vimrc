execute pathogen#infect()
autocmd vimenter * NERDTree
autocmd vimenter * filetype indent plugin on
autocmd vimenter * :20winc>
autocmd vimenter * :set number

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowBookmarks=1
"let NERDTreeMapOpenInTab='\r'
"let NERDTreeMapOpenInTab='<ENTER>'


set guitablabel=%t
set mouse=a
set ttymouse=xterm2
set number
set hlsearch
set incsearch
set nowrap
set clipboard=unnamedplus
set cursorline
set splitright

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
let g:tagbar_show_visibility = 1
" autocmd VimEnter * nested :call tagbar#autoopen(1)
" autocmd FileType * nested :call tagbar#autoopen(0)

" Code sniffer
let g:phpqa_codesniffer_args = "--standard=PSR2"
let g:phpqa_codesniffer_cmd='/home/przemek/.phpbrew/php/php-5.3.29/bin/phpcs'
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

" Grep for word under the cursor
" command GREP :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc
nnoremap <leader>sg :silent execute "grep! -R " . input('Searching phrase: ') . " src/src"<cr>:copen<cr>
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand('<C-R>"')) . " %"<cr>:copen<cr>:colorscheme wells-colors<cr>

" CtrlP open in new tab on enter key
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:symfony_app_console_path= "src/app/console"
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

" create a mapping only in a Controller file
autocmd BufEnter *Controller.php nmap <buffer><leader>v :SfJumpToView<CR>

" Change default PHP manual shortcut
let g:php_manual_online_search_shortcut = '<C-S-k>'

set wildignore+=*/web/css/*,*/web/js/*

