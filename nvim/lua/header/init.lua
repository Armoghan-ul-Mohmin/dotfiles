local M = {}

-- Function to get the Git username
local function get_git_username()
    local username = vim.fn.system("git config user.name"):gsub("\n", "")
    if username == "" then
        username = vim.fn.input("Enter Author Name: ")
    end
    return username
end

-- Function to insert the header
function M.insert_header()
    local filename = vim.fn.expand('%:t')
    local author = get_git_username()
    local license = vim.fn.input("Enter License: (MIT, GPL, Apache-2.0, BSD, Creative Commons) ")
    local usage = vim.fn.input("Enter Usage: ")
    local os = vim.fn.input("Enter Operating System: (Linux, Windows, macOS, Other) ")
    local description = vim.fn.input("Enter Description: ")

    -- Define the shebang based on the file type
    local shebang = ""
    local filetype = vim.bo.filetype
    if filetype == "python" then
        shebang = "#!/usr/bin/env python3\n"
    elseif filetype == "bash" then
        shebang = "#!/bin/bash\n"
    elseif filetype == "lua" then
        shebang = "#!/usr/bin/env lua\n"
    elseif filetype == "javascript" then
        shebang = "#!/usr/bin/env node\n"
    elseif filetype == "ruby" then
        shebang = "#!/usr/bin/env ruby\n"
    end

    -- Create the header string
    local header = string.format([[
%s# Filename: %s
# Author: %s
# License: %s
# Usage: %s
# Operating System: %s
# Description: %s
]], shebang, filename, author, license, usage, os, description)

    -- Insert header at the top of the file
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.split(header, '\n')
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, lines)
    print("Header inserted.")
end

-- Autocommand to insert header on new file creation
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = { "*.py", "*.lua", "*.sh", "*.js", "*.rb" }, -- Add your desired file types
    callback = function()
        M.insert_header()
    end
})

return M
