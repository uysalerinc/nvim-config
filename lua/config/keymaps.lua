local M = {}

-- Set Space to Leader
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false}) -- makes sure space cant take any other map
vim.g.mapleader = " "                                              -- set space as leader

local keymaps = {
            -- Normal --

    -- Save and Quit Maps
    {'n' , 'qq', ':q!<cr>', 'Quit'},
    {'n' , 'qw', ':wq<cr>', 'Save and Quit'},
    {'n' , 'ww', ':w<cr>', 'Save'},

    -- Window Movement
    {'n' , '<C-h>', '<C-w>h', 'Move to left window'},
    {'n' , '<C-l>', '<C-w>l', 'Move to right window'},
    {'n' , '<C-j>', '<C-w>j', 'Move to window below'},
    {'n' , '<C-k>', '<C-w>k', 'Move to window above'},
--   {'n' , '<C-Left>', '<C-w>h', 'Move to left window'},
--   {'n' , '<C-Right>', '<C-w>l', 'Move to right window'},
--   {'n' , '<C-Down>', '<C-w>j', 'Move to window below'},
--   {'n' , '<C-Up>', '<C-w>k', 'Move to window above'},

    -- Resize
    {'n' , '<C-Up>', ':resize +2<cr>', 'horizontal resize up'},
    {'n' , '<C-Down>', ':resize -2<cr>', 'horizontal resize down'},
    {'n' , '<C-Right>', ':vertical resize +2<cr>', 'vertical resize up'},
    {'n' , '<C-Left>', ':vertical resize -2<cr>', 'vertical resize down'},

    -- Buffers
    {'n', '<leader>bl', ':bnext<cr>', 'next buffer'},
    {'n', '<leader>bh', ':bprevious<cr>', 'previous buffer'},
    {'n', '<leader>bk', ':bd<cr>', 'kill buffer'},

            -- Visual --

   -- Text Movement
    {'v' , '<A-j>', ":m '>+1<cr>gv-gv", 'Quit'},
    {'v' , '<A-k>', ":m '>-2<cr>gv-gv", 'Quit'},

            -- Insert --

    -- Fast exit insert mode 
    {'i' , 'jk', '<ESC>', 'Fast exit with jk'},

    {'n', '<leader>f', ':noh<cr>', 'clear search highlight'},


            -- Plugin Maps
    --Telescope
    { 'n', '<leader>t', ':Telescope fd<cr>', 'Find Files'},
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