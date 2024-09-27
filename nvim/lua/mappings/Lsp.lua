local map = vim.keymap.set

-- ===========================
-- LSP keybindings
-- ===========================
map(
    "n",
    "<leader>lr",
    ":lua vim.lsp.buf.references()<CR>",
    { noremap = true, silent = true, desc = "Show LSP References" }
)
map(
    "n",
    "<leader>ld",
    ":lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true, desc = "Show LSP Definitions" }
)
map(
    "n",
    "<leader>ls",
    ":lua vim.lsp.buf.signature_help()<CR>",
    { noremap = true, silent = true, desc = "Show LSP Signature Help" }
)
map("n", "<leader>lw", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc = "Rename Symbol" })
map(
    "n",
    "<leader>la",
    ":lua vim.lsp.buf.code_action()<CR>",
    { noremap = true, silent = true, desc = "Show LSP Code Actions" }
)

map("n", "<leader>lc", ":lua vim.lsp.codelens.run()<CR>", { noremap = true, silent = true, desc = "Run CodeLens" })
map("n", "<leader>li", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "Show Hover Information" })
map("n", "<leader>lD", ":lua vim.lsp.buf.type_definition()<CR>",
    { noremap = true, silent = true, desc = "Show Type Definition" })
map("n", "<leader>lI", ":lua vim.lsp.buf.implementation()<CR>",
    { noremap = true, silent = true, desc = "Show Implementations" })

-- ===========================
-- Format buffer
-- ===========================
map("n", "<leader>f", ":lua vim.lsp.buf.format({ async = true })<CR>",
    { noremap = true, silent = true, desc = "Format Buffer" })
