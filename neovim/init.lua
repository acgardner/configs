--------------------------------------------------
-- global variables
--------------------------------------------------
vim.g.coc_disable_startup_warning = 1

-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

--------------------------------------------------
-- local variables
--------------------------------------------------
local opt = vim.opt
local Plug = vim.fn['plug#']

--------------------------------------------------
-- define editor settings
--------------------------------------------------
-- tabs & indentation
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.tabstop = 4

-- window splitting
opt.splitbelow = true
opt.splitright = true

vim.opt.backupdir = "~/.cache/nvim"
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.smartcase = true
vim.opt.ttyfast = true
vim.opt.termguicolors = true
vim.opt.wildmode = "longest,list"
vim.g.coc_disable_startup_warning = 1

--------------------------------------------------
-- import packages
--------------------------------------------------
vim.call('plug#begin')

-- python autocompletion
Plug 'davidhalter/jedi-vim'

-- diagnose errors
Plug 'folke/trouble.nvim'

-- auto-close braces, scopes, etc: ( [ {
Plug 'jiangmiao/auto-pairs'

-- intellisense engine
Plug('neoclide/coc.nvim', {branch='release'})

-- fuzzy finder for files, etc
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {branch='0.1.x'})

-- tree-like side bar
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

-- bufferline
Plug('akinsho/bufferline.nvim', {tag='v3.*'})

-- git integration
Plug 'tpope/vim-fugitive'

-- dashboard for neovim
Plug 'glepnir/dashboard-nvim'

-- theme
Plug('folke/tokyonight.nvim', {branch='main'})

-- toggle multiple terminals
Plug('akinsho/toggleterm.nvim', {tag='v2.6.0'})

-- js syntax highlighting
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

-- syntax highlighting
Plug 'sheerun/vim-polyglot'

vim.call('plug#end')

--------------------------------------------------
-- set up packages
--------------------------------------------------
-- bufferline
require("bufferline").setup({
    options = {
        close_icon = 'x',
    }
})

-- dashboard
require("dashboard").setup({})

-- directory tree
require('nvim-tree').setup()
local function open_nvim_tree()
    require('nvim-tree.api').tree.open()
end
open_nvim_tree()

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader><space>', telescope.buffers, {})
vim.keymap.set('n', '<leader>?', telescope.oldfiles, {})
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fd', telescope.diagnostics, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set('n', '<leader>fs', telescope.current_buffer_fuzzy_find, {})

-- toggleterm
require("toggleterm").setup()

-- trouble
require("trouble").setup()

--------------------------------------------------
-- configure keybindings
--------------------------------------------------
vim.cmd([[
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
]])

--------------------------------------------------
-- set theme
--------------------------------------------------
vim.cmd([[colorscheme tokyonight-moon]])
