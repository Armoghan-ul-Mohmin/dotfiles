return {
    "folke/noice.nvim",
    event = "VimEnter",
    dependencies = {
        {
            "MunifTanjim/nui.nvim",
            lazy = true,
        },
        {
            "rcarriga/nvim-notify",
            lazy = true,
        },
    },
    config = function()
        vim.o.lazyredraw = false
        local noice = require("noice")
        noice.setup({

            lsp = {
                progress = {
                    enabled = true,
                    format = "LSP: %s",
                    format_done = "LSP Done",
                    format_failed = "LSP Failed",
                },
                hover = {
                    enabled = true,
                },
                signature = {
                    enabled = true,
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            notify = {
                enabled = true,
                timeout = 6000,
                icons = {
                    info = "ℹ️",
                    warn = "⚠️",
                    error = "❌",
                    success = "✅",
                },
                level = "info",
            },
            message = {
                view = "popup",
                timeout = 4000,
                border = "none",
                views = {
                    error = "popup",
                    warn = "popup",
                    info = "popup",
                },
            },
            history = {
                enabled = true,
                max_length = 1000,
                limit = 300,
                ignore = {
                    "messages",
                    "lsp",
                },
            },
            highlight = {
                border = "ErrorMsg",
                background = "Normal",
            },

        })
    end,
}
