local ok, nvtree = pcall(require, 'nvim-tree')
if not ok then
    return
end

nvtree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})
