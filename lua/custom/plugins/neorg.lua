return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            leon_neorg = "/data/Documents/git/leon-neorg",
                        },
                        default_workspace = "leon_neorg",
                        index = "index.norg",
                    },
                },
            },
        }
    end,
}
