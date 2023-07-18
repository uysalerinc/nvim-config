local ok, rt = pcall(require, 'rust-tools')
if not ok then
    return
end

rt.setup()
