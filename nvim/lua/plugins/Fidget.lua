return {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
        require("fidget").setup({
            text = {
                spinner = "dots",
                done = "✔️",
                commenced = "Started...",
                completed = "Completed!",
                message = "In progress...",
            },
            align = {
                bottom = true,
                right = true,
            },
            window = {
                blend = 0,
            },
            progress = {
                poll_rate = 100,
                suppress_on_insert = false,
                ignore_done_already = false,
                ignore_empty_message = false,
            },
            hooks = {
                before = function()
                    print("Starting LSP operation...")
                end,
                after = function()
                    print("LSP operation finished.")
                end,
            },
            statusline = {
                enabled = true,
                message = "LSP active",
            }
        })
    end
}
