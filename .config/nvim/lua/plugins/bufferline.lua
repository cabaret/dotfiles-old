return {
    'akinsho/bufferline.nvim',
    dependencies = {'nvim-tree/nvim-tree.lua', 'nvim-tree/nvim-web-devicons'},
    opts = function()
        return {
            options = {
                diagnostics = "coc",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true -- use a "true" to enable the default, or set your own character
                    }
                }
            },
            highlights = {buffer_selected = {italic = false}}
        }
    end,
    config = function (_, opts) 
        require('bufferline').setup(opts)
    end
}
