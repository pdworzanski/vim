execute pathogen#infect()
autocmd vimenter * NERDTree
autocmd vimenter * filetype indent plugin on
autocmd vimenter * filetype plugin on
autocmd vimenter * :30winc>
autocmd vimenter * :set number

:command! -nargs=0 Evi tabe ~/.vimrc

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowBookmarks=0
"let NERDTreeMapOpenInTab='\r'
"let NERDTreeMapOpenInTab='<ENTER>'
let g:NERDTreeWinSize=25

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

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

" Following three lines remove the auto copy function from VIM
set guioptions-=a
set guioptions-=A
set guioptions-=aA

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

" Syntastic - syntax checker
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_aggregate_errors = 1
let g:syntastic_php_checkers = []
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_javascript_eslint_args = "--no-eslintrc --quiet"

"let g:syntastic_twig_checkers = ["html/jshint","twig/twiglint"]
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_css_csslint_args = "--quiet --warnings='*'"

" Code sniffer
"let g:phpqa_codesniffer_args = "--standard=PSR2"
" Turn off warrnings
let g:phpqa_codesniffer_args = "--standard=PSR2 -n"
let g:phpqa_codesniffer_cmd='/usr/bin/phpcs'

"let g:phpqa_codesniffer_cmd='/home/przemek/.phpbrew/php/php-5.3.29/bin/phpcs'
""let g:phpqa_codesniffer_cmd='/home/polcode/.phpbrew/php/php-5.3.28/bin/phpcs'
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 1
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

" Horizonal scroll
map <Leader>l zl
map <Leader>h zh

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

set wildignore+=*/web/css/*,*/web/js/*,*/var/*,*/.git/*

" DBGPavim
let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0

" VDEBUG
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9009
" let g:vdebug_options.break_on_open = 0
let g:vdebug_options.path_maps = {"/var/www/html": "/home/pdworzanski/projects/nlfisher/eim/docker/project"}

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

" Gitgutter dirty fix
let g:gitgutter_max_signs=9999



function! s:Sf2jmp2controllerFromRoute()

    let l:save_clipboard = &clipboard
    set clipboard= " Avoid clobbering the selection and clipboard registers.
    let l:save_reg = getreg('"')
    let l:save_regmode = getregtype('"')
    normal! yi'
    let l:text = @@ " Your text object contents are here.
    call setreg('"', l:save_reg, l:save_regmode)
    let &clipboard = l:save_clipboard

    echohl WarningMsg | echomsg "selected route: " . l:text . "  " | echohl None

    let shellcmd = 'bin/console debug:router -v ' . l:text
    let output = system(shellcmd)

    if v:shell_error
        echo output
        return 0
    endif

    let $ctrl_path = ''

    for m in split(output, "\n")
        let row = split(m)
        if len(row) == 5 && get(row, 1) == "Callable"
            let [controller, action] = split(get(row, 3), '::')
            let $ctrl_path = substitute(controller, "\\", "/", "g")
            let $ctrl_path = 'src/' . $ctrl_path . '.php'
        endif
    endfor

    if filereadable($ctrl_path)
        execute "tabedit +/" . action . " " . $ctrl_path
    else
        echohl WarningMsg | echomsg "could not open controller (path: " . $ctrl_path . ")" | echohl None
    endif
    
endfunction

com! Sf2jmp2controllerFromRoute call s:Sf2jmp2controllerFromRoute()
autocmd BufEnter *.php nmap <buffer><leader>jr :Sf2jmp2controllerFromRoute<CR>
autocmd BufEnter *.twig nmap <buffer><leader>jr :Sf2jmp2controllerFromRoute<CR>
autocmd BufEnter *.js nmap <buffer><leader>jr :Sf2jmp2controllerFromRoute<CR>

function! s:Sf2jmp2serviceFromName()

    let l:save_clipboard = &clipboard
    set clipboard= " Avoid clobbering the selection and clipboard registers.
    let l:save_reg = getreg('"')
    let l:save_regmode = getregtype('"')
    normal! yi'
    let l:text = @@ " Your text object contents are here.
    call setreg('"', l:save_reg, l:save_regmode)
    let &clipboard = l:save_clipboard

    echohl echomsg "selected service: " . l:text . "  " | echohl None

    let shellcmd = 'bin/console debug:container -v ' . l:text
    let output = system(shellcmd)

    if v:shell_error
        echo output
        return 0
    endif

    let $srv_path = ''

    for m in split(output, "\n")
        let row = split(m)
        if len(row) == 2 && get(row, 0) == "Class"
            let $service = get(row, 1)
            let $srv_path = substitute($service, "\\", "/", "g")
            let $srv_path = 'src/' . $srv_path . '.php'
        endif
    endfor

    if filereadable($srv_path)
        execute "tabedit +/class " . $srv_path
    else
        echohl WarningMsg | echomsg "could not open service (path: " . $srv_path . ")" | echohl None
    endif
    
endfunction

com! Sf2jmp2serviceFromName call s:Sf2jmp2serviceFromName()
autocmd BufEnter *.php nmap <buffer><leader>js :Sf2jmp2serviceFromName<CR>
