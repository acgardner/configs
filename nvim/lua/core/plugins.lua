local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- markdown preview
Plug "iamcco/markdown-preview.nvim"

-- lsp
Plug "williamboman/mason.nvim"
Plug "williamboman/mason-lspconfig.nvim"
Plug "neovim/nvim-lspconfig"

Plug "nvim-lualine/lualine.nvim" -- lualine

-- autocompletion
Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-nvim-lsp"
Plug("L3MON4D3/LuaSnip", {tag="v1.*"})
Plug "saadparwaiz1/cmp_luasnip"
Plug "rafamadriz/friendly-snippets"

Plug "folke/trouble.nvim" -- diagnose errors
Plug "jiangmiao/auto-pairs" -- auto-close braces, scopes, etc: ( [ {
Plug("neoclide/coc.nvim", {branch="release"}) -- intellisense engine

-- fuzzy finder for files, etc
Plug "nvim-lua/plenary.nvim"
Plug("nvim-telescope/telescope.nvim", {branch="0.1.x"})

-- tree-like side bar
Plug "nvim-tree/nvim-web-devicons"
Plug "nvim-tree/nvim-tree.lua"

Plug "nvim-treesitter/nvim-treesitter" -- treesitter
Plug("akinsho/bufferline.nvim", {tag="v3.*"}) -- bufferline
Plug "tpope/vim-fugitive" -- git integration
Plug("glepnir/dashboard-nvim", {event="VimEnter"}) -- dashboard for neovim
Plug("baliestri/aura-theme", {rtp="packages/neovim"}) -- aura theme
Plug("akinsho/toggleterm.nvim", {tag="v2.6.0"}) -- toggle multiple terminals

-- js syntax highlighting
Plug "yuezk/vim-js"
Plug "maxmellon/vim-jsx-pretty"

Plug "sheerun/vim-polyglot" -- syntax highlighting
Plug "Pocco81/true-zen.nvim" -- zen mode
Plug "aserowy/tmux.nvim" -- tmux integration
Plug "folke/twilight.nvim" -- twilight
Plug "romgrk/barbar.nvim" -- tabline control

vim.call("plug#end")

