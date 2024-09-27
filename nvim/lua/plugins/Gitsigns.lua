return {
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            lazy = true,
        },
        config = function()
            -- Define highlight groups for GitSigns
            vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#8ec07c" })
            vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#fe8019" })
            vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#fb4934" })
            vim.api.nvim_set_hl(0, "GitSignsTopdelete", { link = "GitSignsDelete" })
            vim.api.nvim_set_hl(0, "GitSignsChangedelete", { link = "GitSignsChange" })

            require("gitsigns").setup({

                signs = {
                    add = { text = "" },
                    change = { text = "" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "" },
                },
                numhl = true,
                linehl = false,
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = true,

            })
        end,
    },
}
