return {
    'KadoBOT/nvim-spotify',
    lazy = true,
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function()
        local spotify = require 'nvim-spotify'

        spotify.setup {}
    end,
    build = 'make'
}
