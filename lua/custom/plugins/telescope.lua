return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    require "telescope".setup {
        pickers = { buffers = { initial_mode = "normal" } }
    }
}
