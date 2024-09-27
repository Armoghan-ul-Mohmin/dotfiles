local map = vim.keymap.set

-- ===========================
-- Diagnostics keybindings
-- ===========================
map(
    "n",
    "<leader>dp",
    ":lua vim.diagnostic.goto_prev()<CR>",
    { noremap = true, silent = true, desc = "Previous Diagnostic" }
)
map(
    "n",
    "<leader>dn",
    ":lua vim.diagnostic.goto_next()<CR>",
    { noremap = true, silent = true, desc = "Next Diagnostic" }
)
map("n", "<leader>ds", "<cmd>Trouble symbols toggle<cr>", { noremap = true, silent = true, desc = "Symbols (Trouble)" })
map(
    "n",
    "<leader>dX",
    "<cmd>Trouble diagnostics toggle<cr>",
    { noremap = true, silent = true, desc = "Diagnostics (Trouble)" }
)
map(
    "n",
    "<leader>dx",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { noremap = true, silent = true, desc = "Buffer Diagnostics (Trouble)" }
)
map(
    "n",
    "<leader>dQ",
    "<cmd>Trouble qflist toggle<cr>",
    { noremap = true, silent = true, desc = "Quickfix List (Trouble)" }
)
map(
    "n",
    "<leader>dS",
    "<cmd>Trouble lsp toggle<cr>",
    { noremap = true, silent = true, desc = "LSP References/Definitions (Trouble)" }
)
map(
    "n",
    "<leader>dv",
    ":lua vim.diagnostic.config({virtual_text = not vim.diagnostic.config().virtual_text})<CR>",
    { noremap = true, silent = true, desc = "Toggle Diagnostic Virtual Text" }
)
