return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    require "telescope".setup {
        pickers = { buffers = { initial_mode = "normal" } },
        defaults = {
            mappings = {
                i = {
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                },
            },
        },
        extensions = {
            bibtex = {
                depth = 1,
                global_files = {
                    "/mnt/data/Documents/git/leon-hons-project/project_v2/project.bib"
                },
                citation_max_auth = 2,
                context = false,
                context_fallback = true,
                wrap = false,
            }
        }
    },
    require('telescope').load_extension("bibtex"),
}
