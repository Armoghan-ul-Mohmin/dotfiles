return {
    "williamboman/mason.nvim",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            lazy = true,
        },
        {
            "neovim/nvim-lspconfig",
            lazy = true,
        },
    },
    event = "VeryLazy",
    lazy = true,
    config = function()
        -- Setup LSP servers
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        require("mason").setup({

            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✔",
                    package_pending = "➜",
                },
            },
        })

        mason_lspconfig.setup({
            automatic_installation = true,
            ensure_installed = {
                -- LSPs
                "bashls",        -- Bash
                "powershell_es", -- PowerShell
                "html",          -- HTML
                "cssls",         -- CSS
                "eslint",        -- ESLint for JavaScript/TypeScript
                "lua_ls",        -- Lua
                "gopls",         -- Go
                "pyright",       -- Python
                "tailwindcss",   -- Tailwind CSS
                "clangd",        -- C/C++
                "jsonls",        -- JSON
                "dockerls",      -- Dockerfile
                "marksman",      -- Markdown
            },
        })

        -- Automatically set up LSP servers with default config
        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({})
            end,
        })
    end
}
