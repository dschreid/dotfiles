return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "jiangmiao/auto-pairs",
        "numToStr/Comment.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                -- "jdtls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                -- ["perlpls"] = function()
                --     local lspconfig = require("lspconfig")
                --     lspconfig.perlpls.setup {
                --         settings = {
                --             pls = {
                --                 inc = { '~/local/lib/perl5/PLS' },                          -- add list of dirs to @INC
                --                 cwd = { '~/projects' },                                                       -- working directory for PLS
                --                 perlcritic = { enabled = true, perlcriticrc = '~/.perlcriticrc' },   -- use perlcritic and pass a non-default location for its config
                --                 syntax = { enabled = true, perl = '/usr/bin/perl', args = { 'arg1', 'arg2' } }, -- enable syntax checking and use a non-default perl binary
                --                 perltidy = { perltidyrc = '~/.perltidyrc' }                          -- non-default location for perltidy's config
                --             }
                --         }
                --     }
                -- end,
                --
                -- Add a handler for jdtls (Java LSP)
                -- ["jdtls"] = function()
                --     local home = os.getenv("HOME")
                --     local workspace_dir = home .. "/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
                --
                --     require("lspconfig").jdtls.setup({
                --         capabilities = capabilities,
                --         cmd = { "jdtls" },
                --         root_dir = require('lspconfig.util').root_pattern('.git', 'mvnw', 'gradlew', 'pom.xml',
                --             'build.gradle'),
                --         settings = {
                --             java = {
                --                 autobuild = {
                --                     enabled = false,
                --                 },
                --                 format = {
                --                     enabled = true,
                --                 },
                --             },
                --         },
                --         on_attach = function(client, bufnr)
                --             -- Enable codeLens for Java
                --             client.resolved_capabilities.document_code_lens = true
                --         end,
                --     })
                -- end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                ['<TAB>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        -- Commentary
        require('Comment').setup()
    end
}
