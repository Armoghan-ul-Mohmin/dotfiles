local map = vim.keymap.set

-- ===========================
-- Key mappings for Telescope
-- ===========================

-- File Navigation
map("n", "<leader>tf", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true, desc = "Find files" })
map("n", "<leader>tr", ":Telescope oldfiles<CR>", { noremap = true, silent = true, desc = "Open recent files" })
map("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true, desc = "List open buffers" })
map("n", "<leader>te", "<cmd>Telescope file_browser<CR>", { noremap = true, silent = true, desc = "File browser" })

-- Text Search
map("n", "<leader>tg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Search text in files" })
map("n", "<leader>tw", ":Telescope grep_string<CR>", { noremap = true, silent = true, desc = "Search word under cursor" })
map("n", "<leader>tl", ":Telescope current_buffer_fuzzy_find<CR>",
    { noremap = true, silent = true, desc = "Fuzzy find in current buffer" })

-- Help & Documentation
map("n", "<leader>th", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true, desc = "Search help tags" })
map("n", "<leader>tH", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true, desc = "List all help tags" })
map("n", "<leader>tK", "<cmd>Telescope keymaps<CR>", { noremap = true, silent = true, desc = "List all key mappings" })
map("n", "<leader>tC", "<cmd>Telescope command_history<CR>",
    { noremap = true, silent = true, desc = "View command history" })

-- Git
map("n", "<leader>tg", "<cmd>Telescope git_commits<CR>", { noremap = true, silent = true, desc = "List git commits" })
map("n", "<leader>ts", "<cmd>Telescope git_status<CR>", { noremap = true, silent = true, desc = "Show git status" })
map("n", "<leader>tS", "<cmd>Telescope git_stashes<CR>", { noremap = true, silent = true, desc = "List git stashes" })
map("n", "<leader>tb", "<cmd>Telescope git_branches<CR>", { noremap = true, silent = true, desc = "Switch branches" })

-- LSP
map("n", "<leader>tR", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true, desc = "Show references" })
map("n", "<leader>tI", "<cmd>Telescope lsp_implementations<CR>",
    { noremap = true, silent = true, desc = "List implementations" })

-- Search History
map("n", "<leader>tq", "<cmd>Telescope search_history<CR>", { noremap = true, silent = true, desc = "Search history" })

-- Miscellaneous
map("n", "<leader>tm", ":Telescope marks<CR>", { noremap = true, silent = true, desc = "List marks" })
map("n", "<leader>td", ":Telescope diagnostics<CR>", { noremap = true, silent = true, desc = "Show diagnostics" })
map("n", "<leader>tN", "<cmd>Telescope notify<CR>", { noremap = true, silent = true, desc = "List notifications" })
