local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
    return
end

lsp.preset('recommended')

lsp.ensure_installed({

        -- Rust, C/C++ Servers
        --[[ 'clangd',
        'clang-format',
        'codelldb',
        'rust-analyzer', ]]


})

lsp.nvim_workspace()

lsp.setup()
