return {
    cmd = {'lua-language-server'},
    filetypes = {'lua'},
    root_markers = {},
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
        },
    }
}
