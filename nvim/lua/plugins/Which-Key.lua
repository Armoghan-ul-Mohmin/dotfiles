return {
    "folke/which-key.nvim",
    event = "VimEnter",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            lazy = true,
        },
        {
            "echasnovski/mini.nvim",
            lazy = true,
        },
    },
    config = function()
        local which_key = require("which-key")
        which_key.setup({
            show_help = true,
            show_default_keybindings = true,
            icons = {
                mappings = vim.g.have_nerd_font,
                keys = vim.g.have_nerd_font and {} or {
                    Up = "<Up> ",
                    Down = "<Down> ",
                    Left = "<Left> ",
                    Right = "<Right> ",
                    C = "<C-…> ",
                    M = "<M-…> ",
                    D = "<D-…> ",
                    S = "<S-…> ",
                    CR = "<CR> ",
                    Esc = "<Esc> ",
                    ScrollWheelDown = "<ScrollWheelDown> ",
                    ScrollWheelUp = "<ScrollWheelUp> ",
                    NL = "<NL> ",
                    BS = "<BS> ",
                    Space = "<Space> ",
                    Tab = "<Tab> ",
                    F1 = "<F1>",
                    F2 = "<F2>",
                    F3 = "<F3>",
                    F4 = "<F4>",
                    F5 = "<F5>",
                    F6 = "<F6>",
                    F7 = "<F7>",
                    F8 = "<F8>",
                    F9 = "<F9>",
                    F10 = "<F10>",
                    F11 = "<F11>",
                    F12 = "<F12>",
                },
            },

            spec = {
                { "<leader>t", group = "Open [T]elescope list" },
                { "<leader>n", group = "Open [N]eotree list" },
                { "<leader>d", group = "Open [D]iagnostic list" },
                { "<leader>g", group = "Open [L]azyGit list" },
                { "<leader>l", group = "Open [L]SP list" },
            },

        })
    end,
}
