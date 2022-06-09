" Plug Commands:
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'davidhalter/jedi-vim' " jedi for python
Plug 'Vimjas/vim-python-pep8-indent' " better indenting for python
Plug 'phux/vim-snippets'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2' " autocomplete plugin
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'HansPinckaers/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

call plug#end()


" Let Commands:
let g:python3_host_prog = '/usr/local/bin/python3' " path to python3

let g:jedi#force_py_version=3
let g:jedi#auto_initialization=1
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration=0
let g:jedi#smart_auto_mappings=0
let g:jedi#popup_on_dot=0
let g:jedi#completions_command=""
let g:jedi#show_call_signatures="1"

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsRemoveSelectModeMappings=0

let g:ncm2#matcher='substrfuzzy'
let ncm2#popup_delay=5
let ncm2#complete_length=[[1,1]]


" Key Binding Commands:
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')


" Set Commands:
set number
set history=1000
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set splitright
set splitbelow
set tabstop=4		" number of visual spaces per TAB
set softtabstop=4	" number of spaces in tab when editing
set shiftwidth=4 	" number of spaces to use for auto-indent
set expandtab		" tabs are spaces
set autoindent
set copyindent		" copy indent from the previous line
set mouse=a         " enable mouse for all actions


" Other Commands:
autocmd BufEnter * call ncm2#enable_for_buffer() " enable ncm2 for all buffers
