return {
   {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                    "csharp_ls",
                    "gdscript"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.lsp.enable('gopls')
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('csharp_ls')
            vim.lsp.enable('gdscript')
            vim.lsp.config('gdscript', {
                capabilities = capabilities,
                cmd = {"ncat", "127.0.0.1", "6006"}
            })
            vim.lsp.config('csharp_ls', {
                capabilities = capabilities
            })
            vim.lsp.config('lua_ls', {
                capabilities = capabilities
            })
            vim.lsp.config('gopls', {
                capabilities = capabilities
            })
            vim.keymap.set('i', '<C-Space>', function()
                vim.lsp.completion.get()
            end)
        end
    }
}
