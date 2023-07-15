return {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',

    { -- LSP
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
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

    {'folke/which-key.nvim', opts = {}},

}