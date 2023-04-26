--------------------------------------------------
-- global variables
--------------------------------------------------
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nog>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.coc_disable_startup_warning = 1

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--------------------------------------------------
-- local variables
--------------------------------------------------
local api = vim.api
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

opt.ignorecase = true
opt.mouse = "a"
opt.number = true
opt.smartcase = true
opt.ttyfast = true
opt.termguicolors = true
opt.wildmode = "longest,list"
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
Plug('glepnir/dashboard-nvim', {event='VimEnter'})

-- theme
Plug('folke/tokyonight.nvim', {branch='main'})

-- toggle multiple terminals
Plug('akinsho/toggleterm.nvim', {tag='v2.6.0'})

-- js syntax highlighting
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

-- syntax highlighting
Plug 'sheerun/vim-polyglot'

-- zen mode
Plug 'Pocco81/true-zen.nvim'

-- tmux integration
Plug 'aserowy/tmux.nvim'

-- twlight
Plug 'folke/twilight.nvim'

vim.call('plug#end')

--------------------------------------------------
-- set up packages
--------------------------------------------------
-- twilight
require("twilight").setup()

-- tmux integration
require("tmux").setup()

-- bufferline
require("bufferline").setup({
options = {
close_icon = 'x',
}
})

-- dashboard
require("dashboard").setup()

-- directory tree
require('nvim-tree').setup()
local function open_nvim_tree()
require('nvim-tree.api').tree.open()
end
-- open_nvim_tree()

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

-- true zen
require("true-zen").setup()

--------------------------------------------------
-- key mappings
--------------------------------------------------
-- twilight
api.nvim_set_keymap("n", "<leader>tw", ":Twilight<CR>", opts)

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- true-zen
keymap("n", "<leader>za", ":TZAtaraxis<CR>", opts)
keymap("n", "<leader>zf", ":TZFocus<CR>", opts)
keymap("n", "<leader>zm", ":TZMinimalist<CR>", opts)
keymap("n", "<leader>zn", ":TZNarrow<CR>", opts)

-- toggleterm
api.nvim_set_keymap("n", "<leader>tt", ":ToggleTerm<CR>", opts)

-- nvim-tree
api.nvim_set_keymap("n", "<leader>tr", ":NvimTreeToggle<CR>", opts)

--------------------------------------------------
-- set theme
--------------------------------------------------
vim.cmd([[colorscheme tokyonight-moon]])
