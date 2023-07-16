return {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'numToStr/Comment.nvim',

    { -- LSP
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'folke/trouble.nvim',
            'ray-x/lsp_signature.nvim',
            'Maan2003/lsp_lines.nvim',
            {'williamboman/mason.nvim', config = true},
            'williamboman/mason-lspconfig.nvim',
        }
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
        }

    },
            -- Color Schemas
    {
        'catppuccin/nvim', name = 'catppuccin', priority = 1000
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