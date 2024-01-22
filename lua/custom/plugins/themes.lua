return {
    -- Dracula
    -- 'navarasu/onedark.nvim',

    -- Dracula
    'mofiqul/dracula.nvim',
    priority = 1000,
    config = function()
    vim.cmd.colorscheme 'dracula'
    end,
}
