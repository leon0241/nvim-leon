return {
    language = "en-GB",
    disabledRules = {
      ['en-GB'] = {"OXFORD_SPELLING_Z_NOT_S", "MORFOLOGIK_RULE_EN_US"},
    },
    dictionary = {
      ['en-GB'] = {"iff", "Hausdorff", "WTS", "bisimulation", "Sylow", "bisimilar", "bisimilarity"},
      ['en-US'] = {"bisimilar", "bisimilarity", "bisimulation"},
    },
    additionalRules = {
      languageModel = "~/ngrams/",
      enablePickyRules = true
    },
}
