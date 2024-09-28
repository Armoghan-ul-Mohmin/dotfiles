return {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh ",
    event = "InsertEnter",
    config = function()
        require("tabnine").setup({
            disable_auto_comment = false,
            accept_keymap = "<C-j>",
            dismiss_keymap = "<C-k>",
            debounce_ms = 300,
            suggest = {
                from_omni = true,
                from_vim_lsp = true,
                from_tabnine = true,
            },
            max_num_results = 10,
            inline_snippet = true,
            experimental = {
                enable_advanced_snippets = true,
                auto_trigger = true,
            },
        })
    end,
}
