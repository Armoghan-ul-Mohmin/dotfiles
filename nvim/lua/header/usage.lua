local M = {}

function M.get_usage()
    local prompt_message =
        [[
Please enter the usage instructions for the file. This should describe how the file or script should be used, including any command-line arguments or specific steps needed.

Consider including:
- How to execute or run the file.
- Any required parameters or options.
- Example commands or typical use cases.

If unsure, provide a brief overview or basic instructions.

Usage: ]]
    local usage = vim.fn.input(prompt_message)
    vim.cmd("redraw!")
    vim.g.file_usage = usage
    return usage
end

return M