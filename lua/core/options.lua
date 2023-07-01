-- :help options
-- :help option-list for all options
local vcmd = vim.cmd

local options = {

    mouse = 'a',                                        -- lets you use the mouse, but in vim who need a mouse?!
    termguicolors = true,                               -- set term gui colors

    conceallevel = 0,                                   -- make ` visible in markdown files

    cmdheight = 2,                                      -- more space for commandline
    pumheight = 10,                                    	-- pop-up menu height

    expandtab = true,                                   -- Tabs to spaces, simple.
    softtabstop = 4,                                    -- Number of spaces for tabs.
    shiftwidth = 4,                                     -- number of spaces to use for each step of (auto)indent.
    smarttab = true,                                    -- a Tab in front of a line insterts blanks accorind to shiftwidth.

    showtabline = 4,                                    -- always show tab
    sidescrolloff = 8,                                  -- Minimal number of screen columns to keep left and to the right
    numberwidth = 4,                                    -- Set number column width
    signcolumn = "yes",                                 -- When and how to draw the signcolumn yes = always
    showmode = false,                                   -- 
    splitbelow = true,                                  -- force horizontal splits go to below
    splitright = true,                                  -- force vertical splits go to right

    hlsearch = true,                                    -- highlight all matches on previous pattern
    smartcase = true,                                   -- smartcase
    ignorecase = true,                                  -- ignore case sensivity

    cursorline = true,                                  -- Highlight the text line of the cursor
    number = true,                                      -- Shows line number
    relativenumber = false,                             -- Its cringe for me. I know its false by default but i want to force it lol.
    undodir = os.getenv("HOME") .. "/.vim/undodir",     -- Undo files directory
    undofile = true,                                    -- Vim automatically saves undo history. Then allows persistent undo

    backup = false,                                     -- dont allow to create a backup file
    swapfile = false,                                   -- close swapfiles
    writebackup = false,                                -- We dont have backup files

    clipboard = "unnamedplus",                          -- access to the system clipboard            
    completeopt = {"menuone", "noselect"},              -- for cmp uwu
    fileencoding = "utf-8",                             -- encoding written to flies
    scrolloff =8,                                       -- Minimal number of screen lines to keep above and below

    smartindent = true,                                 -- smart indent
    whichwrap = "<>hl",                                 -- Allows move to previous/next line with h l and arrowkeys
    wrap = false,                                       -- Long one lines

    timeoutlen = 1000,                                  -- time to wait a keymap sequence (in miliseconds)
    updatetime = 4000,                                  -- For faster completion. I dont recommend if you use swapfile on. Default is 4000 its fine for me



}

for option, value in pairs(options) do
	vim.opt[option] = value                             -- Adds options table to vim.opt 
end

vcmd "set iskeyword+=-"                                 -- adds "-" as keyword for assume variables in kebab-case as a word
vcmd "set shortmess+=c"                                 --  
