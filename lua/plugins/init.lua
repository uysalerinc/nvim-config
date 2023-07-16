local plugins = {
    'lazy',
    'cmp',
    'lsp',
    'telescope',
    'colorschemas',
    'which-key',
    'treesitter',
    'autopairs',
    'comment',
    'gitsigns',
    'nvim-tree',
    'bufferline',
    'lualine',
    'toggleterm',
    'alpha',

}

for _, plugin in pairs(plugins) do
    local ok, err = pcall(require, "plugins." .. plugin)
    if not ok then
        vim.notify(err, vim.log.levels.ERROR, {
            title = "Error loading : " .. plugin
        })
    end
end
