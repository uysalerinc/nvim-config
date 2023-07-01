local M = {
    'neovim/nvim-lspconfig',
    event = { "BuffReadPre", "BuffNewFile"},
    dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf", config = true},
        { "folke/neodev.nvim", opts = { experimental = {pathStrict = true} }},
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "hrsh7th/cmp-nvim-lsp",
            cond = function ()
                return require("lazy").has("nvim-cmp")
            end,
        },
    },
}
M.opts = {
    diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "🞇",
        },
        severity_sort = true,
    },
    capabilities ={},
    autoformat = true,
    format = {
        formatting_options = nil,
        timeout_ms = nil,
    },
    servers = {
        jsonls = {},
        lua_ls ={
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        },
    },
}
M.setup = {

}
M.config = function (_, opts)
    
end
return M