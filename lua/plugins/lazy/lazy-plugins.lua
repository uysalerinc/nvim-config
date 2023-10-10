return {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'numToStr/Comment.nvim',
    'akinsho/toggleterm.nvim',
    'stevearc/oil.nvim',
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

    'norcalli/nvim-colorizer.lua',
    {'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

    -- Markdown Preview
    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      enabled = true,
      ft = "markdown",
    },

    -- Discord
    'andweeb/presence.nvim',

    -- Rust Stuff
    {
        'rust-lang/rust.vim',
        ft = 'rust',
        init = function ()
           vim.g.rustfmt_autosave = 1
        end
    },
    {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        dependencies = {
            'neovim/nvim-lspconfig',
        },
    },
    {
        'Saecki/crates.nvim',
        ft = {'rust', 'toml'},
    },

    -- Git Stuff
    'lewis6991/gitsigns.nvim',

    { -- LSP
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'folke/trouble.nvim',
            'ray-x/lsp_signature.nvim',
            'Maan2003/lsp_lines.nvim',
            {'williamboman/mason.nvim', config = true},
            'williamboman/mason-lspconfig.nvim',
            'jose-elias-alvarez/null-ls.nvim',
        }
    },

    'mfussenegger/nvim-dap',
    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'mfussenegger/nvim-dap',
    },
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event= 'InsertEnter',
    },

    { -- Auto Completion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
    },

    { --Autopairs
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-context',
            'JoosepAlviste/nvim-ts-context-commentstring',
            'mrjones2014/nvim-ts-rainbow',
        }

    },
            -- Color Schemas
    {'catppuccin/nvim', name = 'catppuccin', priority = 1000},
    {'dracula/vim', lazy = false},

    {'nvim-lualine/lualine.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}, opts = true},

    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        dependencies = {'nvim-tree/nvim-web-devicons'},
    },

    {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {}
},

}
