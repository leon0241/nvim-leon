return {
    require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
        end,

        -- Time between the range to be highlighted and to be cleared while opening the folded line, `0` disables
        open_fold_hl_timeout = 400,

        -- Folds to close by default when the file opens
        close_fold_kinds_for_ft = {},

        -- Enables a function to capture the virtual text for the folded lines
        enable_get_fold_virt_text = false,

        -- Configure the options for preview window and remap the keys for current buffer and preview buffer if the preview window is displayed
        preview = {
            win_config = {
                border = 'rounded',
                winblend = 12,
                winhighlight = 20,
                maxheight = 20
            }
        }
    })
}
