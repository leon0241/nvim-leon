return {
    cmd = { 'emmylua_ls' },

    -- Filetypes to automatically attach to.

    filetypes = { 'lua' },

    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    -- Sets the workspace "root" to the directory where any of these files is found.

    -- Files sharing a root will reuse the LSP client/connection.

    -- Nested lists indicate equal priority, see |vim.lsp.Config|.

    root_markers = { '.emmyrc.json', '.luarc.json', '.git' },

    settings = {
        emmylua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = {
                globals = { 'vim' },
            },
            codeLens = { enable = false },
            hint = { enable = true},

            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
            telemetry = { enable = false },
        },
    },
}
