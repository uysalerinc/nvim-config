local ok, lines = pcall(require, 'lsp_lines')
if not ok then
    return
end

-- Disable virtual_text since it's redundant due to lsp_lines.
lines.setup()
vim.diagnostic.config({
  virtual_text = false,
})
