return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            lazy = true,
        },
        {
            "nvim-tree/nvim-web-devicons",
            lazy = true,
        },
        {
            "MunifTanjim/nui.nvim",
            lazy = true,
        },
        {
            "3rd/image.nvim",
            lazy = true,
        },
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                bindings = {
                    ["<space>"] = "toggle_node",
                    ["<cr>"] = "open",
                    ["<tab>"] = "preview",
                    ["<bs>"] = "navigate_up",
                    ["<c-r>"] = "refresh",
                },
                filtered_items = {
                    visible = true,
                    hide_gitignored = true,
                },
            },
            buffers = {
                show_unloaded = false,
            },
            git_status = {
                symbols = {
                    added = " ",
                    modified = " ",
                    removed = " ",
                    renamed = " ",
                    untracked = " ",
                },
            },
            window = {
                position = "left",
                width = 25,
            },
            icon = {
                highlight = "NeoTreeFileIcon",
            },
        })
    end,
}
