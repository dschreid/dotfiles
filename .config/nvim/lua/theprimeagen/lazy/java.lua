return {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
        {
            "neovim/nvim-lspconfig",
            opts = {
                servers = {
                    jdtls = {
                        -- your jdtls configuration goes here
                        -- cmd = {
                        --     'java',
                        --     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                        --     '-Dosgi.bundles.defaultStartLevel=4',
                        --     '-Declipse.product=org.eclipse.jdt.ls.core.product',
                        --     '-Dlog.protocol=true',
                        --     '-Dlog.level=ALL',
                        --     '-Xms4g',
                        --     '--add-modules=ALL-SYSTEM',
                        --     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                        --     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                        --     '-javaagent:' .. os.getenv("HOME") .. '/Coding/libs/lombok.jar',
                        --     '-jar', os.getenv("HOME") .. '/Coding/libs/jdt/plugins/org.eclipse.equinox.launcher.jar',
                        --     '-configuration', os.getenv("HOME") .. '/Coding/libs/jdt/config\_linux',
                        --     '-data', workspace_dir
                        --
                        -- },
                    },
                },
                setup = {
                    jdtls = function()
                        require("java").setup({
                            -- your nvim-java configuration goes here
                        })
                    end,
                },
            },
        },
    },
}
