local ok, ts_conf = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end

-- vim.cmd [[highlight rainbowcol6 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight rainbowcol5 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight rainbowcol4 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight rainbowcol3 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight rainbowcol2 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight rainbowcol1 guifg=#C678DD gui=nocombine]]


ts_conf.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
  --[[ context_commentstring = {
    enable  = true,
    enable_autocmd = false,
  }, ]]

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    --[[ disable = function(lang, buf) ]]
    --[[     local max_filesize = 100 * 1024 -- 100 KB ]]
    --[[     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf)) ]]
    --[[     if ok and stats and stats.size > max_filesize then ]]
    --[[         return true ]]
    --[[     end ]]
    --[[ end, ]]

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
        colors = {
        --[[ "IndentBlanklineIndent1", ]]
        --[[ "IndentBlanklineIndent2", ]]
        --[[ "IndentBlanklineIndent3", ]]
        --[[ "IndentBlanklineIndent4", ]]
        --[[ "IndentBlanklineIndent5", ]]
        --[[ "IndentBlanklineIndent6", ]]
        }
    },

  indent = {
    enable = true,
  },
}
