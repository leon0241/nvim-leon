-- To use the most recent version from git, you can do simply:
vim.pack.add { "https://github.com/lervag/vimtex" }

-- VimTeX configuration goes here, e.g.
vim.g.vimtex_view_method = "zathura_simple"



-- Vimtex thingies

-- {
--   completionProvider = {
--     resolveProvider = true,
--     triggerCharacters = { "\\", "{", "}", "@", "/", " " }
--   },
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
