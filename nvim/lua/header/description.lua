local M = {}

function M.get_description()
    local prompt_message =
        [[
Please enter a description for the file. The description should provide a brief and clear summary of the file's purpose, functionality, or content.

Consider including:
- What the file does.
- Any specific functionality or feature it provides.
- Important details or notes about the file.

If unsure, a simple overview or a short sentence will suffice.

Description: ]]

    local description = vim.fn.input(prompt_message)
    vim.cmd("redraw!")
    vim.g.file_description = description
    return description
end

return M