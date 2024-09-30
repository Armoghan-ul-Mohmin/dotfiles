-- ============================== Neovim Configuration ==============================
-- Welcome to my personalized Neovim (Nvim) configuration!
-- This setup is thoughtfully designed to enhance my coding experience across Linux and Windows platforms.
-- It incorporates a diverse array of plugins and customizations, all tailored to optimize my workflow
-- and align with my preferences.
-- This configuration reflects my ongoing journey in the world of Neovim, where continuous learning
-- and adaptation are key.
-- As I delve deeper into the intricacies of Nvim, I embrace the idea that a great configuration
-- is a deeply personal endeavor. What works for me may not resonate with everyone,
-- so I encourage you to explore and create your own setup based on your unique needs and experiences.
-- Expect regular updates and enhancements to this configuration as I refine my approach
-- and discover new tools and techniques.
-- My aim is to share insights and inspire others to embark on their own path of customization and efficiency.
-- Note: Remember, building an effective configuration is a journey filled with patience and experimentation.
-- Embrace the process, and let your creativity guide you!
-- Author: Armoghan-ul-Mohmin
-- ====================================================================================
-- Require necessary modules for configuration
require('Options')  -- Load custom options for Neovim settings
require('Keymaps')  -- Load custom key mappings
require("autocmds") -- Load custom autocmds
-- ============================== Lazy Plugin Manager ==============================

-- Set the path for Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." }
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

local config = require("config.Lazy")
require("lazy").setup(config)

-- =====================================================================================

-- ============================== Custom Mappings ==============================

require("mappings.Telescope")
require("mappings.Neotree")
require("mappings.Lazygit")
require("mappings.Diagnostic")
require("mappings.Lsp")

-- =====================================================================================


-- ==================================== File Header ====================================

-- Load custom headers module
local custom_headers = require("header")

-- Set up autocmd for BufNewFile
vim.api.nvim_create_autocmd(
    "BufNewFile",
    {
        pattern = "*",
        callback = function()
            custom_headers.insert_header()
        end
    }
)

-- =====================================================================================
