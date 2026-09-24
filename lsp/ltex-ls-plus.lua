return {
    cmd = { 'ltex-ls-plus' },

    -- Filetypes to automatically attach to.

    filetypes = { 'tex' , 'plaintex'},

    settings = {
        ltex = {
            language = 'en-GB',
            enabled = { "tex", "latex", "bibtex", "markdown", "plaintex" },
            disabledRules = {
                ['en-GB'] = { 'OXFORD_SPELLING_Z_NOT_S', 'MORFOLOGIK_RULE_EN_US' },
            },
            dictionary = {
                ['en-GB'] = { 'iff', 'Hausdorff', 'WTS', 'bisimulation', 'Sylow', 'bisimilar', 'bisimilarity' },
            },
            -- java = {
            --     path = '/usr/lib/jvm/java-21-microsoft-openjdk/bin',
            -- },
            additionalRules = {
                -- languageModel = '~/ngrams/',
                enablePickyRules = true,
            },
        }
    },
}
