return {
    -- Dracula
    -- 'navarasu/onedark.nvim',

    -- Dracula
    'maxmx03/dracula.nvim',
    priority = 1000,
    config = function()
    vim.cmd.colorscheme 'dracula'
    end,
}
