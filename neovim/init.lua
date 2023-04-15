--------------------------------------------------
-- editor initialization
--------------------------------------------------
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

--------------------------------------------------
-- import packages
--------------------------------------------------
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- python autocompletion
Plug 'davidhalter/jedi-vim'

-- auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'

-- intellisense engine
Plug('neoclide/coc.nvim', {branch = 'release'})

-- tree-like side bar 
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

-- git integration
Plug 'tpope/vim-fugitive'

vim.call('plug#end')

--------------------------------------------------
-- set up directory tree
--------------------------------------------------
require('nvim-tree').setup()

local function open_nvim_tree()
    require('nvim-tree.api').tree.open()
end

open_nvim_tree()

--------------------------------------------------
-- configure keybindings
--------------------------------------------------
vim.cmd([[
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
]])

--------------------------------------------------
-- define editor settings
--------------------------------------------------
vim.cmd([[
set autoindent
set backupdir=~/.cache/nvim
set cc=120
set mouse=a
set nocompatible
set number
set shiftwidth=4
set tabstop=4
set ttyfast
set wildmode=longest,list
]])

vim.g.coc_disable_startup_warning = 1
