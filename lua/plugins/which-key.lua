local ok, wk = pcall(require, 'which-key')
if not ok then
    return
end
local c_ok, crates = pcall(require, 'crates')
if not c_ok then
    print("Something wrong with crates")
end

local conf = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<leader>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  --motions = {
  --  count = true,
  --},
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
}

local normal_opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
  expr = false, -- use `expr` when creating keymaps
}

local normal_mappings = {
    t = {
        name = "+Telescope",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        n = { "<cmd>enew<cr>", "New File" },
        e = "Edit File",
    },
    l = {
        name ="+LSP",
        l = { function ()
            local lines = require('lsp_lines')
            lines.toggle()
        end, "Toggle LSP Lines"},

        r = { "<cmd>Telescope lsp_references<cr>", "Referances" },
        d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
        s = {
            name = "+Symbols",
            w = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
            d = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        },
    },
    g = {
      name = "+Git",
      b = {
            name = "+Blame",
            b = {"<cmd>Gitsigns blame_line<CR>", "Blame Current Line"},
            l = {"<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Blame Line"},
        },
      s = { "<cmd>Telescope git_status <cr>", "Git Status"},
      c = { "<cmd>Telescope git_commits <cr>", "Git Commits"},
        t = {
            name = "+Highligt",
            n = {"<cmd>Gitsigns toggle_numhl<CR>", "Toggle Number Highligt"},
            l = {"<cmd>Gitsigns toggle_linehl<CR>", "Toggle Line Highligt"},
            w = {"<cmd>Gitsigns toggle_word_diff<CR>", "Toggle Word Diff Highligt"},
        }
    },
    d = {
        name = "+Debug Adapter Protocol",
        b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Break Point"},
        s = { function ()
            local widgets = require('dap.ui.widgets')
            local sidebar = widgets.sidebar(widgets.scopes)
            sidebar.open()
        end, "Open sidebar" },
        n = { "<cmd>DapStepOut<cr>", "Next Step"},
        r = { "<cmd>DapContinue<cr>", "Start Debugging"},
    },
    r = {
        name ="+Rust",
        e = { "<cmd>RustExpandMacro<cr>", "Expand Macro"},
        r = { "<cmd>RustRunnables<cr>", "Run"},
        d = { "<cmd>RustDebuggables<cr>", "Debug"},
        k = { "<cmd>RustMoveItemUp<cr>", "Move Item Up"},
        j = { "<cmd>RustMoveItemDown<cr>", "Move Item Down"},
        h = {"<cmd>RustHoverActions<cr> <cmd>RustHoverActions<cr>", "Hover Actions Trigger"},
        p = { "<cmd>RustParentModule<cr>", "Go to Parent Module"},
        c = {
            name ="+Cargo",
            o ={"<cmd>RustOpenCargo<cr>", "Open Cargo.toml"},
            u ={function ()
                crates.upgrade_crate()
            end, "Upgrade Crate"},
            U ={function ()
                crates.upgrade_all_crates()
            end, "Upgrade All Crates"},
            D ={function ()
                crates.open_documentation()
            end, "Open Documentation"},
            R ={function ()
                crates.open_repository()
            end, "Open Repository"},
            e ={function ()
                crates.expand_plain_crate_to_inline_table()
            end, "Expand Crate to Inline Table"},
            E ={function ()
                crates.extract_crate_into_table()
            end, "Extract Crate Into Table"},
            v ={function ()
                crates.show_versions_popup()
                crates.show_versions_popup()
            end, "Versions"},
            f ={function ()
                crates.show_features_popup()
                crates.show_features_popup()
            end, "Features"},
            d ={function ()
                crates.show_dependencies_popup()
                crates.show_dependencies_popup()
            end, "Dependencies"},
            t ={function ()
                crates.toggle()
            end, "Toggle Crates"},
        },
    },
}
wk.setup(conf)
wk.register(normal_mappings, normal_opts)
