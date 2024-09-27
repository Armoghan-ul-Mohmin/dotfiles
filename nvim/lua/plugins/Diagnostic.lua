return {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = {
        "kyazdani42/nvim-web-devicons",
        lazy = true,
    },
    config = function()
        require("trouble").setup({

            use_diagnostic_signs = true,
            position = "bottom",
            height = 10,
            width = 50,
            action_keys = {
                close = "<esc>",
                cancel = "q",
                refresh = "r",
                jump = { "<cr>", "<tab>" },
                open_split = { "<c-x>" },
                open_vsplit = { "<c-v>" },
                open_tab = { "<c-t>" },
                jump_close = { "o" },
                toggle_mode = "m",
                toggle_preview = "P",
                hover = "K",
                preview = "p",
                close_folds = { "zM", "zm" },
                open_folds = { "zR", "zr" },
                toggle_fold = { "zA", "za" },
                previous = "k",
                next = "j",
            },
            signs = {
                error = "",
                warning = "",
                hint = "",
                information = "",
            },
        })
    end,
}
