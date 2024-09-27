return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            lazy = true,
        },
    },
    config = function()
        local status_ok, alpha = pcall(require, "alpha")

        local dashboard = require("alpha.themes.dashboard")

        -- Customize header
        dashboard.section.header.val = {
            "                                                                                 ",
            "                                                                                 ",
            "                                                                                 ",
            "                                                                                 ",
            "                                                                                 ",
            "                                                                                 ",
            "   █████████                                         █████                       ",
            "  ███░░░░░███                                       ░░███                        ",
            " ░███    ░███████████ █████████████   ██████  ███████░███████   ██████ ████████  ",
            " ░██████████░░███░░██░░███░░███░░███ ███░░██████░░███░███░░███ ░░░░░██░░███░░███ ",
            " ░███░░░░░███░███ ░░░ ░███ ░███ ░███░███ ░██░███ ░███░███ ░███  ███████░███ ░███ ",
            " ░███    ░███░███     ░███ ░███ ░███░███ ░██░███ ░███░███ ░███ ███░░███░███ ░███ ",
            " █████   █████████    █████░███ ████░░██████░░███████████ ████░░███████████ █████",
            "░░░░░   ░░░░░░░░░    ░░░░░ ░░░ ░░░░░ ░░░░░░  ░░░░░██░░░░ ░░░░░ ░░░░░░░░░░░ ░░░░░ ",
            "                                             ███ ░███                            ",
            "                                            ░░██████                             ",
            "                                             ░░░░░░                              ",
            "                                                                                 ",
            "                                                                                 ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
            dashboard.button("r", "   Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("w", "  Find Word", ":Telescope live_grep<CR>"),
            dashboard.button("b", "  Bookmarks", ":Telescope marks<CR>"),
            dashboard.button("t", "  Themes", ":Themery<CR>"),
            dashboard.button("e", "  File Explorer", ":Neotree filesystem<CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }


        alpha.setup(dashboard.config)
    end,
}
