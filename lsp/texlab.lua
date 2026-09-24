return {
    cmd = { 'texlab' },

    -- Filetypes to automatically attach to.

    filetypes = { 'tex' , 'plaintex'},

    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    settings = {
    },
}


-- Texlab settings 
-- {
--   definitionProvider = true,
--   documentFormattingProvider = true,
--   documentHighlightProvider = true,
--   documentLinkProvider = {
--     resolveProvider = false
--   },
--   documentSymbolProvider = true,
--   executeCommandProvider = {
--     commands = { "texlab.cleanAuxiliary", "texlab.cleanArtifacts", "texlab.changeEnvironment", "texlab.findEnvironments", "texlab.showDependencyGraph", "texlab.cancelBuild" }
--   },
--   experimental = {
--     textDocumentBuild = true,
--     textDocumentForwardSearch = true
--   },
--   foldingRangeProvider = true,
--   hoverProvider = true,
--   inlayHintProvider = true,
--   referencesProvider = true,
--   renameProvider = {
--     prepareProvider = true
--   },
--   textDocumentSync = {
--     change = 2,
--     openClose = true,
--     save = {
--       includeText = false
--     }
--   },
--   workspaceSymbolProvider = true
