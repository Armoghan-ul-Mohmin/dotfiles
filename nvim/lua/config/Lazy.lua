local M = {}

-- ============================== Plugin Specifications ==============================
-- Define the plugin specifications to load from a separate plugins file
M.spec = {
    { import = "plugins" }  -- Import plugins defined in the 'plugins.lua' file
}

-- ============================== Installation Settings ==============================
-- Define the colorscheme to be used when installing plugins
M.install = {
    colorscheme = { "catppuccin-mocha" }  -- Set the colorscheme to 'catppuccin-mocha'
}

-- ============================== Update Checker ==============================
-- Automatically check for plugin updates
M.checker = {
    enabled = true  -- Enable automatic checking for updates
}

-- ============================== Default Settings ==============================
-- Define default settings for plugin loading
M.defaults = {
    lazy = true,  -- Enable lazy loading for performance optimization
}

-- ============================== Performance Settings ==============================
-- Configure performance-related settings
M.performance = {
    cache = {
        enabled = true,  -- Enable caching for faster loading times
    }
}

-- ============================== UI Configuration ==============================
-- Configure UI settings for a better visual experience
M.ui = {
    icons = {
        -- Add Nerd Fonts icons for better visual representation
        ["cmd"] = "",         -- Code icon
        ["keymap"] = "",      -- Keymap icon
        ["plugin"] = "",      -- Plugin icon
        ["git"] = "",         -- Git icon
        ["config"] = "",      -- Configuration icon
        ["check"] = "✓",       -- Check icon
        ["error"] = "✖",       -- Error icon
        ["warning"] = "⚠",     -- Warning icon
    }
}

-- Return the configuration table
return M
