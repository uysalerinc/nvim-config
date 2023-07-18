local ok, dap = pcall(require, 'dap')
if not ok then
    print("miyav")
   return
end

local ui_ok, dapui = pcall(require, 'dapui')
if not ui_ok then
    print("Something wrong with Dab-UI")
end

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb',
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function ()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd().. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    }
}

dap.configurations.c = dap.configurations.cpp



dapui.setup()
dap.listeners.after.event_initialized['dapui_config']= function ()
   dapui.open()
end

dap.listeners.before.event_terminated['dapui_config']= function ()
   dapui.close()
end

dap.listeners.before.event_exited['dapui_config']= function ()
   dapui.close()
end
