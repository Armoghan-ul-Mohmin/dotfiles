return {
    "https://codeberg.org/esensar/nvim-dev-container",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
    },
    config = function()
        require("devcontainer").setup({

        })
    end,
}
