local M = {}

function M.get_author_name()
    local handle = io.popen("git config user.name 2>/dev/null")
    local git_username = handle:read("*a"):gsub("%s+", "")
    handle:close()
    if git_username == "" then
        local prompt_message = "Git username not found. Please enter your name: "
        git_username = vim.fn.input(prompt_message)
        vim.cmd("redraw!")
    end
    return git_username
end

return M