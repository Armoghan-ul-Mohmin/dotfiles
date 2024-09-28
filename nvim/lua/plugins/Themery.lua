return {
    "zaldih/themery.nvim",
    event = "VimEnter",
    dependencies = {
        {
            "catppuccin/nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd.colorscheme("catppuccin")
                require("catppuccin").setup({
                    flavour = "macchiato",
                    transparent_background = false,
                    term_colors = true,
                    integrations = {
                        treesitter = true,
                        cmp = true,
                        lsp_trouble = true,
                        gitsigns = true,
                        telescope = true,
                        nvimtree = {
                            enabled = true,
                            show_root = true,
                            transparent_panel = false,
                        },
                        dashboard = true,
                        bufferline = true,
                    },
                    mocha = function(mocha)
                        return {
                            Comment = {
                                fg = mocha.overlay1,
                            },
                            Function = {
                                fg = mocha.blue,
                            },
                        }
                    end,
                })
            end,
        },
        {
            "folke/tokyonight.nvim",
            lazy = true,
            config = function()
                require("tokyonight").setup({
                    style = "storm",
                    transparent = false,
                    terminal_colors = true,
                    styles = {
                        comments = {
                            italic = true,
                        },
                        keywords = {
                            italic = true,
                        },
                        functions = {
                            bold = true,
                        },
                        sidebars = "dark",
                        floats = "dark",
                    },
                    sidebars = { "qf", "vista_kind", "terminal", "packer" },
                    lualine_bold = true,
                })
            end,
        },
        {
            "navarasu/onedark.nvim",
            lazy = true,
            config = function()
                vim.cmd.colorscheme("onedark")
                require("onedark").setup({
                    style = "cool",
                    transparent = false,
                    term_colors = true,
                    code_style = {
                        comments = "italic",
                        keywords = "bold",
                        functions = "bold",
                    },
                    lualine = {
                        transparent = false,
                    },
                })
            end,
        },
        {
            "Mofiqul/dracula.nvim",
            lazy = true,
            config = function()
                vim.cmd.colorscheme("dracula")
                require("dracula").setup({
                    show_end_of_buffer = true,
                    transparent_bg = false,
                    italic_comment = true,
                })
            end,
        },
        {
            "edeneast/nightfox.nvim",
            lazy = true,
            config = function()
                require("nightfox").setup({
                    options = {
                        transparent = false,
                        styles = {
                            comments = "italic",
                            keywords = "bold",
                        },
                    }
                })
            end,
        },
        {
            "ellisonleao/gruvbox.nvim",
            lazy = true,
            config = function()
                require("gruvbox").setup({
                    contrast = "hard", -- Options: 'soft', 'medium', 'hard'
                    transparent_mode = false,
                })
            end,
        },
    },
    config = function()
        require("themery").setup({
            themes = {
                { name = "Catppuccin", colorscheme = "catppuccin", before = [[vim.opt.background = "dark"]] },
                { name = "TokyoNight", colorscheme = "tokyonight", before = [[vim.opt.background = "dark"]] },
                { name = "TokyoLight", colorscheme = "tokyonight", before = [[vim.opt.background = "light"]] },
                { name = "OneDark",    colorscheme = "onedark",    before = [[vim.opt.background = "dark"]] },
                { name = "OneLight",   colorscheme = "onedark",    before = [[vim.opt.background = "light"]] },
                { name = "Dracula",    colorscheme = "dracula",    before = [[vim.opt.background = "dark"]] },
                { name = "NightFox",   colorscheme = "nightfox",   before = [[vim.opt.background = "dark"]] },
                { name = "Gruvbox",    colorscheme = "gruvbox",    before = [[vim.opt.background = "dark"]] },
            },
            livePreview = true,
        })
    end
}
