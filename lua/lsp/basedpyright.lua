return {
    cmd = {"basedpyright"},
    filetypes = {"py"},
    root_markers = {},
    settings = {
        python = {
            analysis = {
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                    reportUnusedVariable = 'warning', -- or anything
                },
                typeCheckingMode = 'off',
            },
        },
    },
}
