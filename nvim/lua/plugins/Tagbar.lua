return {
    "preservim/tagbar",
    event = "VeryLazy",
    config = function()
        vim.g.tagbar_autofocus = 0
        vim.g.tagbar_ctags_bin = "ctags"
        vim.g.tagbar_ctags_args = { "--fields=+l", "--exclude=.git", "--exclude=node_modules" }
        vim.g.tagbar_width = 25
        vim.g.tagbar_sort = 0
        vim.g.tagbar_show_ctagsof = 1
    end,
}
