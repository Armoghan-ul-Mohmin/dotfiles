return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            lazy = true,
        },
    },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "NvimTree", "alpha" },
                    winbar = {},
                },
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    { "branch", icon = "" },
                    "diff",
                    {
                        "diagnostics",
                        sources = { "nvim_lsp", "nvim_diagnostic" },
                        symbols = { error = " ", warn = " ", info = " " },
                    },
                },
                lualine_c = {
                    { "filename", file_status = true, path = 1 },
                },
                lualine_x = {
                    "encoding",
                    { "fileformat", icons = { unix = "LF", dos = "CRLF", mac = "CR" } },
                    "filetype",
                    { "progress", separator = { left = "", right = "" } },
                },
                lualine_y = {
                    { "location", padding = 1 },
                    { "progress", color = { fg = "#ff9e64" } },
                },
                lualine_z = {
                    "hostname",
                    { "date", format = "%d/%m/%Y %H:%M:%S", icon = "🕒" },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {
                lualine_a = {
                    {
                        "buffers",
                        icons_enabled = true,
                        show_modified = true,
                    },
                },
            },
            winbar = {
                lualine_c = {
                    {
                        path = 1,
                        shorting_target = 40,
                        symbols = {
                            modified = "●",
                        },
                    },
                },
            },
            inactive_winbar = {
                lualine_c = { "filename" },
            },
            extensions = { "fugitive" },
        })
    end,
}
