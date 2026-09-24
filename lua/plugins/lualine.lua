function isRecording ()
    local reg = vim.fn.reg_recording()
    if reg ~= "" then
        return "Recording @" .. reg
    else
        return ""
    end
end 

require('lualine').setup({
    options = {
        icons_enabled = true,
        -- theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
    },
    sections = {
        lualine_a = { { 'mode', right_padding = 2 } },
        lualine_b = { {'filename', separator = { right = '' }}},
        lualine_c = {
            isRecording, --[[ add your center components here in place of this comment ]]
        },
        -- lualine_d = {
        --     '%=', --[[ add your center components here in place of this comment ]]
        -- },
        lualine_x = { "lsp_status" },
        lualine_y = { {'filetype', separator = { left = ''}}, 'progress' },
        lualine_z = {
            { 'location', left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename'}, lualine_b = {}, lualine_c = {},
        lualine_x = {}, lualine_y = {}, lualine_z = { 'location' },
    },
    tabline = {},
})
