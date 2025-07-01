require("pantoine.remap")
require("pantoine.set")
require("pantoine.lazy_init")

local augroup = vim.api.nvim_create_augroup
local PantoineGroup = augroup('Pantoine', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


autocmd('LspAttach', {
    group = PantoineGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "go", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gO", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ra", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>fo", function() vim.lsp.buf.format() end, opts)

        vim.keymap.set("n", "<leader>st", vim.cmd.vsplit, opts)
        vim.keymap.set("n", "<leader>so", vim.cmd.only, opts)
        vim.keymap.set("n", "<leader>sr", vim.cmd.close, opts)
    end
})
