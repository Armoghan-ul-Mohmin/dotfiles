local cmd = vim.cmd

-- ===========================
-- Diagnostic Signs
-- ===========================

cmd([[
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.o.updatetime = 200
