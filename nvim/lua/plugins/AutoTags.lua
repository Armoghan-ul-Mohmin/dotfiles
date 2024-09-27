return {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
        require('nvim-ts-autotag').setup({
            filetypes = {
                "html",
                "xml",
                "vue",
                "jsx",
                "tsx",
                "php",
                "markdown",
                "svelte",
                "astro",
                "elixir",
                "erb",
            },
            close_on_slash = true,
            rename = {
                enable = true,
                auto_rename = true,
                keymaps = {

                    ["<C-r>"] = ":lua require('nvim-ts-autotag').rename()<CR>",
                },
            },
            enable = true,
            debug = false,
            skip_tags = {
                "area", "base", "br", "col", "embed", "hr", "img", "input",
                "link", "meta", "param", "source", "track", "wbr",
            },
        })
    end
}
