return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
      }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            find_command = { "fd", "--hidden", "--glob", "" },
          },
        }
      }
      require('telescope').load_extension('fzf')
    end

}
