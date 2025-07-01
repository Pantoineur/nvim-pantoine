return {
    'leoluz/nvim-dap-go',
    config = function ()
        local dap_go = require('dap-go')
        local dap = require('dap')
        local dap_ui = require('dapui')

        dap_go.setup()


        vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
        vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
        vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })

        -- For One
        table.insert(dap.configurations.go, {
            type = 'delveone',
            name = 'One CONTAINER debugging',
            mode = 'remote',
            request = 'attach',
            substitutePath = {
                { from = '${workspaceFolder}', to = '/path/in/container' },
            },
        })

        -- adapters configuration
        dap.adapters.delveone = {
            type = 'server',
            host = '127.0.0.1',
            port = '2345'
        }

        dap_ui.setup({
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 0.35
                        },
                        {
                            id = "breakpoints",
                            size = 0.30,
                        },
                        {
                            id = "repl",
                            size = 0.35,
                        },
                    },
                    position = "right",
                    size = 50,
                },
            },
        })
    end
}
