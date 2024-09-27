return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
        {
            "p00f/nvim-ts-rainbow",
            lazy = true,
        },
        {
            "gko/vim-coloresque",
            lazy = true,
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            lazy = true,
        },
    },
    config = function()
        require("ibl").setup()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            sync_install = true,
            ensure_installed = {
                "lua",
                "bash",
                "markdown",
                "regex",
                "comment",
                "html",
                "typescript",
                "javascript",
                "tsx",
                "python",
                "cpp",
                "c",
                "ruby",
                "go",
                "json",
                "yaml",
                "toml",
                "css",
                "scss",
            }
            ,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            indent = {
                enable = true,
                disable = {
                    "yaml",
                    "python",
                },
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
                colors = {
                    "#ff0000",
                    "#ff7f00",
                    "#ffff00",
                    "#7fff00",
                    "#00ff00",
                    "#00ffff",
                    "#0000ff",
                    "#8b00ff",
                    "#ff00ff",
                    "#ff4500",
                    "#32cd32",
                    "#00bfff",
                    "#ff6347",
                    "#9932cc",
                    "#ff1493",
                    "#ff69b4",
                    "#ffb6c1",
                    "#e6e6fa",
                    "#dcdcdc",
                    "#d3d3d3",
                    "#f5deb3",
                    "#ffefd5",
                    "#ffe4e1",
                    "#f0e68c",
                },
            },
        })
    end,
}
