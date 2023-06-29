local M = {}

-- Set Space to Leader
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false}) -- makes sure space cant take any other map
vim.g.mapleader = " "                                              -- set space as leader

local keymaps = {
    -- Save and Quit Maps
    {'n' , 'qq', ':q!<cr>', 'Quit'},
    {'n' , 'qw', ':wq<cr>', 'Save and Quit'},
    {'n' , 'ww', ':w<cr>', 'Save'},

    {'n', '<leader>f', ':noh<cr>', 'clear search highlight'},
}

function M.keymap(table)
    table = table or {}
    if not table.opts then table.opts = {} end
    table.opts['noremap'] = table.opts.noremap or true
    table.opts['desc'] = table.desc
    vim.keymap.set(table.mode, table.key, table.command, table.opts)
end

for _, i in pairs(keymaps) do
    M.keymap{mode=i[1], key=i[2], command=i[3], desc=i[4]}
end

return M