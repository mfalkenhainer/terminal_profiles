local function gh(repo) return 'https://github.com/' .. repo end

-- Telescope
vim.pack.add({ gh 'nvim-lua/plenary.nvim' })
vim.pack.add({ gh 'nvim-telescope/telescope.nvim' })
vim.pack.add({ gh 'nvim-telescope/telescope-live-grep-args.nvim' })
vim.pack.add({ gh 'nvim-telescope/telescope-ui-select.nvim' })

-- Treesitter
vim.pack.add({ gh 'nvim-treesitter/nvim-treesitter' })
vim.pack.add({ gh 'nvim-treesitter/nvim-treesitter-context' })

-- Ember Theme
vim.pack.add({ gh 'ember-theme/nvim' })

-- LSP
vim.pack.add({ gh 'neovim/nvim-lspconfig' })
vim.pack.add({ gh 'mason-org/mason.nvim' })
vim.pack.add({ gh 'mason-org/mason-lspconfig.nvim' })
vim.pack.add({ gh 'folke/trouble.nvim' })

-- Autocomplete
vim.pack.add({ gh 'L3MON4D3/LuaSnip' })
vim.pack.add({ gh 'saghen/blink.lib' })
vim.pack.add({ gh 'saghen/blink.cmp' })

-- Mini
vim.pack.add({ gh 'nvim-mini/mini.nvim' })

-- Which Key
vim.pack.add({ gh 'nvim-tree/nvim-web-devicons' })
vim.pack.add({ gh 'folke/which-key.nvim' })

-- LuaLine
vim.pack.add({ gh 'nvim-lualine/lualine.nvim' })
vim.pack.add({ gh 'j-hui/fidget.nvim' })

-- Git
vim.pack.add({ gh 'lewis6991/gitsigns.nvim' })
-- vim.pack.add({ 'file:///' .. os.getenv('NVIM') .. '/git-worktree.nvim' })

-- Yazi
vim.pack.add({ gh 'mikavilpas/yazi.nvim' })

-- VimBeGood
vim.pack.add({ gh 'ThePrimeagen/vim-be-good' })

-- DiffView
vim.pack.add({ gh 'sindrets/diffview.nvim' })

-- Conform
vim.pack.add({ gh 'stevearc/conform.nvim' })

-- Snacks
vim.pack.add({ gh 'folke/snacks.nvim' })

-- Fancy Tabs
vim.pack.add({ gh 'akinsho/bufferline.nvim' })

-- Persistence
vim.pack.add({ gh 'folke/persistence.nvim' })

-- TSX Pairs
vim.pack.add({ gh 'windwp/nvim-ts-autotag' })

-- Mermaid Charts
vim.pack.add({ gh 'kevalin/mermaid.nvim' })

-- Minuet AI autocomplete
vim.pack.add({ gh 'milanglacier/minuet-ai.nvim' })
