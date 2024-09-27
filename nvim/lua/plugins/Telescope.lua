return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            lazy = true,
        },
        {
            "nvim-telescope/telescope-fzy-native.nvim",
            lazy = true,
        },
        {
            "nvim-telescope/telescope-file-browser.nvim",
            lazy = true,
        },
        {
            "nvim-tree/nvim-web-devicons",
            lazy = true,
        }
    },
    config = function()
        local telescope = require("telescope")
        local icons = require("nvim-web-devicons")

        telescope.setup({
            defaults = {
                prompt_prefix = " 🔍  ",
                selection_caret = "➜ ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "descending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        mirror = false,
                        height = 0.9,
                    },
                    vertical = {
                        mirror = false,
                    }
                },
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                color_devicons = true,
                use_less = true,
                prompt_title = "🔍 Search",
                results_title = "📂 Results",
                preview_title = "👁 Preview",
                set_env = {
                    ["COLORTERM"] = "truecolor",
                },
                file_ignore_patterns = {
                    -- General Project Files
                    ".git/",
                    "node_modules/",
                    "dist/",
                    "build/",
                    "out/",
                    "__pycache__/",
                    "env/",
                    "venv/",
                    ".venv/",
                    "logs/",
                    "coverage/",
                    "tmp/",
                    "cache/",
                    "public/",
                    "lib/",
                    ".idea/",
                    "*.lock",
                    "*.log",
                    "*.class",
                    "*.pyc",
                    "*.bak",
                    "*.tmp",
                    "*.swp",
                    "*.swo",
                    "*.out",
                    "*.exe",
                    "*.dll",
                    "*.so",
                    "thumbs.db",
                    "*.dSYM/",
                    -- Other file types...
                },
                -- Add custom entry format to include icons
                entry_maker = function(entry)
                    local value = entry.value
                    local display = value
                    local icon = icons.get_icon(value)
                    if icon then
                        display = icon .. " " .. value
                    end
                    return {
                        value = value,
                        display = display,
                        ordinal = value,
                    }
                end,
            },
            extensions = {
                file_browser = {
                    theme = "dropdown",
                    hijack_netrw = true,
                    previewer = false,
                },
                fzy_native = {
                    override_generic_sorter = true,
                    override_file_sorter = true,
                },
            },
        })

        -- Load extensions
        telescope.load_extension("fzy_native")
        telescope.load_extension("file_browser")
    end,
}
