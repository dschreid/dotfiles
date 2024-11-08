return {
    { "projekt0n/github-nvim-theme" },
    { "sainnhe/gruvbox-material" },
    { "rose-pine/neovim" },
    { "rebelot/kanagawa.nvim" },
    { "arturgoms/moonbow.nvim", },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            no_italic = true,
            term_colors = true,
            transparent_background = false,
            styles = {
                comments = {},
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
            },
            color_overrides = {
                mocha = {
                    base = "#000000",
                    mantle = "#000000",
                    crust = "#000000",
                },
            },
            -- integrations = {
            --     telescope = {
            --         enabled = true,
            --         style = "nvchad",
            --     },
            --     dropbar = {
            --         enabled = true,
            --         color_mode = true,
            --     },
            -- },
        },

    },
    {
        "ayu-theme/ayu-vim",
        priority = -100,
        config = function()
            vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "#e5e5e5" })      -- Color for module paths in imports
            vim.api.nvim_set_hl(0, "@lsp.type.struct.rust", { fg = "#f6993f" })    -- Color for module paths in imports
            vim.api.nvim_set_hl(0, "@lsp.type.interface.rust", { fg = "#f6993f" }) -- Color for module paths in imports

            vim.api.nvim_set_hl(0, "@lsp.type.namespace.java", { fg = "#e5e5e5" })
            vim.api.nvim_set_hl(0, "@lsp.type.class.java", { fg = "#f6993f" })
            vim.api.nvim_set_hl(0, "@lsp.type.interface.java", { fg = "#f6993f" })

            vim.api.nvim_set_hl(0, "Operator", { fg = "#e5e5e5" }) -- Color for module paths in imports
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup()
        end
    },
}
