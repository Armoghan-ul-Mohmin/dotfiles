return {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true,
            disable_in_macro = false,
            fast_wrap = {
                check_comma = true,
                highlight = "Search",
            },
        })
    end
}
