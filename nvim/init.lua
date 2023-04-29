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
local Plug = vim.fn["plug#"]

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
opt.wildchar = 0
opt.wildmenu = true
opt.wildmode = "longest:full,full"

--------------------------------------------------
-- import packages
--------------------------------------------------
vim.call("plug#begin")

-- lsp
Plug "williamboman/mason.nvim"
Plug "williamboman/mason-lspconfig.nvim"
Plug "neovim/nvim-lspconfig"

-- lualine
Plug "nvim-lualine/lualine.nvim"

-- autocompletion
Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-nvim-lsp"
Plug("L3MON4D3/LuaSnip", {tag="v1.*"})
Plug "saadparwaiz1/cmp_luasnip"
Plug "rafamadriz/friendly-snippets"

-- diagnose errors
Plug "folke/trouble.nvim"

-- auto-close braces, scopes, etc: ( [ {
Plug "jiangmiao/auto-pairs"

-- intellisense engine
Plug("neoclide/coc.nvim", {branch="release"})

-- fuzzy finder for files, etc
Plug "nvim-lua/plenary.nvim"
Plug("nvim-telescope/telescope.nvim", {branch="0.1.x"})

-- tree-like side bar
Plug "nvim-tree/nvim-web-devicons"
Plug "nvim-tree/nvim-tree.lua"

-- treesitter
Plug "nvim-treesitter/nvim-treesitter"

-- bufferline
Plug("akinsho/bufferline.nvim", {tag="v3.*"})

-- git integration
Plug "tpope/vim-fugitive"

-- dashboard for neovim
Plug("glepnir/dashboard-nvim", {event="VimEnter"})

-- aura theme
Plug("baliestri/aura-theme", {rtp="packages/neovim"})

-- toggle multiple terminals
Plug("akinsho/toggleterm.nvim", {tag="v2.6.0"})

-- js syntax highlighting
Plug "yuezk/vim-js"
Plug "maxmellon/vim-jsx-pretty"

-- syntax highlighting
Plug "sheerun/vim-polyglot"

-- zen mode
Plug "Pocco81/true-zen.nvim"

-- tmux integration
Plug "aserowy/tmux.nvim"

-- twlight
Plug "folke/twilight.nvim"

-- tabline control
Plug "romgrk/barbar.nvim"

vim.call("plug#end")

--------------------------------------------------
-- set up packages
--------------------------------------------------
-- lsp
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = nil

require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- vs code-like snippets
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-o>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
    }),
})

require("luasnip.loaders.from_vscode").load({
  include = { "python" },
})

-- lualine
require("lualine").setup()

-- twilight
require("twilight").setup()

-- tmux integration
require("tmux").setup()

-- bufferline
require("bufferline").setup({
  options = {
    close_icon = "x",
  },
})

-- dashboard
require("dashboard").setup()

-- directory tree
require("nvim-tree").setup()
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

-- telescope
-- local telescope = require("telescope.builtin")
-- keymap("n", "<leader><space>", telescope.buffers, {})
-- keymap("n", "<leader>?", telescope.oldfiles, {})
-- keymap("n", "<leader>ff", telescope.find_files, {})
-- keymap("n", "<leader>fg", telescope.live_grep, {})
-- keymap("n", "<leader>fb", telescope.buffers, {})
-- keymap("n", "<leader>fd", telescope.diagnostics, {})
-- keymap("n", "<leader>fh", telescope.help_tags, {})
-- keymap("n", "<leader>fs", telescope.current_buffer_fuzzy_find, {})

-- toggleterm
require("toggleterm").setup()

-- trouble
require("trouble").setup()

-- true zen
require("true-zen").setup()

--------------------------------------------------
-- key mappings
--------------------------------------------------
-- coc autocompletion
vim.keymap.set(
  "i",
  "<Tab>",
  function()
    if vim.fn["coc#pum#visible"]() == 1 then
      vim.fn["coc#pum#confirm"]()
    else
      return "<CR>"
    end
  end,
  opts
)

-- barbar
keymap("n", "<leader>pt", ":BufferPrevious<CR>", opts)
keymap("n", "<leader>nt", ":BufferNext<CR>", opts)

-- twilight
keymap("n", "<leader>tw", ":Twilight<CR>", opts)

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
keymap("n", "<leader>tt", ":ToggleTerm<CR>", opts)

-- nvim-tree
keymap("n", "<leader>tr", ":NvimTreeToggle<CR>", opts)

keymap("n", "<leader>pi", ":PlugInstall<CR>", opts)
keymap("n", "<leader>pu", ":PlugUpdate<CR>", opts)

--------------------------------------------------
-- set theme
--------------------------------------------------
vim.cmd([[colorscheme aura-soft-dark]])
