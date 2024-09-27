return {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    config = function()
        -- Set leader key for visual multi actions
        vim.g.VM_leader = '<C-n>' -- Default leader key for VM

        -- Keybindings to mimic VSCode behavior
        vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(VM-Add-Cursor)',
            { noremap = true, silent = true, desc = "Add a new cursor at the current position" })
        vim.api.nvim_set_keymap('n', '<C-u>', '<Plug>(VM-Remove-Cursor)',
            { noremap = true, silent = true, desc = "Remove the last cursor added" })
        vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(VM-Select-All)',
            { noremap = true, silent = true, desc = "Select all occurrences of the word under the cursor" })
        vim.api.nvim_set_keymap('n', '<C-e>', '<Plug>(VM-Next-Cursor)',
            { noremap = true, silent = true, desc = "Move to the next cursor" })
        vim.api.nvim_set_keymap('n', '<C-p>', '<Plug>(VM-Prev-Cursor)',
            { noremap = true, silent = true, desc = "Move to the previous cursor" })
    end
}
