return {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
        {
            "nvimtools/none-ls.nvim",
            lazy = true,
        },
        {
            "nvim-lua/plenary.nvim",
            lazy = true,
        },
    },
    event = "VeryLazy",
    lazy = true,
    config = function()
        local null_ls = require("null-ls")

        require("mason-null-ls").setup({
            ensure_installed = {
                -- Formatters
                "prettier",     -- JavaScript/TypeScript
                "black",        -- Python
                "rubocop",      -- Ruby
                "shfmt",        -- Bash
                "stylua",       -- Lua
                "clang-format", -- C/C++
                "stylelint",    -- CSS
                "markdownlint", -- Markdown
                -- Linters
                "rubocop",      -- Ruby
                "mypy",         -- Python type checker
                "markdownlint", -- Markdown
                "stylelint",    -- CSS
                "yamllint",     -- YAML
            },
        })

        -- Set up null-ls sources with filetypes
        null_ls.setup({
            sources = {
                -- Formatters
                null_ls.builtins.formatting.prettier.with({ filetypes = { "javascript", "typescript", "json", "html", "css" } }),
                null_ls.builtins.formatting.black.with({ filetypes = { "python" } }),
                null_ls.builtins.formatting.rubocop.with({ filetypes = { "ruby", "rails" } }),
                null_ls.builtins.formatting.shfmt.with({ filetypes = { "sh", "bash" } }),
                null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" } }),
                null_ls.builtins.formatting.clang_format.with({ filetypes = { "c", "cpp" } }),
                null_ls.builtins.formatting.stylelint.with({ filetypes = { "css", "scss", "less" } }),
                null_ls.builtins.formatting.markdownlint.with({ filetypes = { "markdown", "md" } }),

                -- Linters
                null_ls.builtins.diagnostics.rubocop.with({ filetypes = { "ruby", "rails" } }),
                null_ls.builtins.diagnostics.mypy.with({ filetypes = { "python" } }),
                null_ls.builtins.diagnostics.markdownlint.with({ filetypes = { "markdown", "md" } }),
                null_ls.builtins.diagnostics.stylelint.with({ filetypes = { "css", "scss", "less" } }),
                null_ls.builtins.diagnostics.yamllint.with({ filetypes = { "yaml", "yml" } }),
            },
        })
    end,
}
