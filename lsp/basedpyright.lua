return {
    cmd = { 'basedpyright-langserver', '--stdio' },

    filetypes = { 'python' },

    root_markers = { '.git' },

    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    single_file_support = true,
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
}
