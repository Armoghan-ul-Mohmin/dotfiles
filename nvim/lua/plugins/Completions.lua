return {
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = {
            {
                "saadparwaiz1/cmp_luasnip",
                lazy = true,
            },
            {
                "rafamadriz/friendly-snippets",
                lazy = true,
            },
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "windwp/nvim-autopairs",
        lazy = false,
        config = function()
            require("nvim-autopairs").setup({})
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            { "hrsh7th/cmp-path",     lazy = true },
            { "hrsh7th/cmp-buffer",   lazy = true },
            { "hrsh7th/cmp-nvim-lsp", lazy = true },
            { "hrsh7th/cmp-nvim-lua", lazy = true },
            { "hrsh7th/cmp-cmdline",  lazy = true },
            { "hrsh7th/cmp-emoji",    lazy = true },
            { "f3fora/cmp-spell",     lazy = true },
            { "codota/tabnine-nvim",  lazy = true },
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered({
                        border = "rounded",
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    }),
                    documentation = cmp.config.window.bordered({
                        border = "rounded",
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    }),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "tabnine" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                    { name = "emoji" },
                    { name = "spell" },
                    { name = "cmdline" },
                }),
            })
        end,
    },
}
