return {
    {
        "ayu-theme/ayu-vim",
        priority = -100,
        config = function()
            vim.o.termguicolors = true
            vim.cmd([[colorscheme ayu]])

            vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "#e5e5e5" }) -- Color for module paths in imports
            vim.api.nvim_set_hl(0, "@lsp.type.struct.rust", { fg = "#f6993f" }) -- Color for module paths in imports
            vim.api.nvim_set_hl(0, "@lsp.type.interface.rust", { fg = "#f6993f" }) -- Color for module paths in imports
            vim.api.nvim_set_hl(0, "Operator", { fg = "#e5e5e5" }) -- Color for module paths in imports

        end
    },

    {
        "arturgoms/moonbow.nvim",
        config = function()
--            vim.o.termguicolors = true
--            vim.cmd([[colorscheme moonbow]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        options = {
            theme = 'moonbow'
        },
        config = function()
            require("lualine").setup()
        end
    }
}
