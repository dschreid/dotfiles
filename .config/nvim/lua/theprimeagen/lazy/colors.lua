return {
    { "projekt0n/github-nvim-theme" },
    { "sainnhe/gruvbox-material" },
    { "rose-pine/neovim" },
    { "rebelot/kanagawa.nvim" },
    { "arturgoms/moonbow.nvim", },
    { "aktersnurra/no-clown-fiesta.nvim", },
    { "morhetz/gruvbox", },
    { "folke/tokyonight.nvim", },
    { "tiagovla/tokyodark.nvim", },
    { "AlexvZyl/nordic.nvim", },
    { "Mofiqul/vscode.nvim", },
    { "oxfist/night-owl.nvim", },
    { "vague2k/vague.nvim", },
    { "ficcdaf/ashen.nvim", },
    {
        "Mofiqul/dracula.nvim",
        dependencies = { "rktjmp/lush.nvim" }
    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = false,      -- Disable setting background
                    terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                },
                palettes = {
                    terafox = {
                        bg1 = "#1c1c1c", -- Black background
                        bg0 = "#2c2c2c", -- Alt backgrounds (floats, statusline, ...)
                        bg3 = "#2c2c2c", -- 55% darkened from stock
                        sel0 = "#2c2c2c", -- 55% darkened from stock
                    },
                },
            })
        end,
    },
    {
        "metalelf0/jellybeans-nvim",
        dependencies = { "rktjmp/lush.nvim" },
        config = function()
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "jellybeans-nvim",
                callback = function()
                    vim.api.nvim_set_hl(0, "special", { fg = "#7998c2" })
                    vim.api.nvim_set_hl(0, "type", { fg = "#ffb964" })
                end,
            })
        end
    },
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
                -- mocha = {
                --     base = "#000000",
                --     mantle = "#000000",
                --     crust = "#000000",
                -- },
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
            -- vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "#e5e5e5" })      -- Color for module paths in imports
            -- vim.api.nvim_set_hl(0, "@lsp.type.struct.rust", { fg = "#f6993f" })    -- Color for module paths in imports
            -- vim.api.nvim_set_hl(0, "@lsp.type.interface.rust", { fg = "#f6993f" }) -- Color for module paths in imports
            --
            -- vim.api.nvim_set_hl(0, "@lsp.type.namespace.java", { fg = "#e5e5e5" })
            -- vim.api.nvim_set_hl(0, "@lsp.type.class.java", { fg = "#f6993f" })
            -- vim.api.nvim_set_hl(0, "@lsp.type.interface.java", { fg = "#f6993f" })
            --
            -- vim.api.nvim_set_hl(0, "Operator", { fg = "#e5e5e5" }) -- Color for module paths in imports
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
