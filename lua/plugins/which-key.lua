local ok, wk = pcall(require, 'which-key')
if not ok then
    return
end
local c_ok, crates = pcall(require, 'crates')
if not c_ok then
    print("Something wrong with crates")
end

wk.add({
    wk.add({
  { "<leader>t", group = "Telescope" },
  { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>tl", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", mode = "n" },
  { "<leader>tr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files", mode = "n" },
  { "<leader>tn", "<cmd>enew<cr>", desc = "New File", mode = "n" },
  { "<leader>te", desc = "Edit File" },

  { "<leader>l", group = "LSP" },
  { "<leader>ll", function() require('lsp_lines').toggle() end, desc = "Toggle LSP Lines" },
  { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
  { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
  { "<leader>ls", group = "Symbols" },
  { "<leader>lsw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
  { "<leader>lsd", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },

  { "<leader>g", group = "Git" },
  { "<leader>gb", group = "Blame" },
  { "<leader>gbb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame Line" },
  { "<leader>gbl", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Blame" },
  { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
  { "<leader>gt", group = "Highlight" },
  { "<leader>gtn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "Toggle Num Highlight" },
  { "<leader>gtl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle Line Highlight" },
  { "<leader>gtw", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Toggle Word Diff" },

  { "<leader>d", group = "DAP" },
  { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
  { "<leader>ds", function()
      require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).open()
    end, desc = "Open DAP Sidebar" },
  { "<leader>dn", "<cmd>DapStepOut<cr>", desc = "Next Step" },
  { "<leader>dr", "<cmd>DapContinue<cr>", desc = "Run Debugger" },

  { "<leader>r", group = "Rust" },
  { "<leader>re", "<cmd>RustExpandMacro<cr>", desc = "Expand Macro" },
  { "<leader>rr", "<cmd>RustRunnables<cr>", desc = "Run" },
  { "<leader>rd", "<cmd>RustDebuggables<cr>", desc = "Debug" },
  { "<leader>rk", "<cmd>RustMoveItemUp<cr>", desc = "Move Up" },
  { "<leader>rj", "<cmd>RustMoveItemDown<cr>", desc = "Move Down" },
  { "<leader>rh", "<cmd>RustHoverActions<cr>", desc = "Hover Actions" },
  { "<leader>rp", "<cmd>RustParentModule<cr>", desc = "Parent Module" },

  { "<leader>rc", group = "Cargo" },
  { "<leader>rco", "<cmd>RustOpenCargo<cr>", desc = "Open Cargo.toml" },
  { "<leader>rcu", function() crates.upgrade_crate() end, desc = "Upgrade Crate" },
  { "<leader>rcU", function() crates.upgrade_all_crates() end, desc = "Upgrade All Crates" },
  { "<leader>rcD", function() crates.open_documentation() end, desc = "Documentation" },
  { "<leader>rcR", function() crates.open_repository() end, desc = "Repository" },
  { "<leader>rce", function() crates.expand_plain_crate_to_inline_table() end, desc = "Inline Table" },
  { "<leader>rcE", function() crates.extract_crate_into_table() end, desc = "Extract Table" },
  { "<leader>rcv", function() crates.show_versions_popup() end, desc = "Versions" },
  { "<leader>rcf", function() crates.show_features_popup() end, desc = "Features" },
  { "<leader>rcd", function() crates.show_dependencies_popup() end, desc = "Dependencies" },
  { "<leader>rct", function() crates.toggle() end, desc = "Toggle Crates" },
}, {
  mode = "n",
  silent = true,
  noremap = true,
})

})
