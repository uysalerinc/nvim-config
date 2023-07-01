local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", --latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local Util = require("lazy.core.util")
local M = {}

function M.has(plugin)
    return require("lazy.core.config").plugins[plugin] ~= nil
end

require("lazy").setup('plugins')