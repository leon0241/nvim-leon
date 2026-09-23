return {
    cmd = { 'emmylua_ls' },

    -- Filetypes to automatically attach to.

    filetypes = { 'lua' },

    -- Sets the workspace "root" to the directory where any of these files is found.

    -- Files sharing a root will reuse the LSP client/connection.

    -- Nested lists indicate equal priority, see |vim.lsp.Config|.

    root_markers = { { '.emmyrc.json', '.luarc.json' }, '.git' },

    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = {
                globals = { 'vim' },
            },
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
