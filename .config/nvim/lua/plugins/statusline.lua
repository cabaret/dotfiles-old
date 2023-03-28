return {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons', 'KadoBOT/nvim-spotify'},
    opts = function()
        local spotify_status = require'nvim-spotify'.status
        local navic = require('nvim-navic')

        spotify_status:start()

        return {
            options = {theme = 'auto', globalstatus = true},
            sections = {
                lualine_x = {'fileformat', 'filetype', spotify_status.listen},
                lualine_z = {},
                lualine_c = {
                    {
                        function()
                            return navic.get_location()
                        end,
                        cond = function()
                            return navic.is_available()
                        end
                    }
                }
            }
        }
    end
}
