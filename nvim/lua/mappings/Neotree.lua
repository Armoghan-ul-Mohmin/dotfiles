local map = vim.keymap.set

-- ===========================
-- NeoTree Keybindings
-- ===========================
map("n", "<leader>n", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle NeoTree visibility" })
map(
    "n",
    "<leader>nf",
    ":Neotree focus<CR>",
    { noremap = true, silent = true, desc = "Focus on the currently selected node" }
)
map("n", "<leader>ns", ":Neotree filesystem<CR>", { noremap = true, silent = true, desc = "Open filesystem view" })
map(
    "n",
    "<leader>nt",
    ":Neotree reveal<CR>",
    { noremap = true, silent = true, desc = "Reveal current file in NeoTree" }
)
map(
    "n",
    "<leader>nb",
    ":Neotree buffers reveal right<CR>",
    { noremap = true, silent = true, desc = "Buffers view on the right side" }
)
