local M = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
    },
}
M.config = function ()
    local cmp = require("cmp")
    vim.opt.completeopt = {"menu", "menuone", "noselect"}

    cmp.setup({
        snippet = {
            expand = function (args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        window = {},
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<cr>'] = cmp.mapping.confirm({select = true}),
        }),
        sources = cmp.config.sources({
            { name = 'nvim-lsp'},
            { name = 'nvim-lua'},
            { name = 'luasnip'},
        },
        {
            { name = 'buffer'},
            { name = 'path'},
        }
    ),
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path'},
        },
        {
            { name = 'cmdline'},
        }
    ),
    })
end

return M
